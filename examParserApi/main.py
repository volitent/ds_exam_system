# main.py
# uvicorn main:app --host 0.0.0.0 --port 8000 --reload
from fastapi import FastAPI, UploadFile, File, Form
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import shutil, os, uuid
from parser_core import parse_paper_all
from db_ops import insert_questions_with_answers_and_images
from pydantic import BaseModel

app = FastAPI()

# 允许跨域（前后端分离项目常用）
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 你也可以指定前端地址，如 http://localhost:3000
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

UPLOAD_DIR = './temp'
os.makedirs(UPLOAD_DIR, exist_ok=True)

def save_upload(file: UploadFile):
    ext = os.path.splitext(file.filename)[-1]
    temp_path = os.path.join(UPLOAD_DIR, f"{uuid.uuid4().hex}{ext}")
    with open(temp_path, 'wb') as buffer:
        shutil.copyfileobj(file.file, buffer)
    return temp_path


@app.post("/api/parse")
async def parse_exam(
    paper: UploadFile = File(...),
    answer: UploadFile = File(...)
):
    paper_path = answer_path = None
    try:
        paper_path = save_upload(paper)
        answer_path = save_upload(answer)
        result = parse_paper_all(paper_path, answer_path)

        return JSONResponse(content={"code": 200, "msg": "解析成功", "data": result})
    except Exception as e:
        return JSONResponse(content={"code": 500, "msg": f"解析失败: {str(e)}"})
    finally:
        if os.path.exists('./temp_images'):
            shutil.rmtree('./temp_images')
        for path in [paper_path, answer_path]:
            if path and os.path.exists(path):
                os.remove(path)

class ImportRequest(BaseModel):
    questions: list
    answers_map: dict
    paper_name: str
    creator_id: int

@app.post("/api/import")
async def import_exam(data: ImportRequest):
    try:
        insert_questions_with_answers_and_images(
            data.questions,
            data.answers_map,
            paper_name=data.paper_name,
            creator_id=data.creator_id
        )
        return JSONResponse(content={"code": 200, "msg": "入库成功"})
    except Exception as e:
        return JSONResponse(content={"code": 500, "msg": f"入库失败: {str(e)}"})