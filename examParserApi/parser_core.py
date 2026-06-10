# parser_core.py
import subprocess
from docx import Document
from docx.shared import Inches
import os
import uuid
import hashlib
import re
import pymysql
import json
from qcloud_cos import CosConfig, CosS3Client

# COS 是否已有该对象
def object_exists(client, bucket, key):
    try:
        client.head_object(Bucket=bucket, Key=key)
        return True
    except Exception:
        return False

def get_cos_client():
    secret_id = os.environ.get('COS_SECRET_ID', '')
    secret_key = os.environ.get('COS_SECRET_KEY', '')
    region = 'ap-chongqing'  # 例如 ap-guangzhou、ap-shanghai
    token = None
    scheme = 'https'  # 默认是https

    config = CosConfig(Region=region, SecretId=secret_id, SecretKey=secret_key, Token=token, Scheme=scheme)
    client = CosS3Client(config)
    return client

# 哈希计算函数
def hash_image_bytes(image_bytes, algorithm='sha256'):
    h = hashlib.new(algorithm)
    h.update(image_bytes)
    return h.hexdigest()
def get_full_text_with_fill(para):
    """提取段落内容，保留下划线、长空格等填空占位符"""
    text_parts = []
    for run in para.runs:
        txt = run.text
        if run.font.underline and not txt.strip():
            text_parts.append("____")  # 使用占位符代替下划线
        elif not txt.strip() and len(txt) >= 4:
            text_parts.append("____________")  # 识别为长空格填空
        else:
            text_parts.append(txt)
    return ''.join(text_parts)





def convert_emf_to_png(emf_path):
    png_path = os.path.splitext(emf_path)[0] + ".png"
    cmd = [
        "inkscape", emf_path,
        "--export-type=png",
        f"--export-filename={png_path}"
    ]
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode != 0:
        print("转换失败:", emf_path)
    return png_path


# 上传图片主函数
def save_image_locally(img_bytes, question_id, content_type="image/png"):
    temp_dir = './temp_images'
    os.makedirs(temp_dir, exist_ok=True)

    hash_val = hash_image_bytes(img_bytes)
    ext_map = {
        'image/png': '.png',
        'image/jpeg': '.jpg',
        'image/x-emf': '.emf',
        'image/x-wmf': '.wmf'
    }
    original_ext = ext_map.get(content_type.lower(), '.img')
    filename_base = f"q{question_id}_{hash_val}"
    local_path = os.path.join(temp_dir, f"{filename_base}{original_ext}")

    with open(local_path, 'wb') as f:
        f.write(img_bytes)

    return {
        "local_path": local_path,
        "content_type": content_type,
        "cos_key": f"exam_images/{filename_base}{original_ext}"  # 可以用于后续上传
    }

def upload_image_to_cos(image_info):
    client = get_cos_client()
    cos_key = image_info['cos_key']
    bucket = 'paper-1302415821'
    local_path = image_info['local_path']
    content_type = image_info['content_type']

    if not os.path.exists(local_path):
        print(f"❌ 文件不存在：{local_path}")
        return None

    if object_exists(client, bucket, cos_key):
        print(f"⚠️ 图片已存在于 COS: {cos_key}")
    else:
        with open(local_path, 'rb') as fp:
            client.put_object(
                Bucket=bucket,
                Body=fp,
                Key=cos_key,
                ContentType=content_type
            )
        print(f"☁️ 图片已上传到 COS: {cos_key}")

    # 构建 COS URL
    return f"https://{bucket}.cos.{client._conf._region}.myqcloud.com/{cos_key}"




def extract_images_from_run(run, doc, question_no):
    image_paths = []
    for drawing in run._element.xpath('.//w:drawing'):
        blips = drawing.xpath('.//*[local-name()="blip"]/@r:embed')

        for rId in blips:
            if rId in doc.part.related_parts:
                image_part = doc.part.related_parts[rId]
                image_bytes = image_part.blob
                content_type = image_part.content_type
                img_path = save_image_locally(image_bytes, question_no, content_type)
                image_paths.append(img_path)
    return image_paths

# 解析选项
def parse_option_line(text):
    # 支持 A、B、C、D 开头的选项，允许全部写在一行
    pattern = re.compile(r'([A-D])[\.\、]\s*(.*?)(?=\s*[A-D][\.\、]|$)')
    results = pattern.findall(text)
    return [(label.strip(), content.strip()) for label, content in results]

def parse_paper_questions(docx_path):
    doc = Document(docx_path)
    questions = []
    current_question = None
    current_chapter = None
    current_type = None
    current_score = 0

    TYPE_KEYWORDS = {
        '选择题': 'single_choice',
        '填空题': 'fill_blank',
        '简答题': 'short_answer',
        '编程题': 'code'
    }

    qn_pattern = re.compile(r'^(\d+)[\．\.、)）\s]*\s*(.*)$')
    score_per_question_pattern = re.compile(r'每题[^\d]*(\d+)\s*分')

    parsing_questions_started = False  # 🚨 是否开始解析真正题目

    for para in doc.paragraphs:
        text = get_full_text_with_fill(para).strip()
        print(f"调试输出——当前段落: {text}")

        text_no_spaces = text.replace(' ', '')

        # 检测题型
        for key, val in TYPE_KEYWORDS.items():
            if key in text_no_spaces:
                current_type = val
                parsing_questions_started = True  # ✅ 开始识别题目
                print(f"⇒ 识别到题型: {current_type}")
                score_match = score_per_question_pattern.search(text)
                if score_match:
                    current_score = int(score_match.group(1))
                    print(f"⇒ 每题分值设为: {current_score}")
                else:
                    current_score = 0
                break

        # 检测章节
        if "第一章" in text_no_spaces:
            current_chapter = "第一章"
            print(f"⇒ 识别到章节: {current_chapter}")
        elif "第二章" in text_no_spaces:
            current_chapter = "第二章"
            print(f"⇒ 识别到章节: {current_chapter}")
        elif "第三章" in text_no_spaces:
            current_chapter = "第三章"
            print(f"⇒ 识别到章节: {current_chapter}")

        # 检测题目
        qn_match = qn_pattern.match(text)
        if qn_match and parsing_questions_started:
            if current_question:
                questions.append(current_question)

            q_num = qn_match.group(1)
            q_title = qn_match.group(2)

            current_question = {
                'question_no': q_num,
                'title': q_title,
                'options': [],
                'type': current_type,
                'chapter': current_chapter,
                'score': current_score,
                'images': [],
                'answer': ''
            }

            print(f"检测到题目{q_num}: {q_title}")
        else:
            is_type_line = any(key in text_no_spaces for key in TYPE_KEYWORDS)
            if current_question and not is_type_line:
                # 选项或题干追加
                extracted_opts = parse_option_line(text)
                if extracted_opts:
                    for label, content in extracted_opts:
                        current_question['options'].append((label, content))
                    continue
                else:
                    current_question['title'] += "\n" + text

        # 检测选项
        if current_question and ('A' in text or 'B' in text or 'C' in text or 'D' in text):
            option_match = re.match(r'([A-D])[\.\、](.*)', text)
            if option_match:
                current_question['options'].append((option_match.group(1), option_match.group(2).strip()))

        # 图片提取
        if current_question:
            # 1. drawing 类型
            drawing_elems = para._element.xpath('.//w:drawing')
            for drawing in drawing_elems:
                blip_elems = drawing.xpath('.//*[local-name()="blip"]/@r:embed')
                for rId in blip_elems:
                    if rId in doc.part.related_parts:
                        image_part = doc.part.related_parts[rId]
                        content_type = image_part.content_type
                        image_bytes = image_part.blob
                        img_path = save_image_locally(image_bytes, current_question['question_no'], content_type)
                        print(f"✅ 已提取图片关联至题目 {current_question['question_no']}: {img_path}")
                        current_question['images'].append(img_path)

            # 2. OLE 类型（如 EMF）
            ole_objs = para._element.xpath(
                './/*[local-name()="object"]//*[local-name()="imagedata"]'
            )

            for imagedata in ole_objs:
                rId = imagedata.get('{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id')
                if rId and rId in doc.part.related_parts:
                    image_part = doc.part.related_parts[rId]
                    content_type = image_part.content_type
                    image_bytes = image_part.blob
                    img_path = save_image_locally(image_bytes, current_question['question_no'], content_type)
                    print(f"✅ 已提取 OLE 图片关联至题目 {current_question['question_no']}: {img_path}")
                    current_question['images'].append(img_path)

    # 最后一个题目
    if current_question:
        questions.append(current_question)

    print("解析到题目数量:", len(questions))
    return questions

def extract_images_from_paragraph(paragraph, doc, question_index):
    """提取段落中所有图片（含绘图和OLE），返回图片路径列表"""
    image_paths = []

    # 1. Drawing 类型图片（常见的 PNG/JPG）
    for drawing in paragraph._element.xpath('.//w:drawing'):
        blip_elems = drawing.xpath('.//*[local-name()="blip"]/@r:embed')
        for rId in blip_elems:
            if rId in doc.part.related_parts:
                part = doc.part.related_parts[rId]
                img_path = save_image_locally(part.blob, question_index, part.content_type)
                print(f"✅ 答案图片(drawing)提取成功: {img_path}")
                image_paths.append(img_path)

    # 2. OLE 类型图片（如 EMF）
    ole_objs = paragraph._element.xpath('.//*[local-name()="object"]//*[local-name()="imagedata"]')
    for imagedata in ole_objs:
        rId = imagedata.get('{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id')
        if rId and rId in doc.part.related_parts:
            part = doc.part.related_parts[rId]
            img_path = save_image_locally(part.blob, question_index, part.content_type)
            print(f"✅ 答案图片(OLE)提取成功: {img_path}")
            image_paths.append(img_path)

    return image_paths


def parse_paper_answers(docx_path):
    from docx import Document
    doc = Document(docx_path)
    paragraphs = doc.paragraphs

    answers_map = {}
    question_index = 1
    current_part = None
    buffer_text = []
    buffer_images = []
    buffering_active = False

    pattern_question_no = re.compile(r'^(\d+)[、.．\s]+(.*)$')

    def get_type_by_part(part):
        return {
            1: 'single_choice',
            2: 'fill_blank',
            3: 'short_answer',
            4: 'code'
        }.get(part, None)

    for p in paragraphs:
        line = get_full_text_with_fill(p).strip()

        if any(key in line for key in ["一、选择题", "选择题"]):
            current_part = 1
        elif any(key in line for key in ["二、填空题", "填空题"]):
            current_part = 2
        elif any(key in line for key in ["三、简答题", "简答题"]):
            current_part = 3
        elif any(key in line for key in ["四、编程题", "编程题"]):
            current_part = 4
        else:
            pass

        if current_part in (3, 4) and re.match(r'^\d+[、.．\s]+', line):
            if buffering_active and (buffer_text or buffer_images):
                answers_map[question_index] = {
                    'text': '\n'.join(buffer_text).strip(),
                    'images': buffer_images.copy(),
                    'type': get_type_by_part(current_part)
                }
                question_index += 1
                buffer_text.clear()
                buffer_images.clear()
            buffering_active = True
            m = pattern_question_no.match(line)
            if m:
                buffer_text.append(m.group(2).strip())
            buffer_images.extend(extract_images_from_paragraph(p, doc, question_index))
            continue

        if current_part == 1:
            letters = re.findall(r'[A-D]', line.replace(" ", ""))
            for ans in letters:
                answers_map[question_index] = {
                    'text': ans,
                    'images': [],
                    'type': 'single_choice'
                }
                question_index += 1

        elif current_part == 2:
            m = pattern_question_no.match(line)
            if m:
                answers_map[question_index] = {
                    'text': m.group(2).strip(),
                    'images': extract_images_from_paragraph(p, doc, question_index),
                    'type': 'fill_blank'
                }
                question_index += 1

        elif current_part in (3, 4):
            if not buffering_active:
                buffering_active = True
            if re.search(r'(简答题|编程题|填空题|选择题)', line):
                print(f"⚠️ 跳过非答案正文段落: {line}")
                continue
            buffer_text.append(line)
            buffer_images.extend(extract_images_from_paragraph(p, doc, question_index))

    if buffering_active and (buffer_text or buffer_images):
        answers_map[question_index] = {
            'text': '\n'.join(buffer_text).strip(),
            'images': buffer_images.copy(),
            'type': get_type_by_part(current_part)
        }

    print(f"🎯 共解析答案数: {len(answers_map)}")
    return answers_map

def extract_paper_name_from_docx(docx_path):
    doc = Document(docx_path)
    lines = []

    for para in doc.paragraphs[:10]:  # 只看前10段，防止太长
        text = para.text.strip()
        if text:
            lines.append(text)

    # 简单组合前 2~3 行作为试卷名
    paper_name = " ".join(lines[:2]) if lines else "未命名试卷"
    return paper_name


# if __name__ == "__main__":
#     # 解析知识点分布
#     knowledge_map = parse_knowledge_distribution("./testpaper/2022秋 数据结构A卷命题分布表.docx")
#     paper_path = "./testpaper/2022秋 数据结构A卷3.docx"
#
#     # 解析题目并关联知识点
#     paper_questions = parse_paper_questions(
#         paper_path,
#         knowledge_map
#     )
#
#     # 解析答案
#     answer_map = parse_paper_answers("./testpaper/2022秋 数据结构A卷3答案.docx")
#     # 自动提取试卷名
#     paper_name = extract_paper_name_from_docx(paper_path)
#     print(f"📄 识别到试卷名称: {paper_name}")
#     # 打印结果
#     print("=== 题目解析结果 ===")
#     for q in paper_questions:
#         print(f"\n题号: {q['question_no']}")
#         print(f"题型: {q['type']}")
#         print(f"章节: {q['chapter']}")
#         print(f"分值: {q['score']}分")
#         print(f"题干: {q['title']}")
#         if q['options']:
#             print("选项:")
#             for opt in q['options']:
#                 print(f"  {opt[0]}. {opt[1]}")
#         print(f"图片: {q['images']}")
#
#     print("\n=== 答案解析结果 ===")
#     for q_id, ans in answer_map.items():
#         print(f"\n题号: {q_id}")
#         print(f"答案: {ans['text']}")
#         print(f"图片: {ans['images']}")
#
#     # 将答案内容合并进题目列表
#     # 为每道题加上全局编号，避免 question_no 重复导致答案错配
#     for idx, q in enumerate(paper_questions, 1):
#         q['global_question_index'] = idx
#         qid = idx  # 用 global index 匹配答案
#         if qid in answer_map:
#             q['answer'] = answer_map[qid].get('text', '')
#             q['answer_images'] = answer_map[qid].get('images', [])
#         else:
#             q['answer'] = ''
#             q['answer_images'] = []
#
#     print(f"🔢 总题数: {len(paper_questions)}，匹配到答案: {sum(1 for q in paper_questions if q['answer'])}")
#     insert_questions_with_answers_and_images(
#         paper_questions,  # 来自 parse_paper_questions
#         answer_map,  # 来自 parse_paper_answers
#         paper_name=paper_name,
#         creator_id=1
#     )
#
#     print("🧪 即将插入数据库的数据预览：")
#     print(json.dumps(paper_questions, indent=2, ensure_ascii=False))

def parse_paper_all(paper_path, answer_path=None):
    questions = parse_paper_questions(paper_path)
    answers_map = parse_paper_answers(answer_path) if answer_path else {}

    for idx, q in enumerate(questions, 1):
        q['global_question_index'] = idx
        qid = idx
        if qid in answers_map:
            q['answer'] = answers_map[qid].get('text', '')
            q['answer_images'] = answers_map[qid].get('images', [])
        else:
            q['answer'] = ''
            q['answer_images'] = []

    paper_name = extract_paper_name_from_docx(paper_path)
    return {
        'paper_name': paper_name,
        'questions': questions,
        'answers_map': answers_map  # ✅ 加上这个
    }

