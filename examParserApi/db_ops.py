# db_ops.py
import pymysql

from parser_core import upload_image_to_cos


def get_connection():
    return pymysql.connect(
        host='localhost',
        port=3306,
        user='root',
        password='123456',
        database='testpaper',
        charset='utf8mb4',
        autocommit=True
    )

def insert_questions_with_answers_and_images(questions, answers_map, paper_name='默认试卷', creator_id=None):
    TYPE_QUESTION_IMAGE = '1'
    TYPE_ANSWER_IMAGE = '0'

    def insert_question_image(cursor, question_id, image_path, img_type):
        # 检查图片是否已存在
        cursor.execute("""
            SELECT COUNT(*) FROM question_image
            WHERE question_id = %s AND image_path = %s AND type = %s
        """, (question_id, image_path, img_type))
        if cursor.fetchone()[0] == 0:
            cursor.execute(
                "INSERT INTO question_image (question_id, image_path, type) VALUES (%s, %s, %s)",
                (question_id, image_path, img_type)
            )
            print(f"📎 插入图片 [{img_type}] {image_path}")
        else:
            print(f"⚠️ 图片 [{img_type}] {image_path} 已存在，跳过。")

    conn = get_connection()
    cursor = conn.cursor()

    # 插入或获取试卷
    cursor.execute("SELECT id FROM paper WHERE paper_name = %s", (paper_name,))
    result = cursor.fetchone()
    if result:
        paper_id = result[0]
        print(f"📘 试卷已存在，paper_id={paper_id}")
    else:
        cursor.execute(
            "INSERT INTO paper (paper_name, creator_id, remarks) VALUES (%s, %s, %s)",
            (paper_name, creator_id, "自动导入试卷")
        )
        paper_id = cursor.lastrowid
        print(f"📘 插入新试卷成功，paper_id={paper_id}")

    for sort_idx, q in enumerate(questions, 1):
        qid = str(q['question_no'])
        q_type = q['type']
        correct_label = q['answer'].strip() if q_type in ('single_choice', 'multi_choice') else ''

        matched_answer = next((ans for ans_id, ans in answers_map.items()
                               if str(ans_id) == str(q.get('global_question_index'))), {})
        answer_text = matched_answer.get('text', '')
        answer_images = matched_answer.get('images', [])

        # 查询是否已存在相同题目（根据标题和题型）
        cursor.execute("SELECT id FROM question WHERE title = %s AND question_type = %s", (q['title'], q_type))
        result = cursor.fetchone()

        if result:
            question_id = result[0]
            print(f"♻️ 已存在题目 {qid}，更新中 → id={question_id}")
            cursor.execute("""
                UPDATE question
                SET answer = %s, score = %s, remarks = %s, update_time = NOW()
                WHERE id = %s
            """, (
                answer_text,
                q.get('score', 0),
                f"来源章节: {q.get('chapter', '')}",
                question_id
            ))
        else:
            cursor.execute("""
                INSERT INTO question (question_type, title, difficulty, answer, score, remarks, creator_id)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (
                q_type,
                q['title'],
                1,
                answer_text,
                q.get('score', 0),
                f"来源章节: {q.get('chapter', '')}",
                creator_id
            ))
            question_id = cursor.lastrowid
            print(f"✅ 插入新题目 {qid} → id={question_id}")

        # 建立题目与试卷的关联
        cursor.execute("""
            SELECT COUNT(*) FROM paper_question WHERE paper_id = %s AND question_id = %s
        """, (paper_id, question_id))
        if cursor.fetchone()[0] == 0:
            cursor.execute("""
                INSERT INTO paper_question (paper_id, question_id, question_score, sort_order)
                VALUES (%s, %s, %s, %s)
            """, (paper_id, question_id, q.get('score', 0), sort_idx))

        # 插入选项（包含 is_correct）
        for label, content in q.get('options', []):
            is_correct = 1 if label == correct_label else 0
            cursor.execute("""
                SELECT COUNT(*) FROM question_option
                WHERE question_id = %s AND option_label = %s
            """, (question_id, label))
            if cursor.fetchone()[0] == 0:
                cursor.execute("""
                    INSERT INTO question_option (question_id, option_label, option_content, is_correct)
                    VALUES (%s, %s, %s, %s)
                """, (question_id, label, content, is_correct))
            else:
                cursor.execute("""
                    UPDATE question_option
                    SET option_content = %s, is_correct = %s
                    WHERE question_id = %s AND option_label = %s
                """, (content, is_correct, question_id, label))

        # 插入题目图片
        for img in q.get('images', []):
            url = upload_image_to_cos(img)
            if url:
                insert_question_image(cursor, question_id, url, TYPE_QUESTION_IMAGE)

        # 插入答案图片
        for img_path in answer_images:
            url = upload_image_to_cos(img_path)
            if url:
                insert_question_image(cursor, question_id, url, TYPE_ANSWER_IMAGE)

    conn.commit()
    cursor.close()
    conn.close()
    print("🎯 所有题目、选项、图片、答案已成功插入或更新。")