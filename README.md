# 数据结构组卷系统

本项目是一套数据结构智能组卷系统，面向《数据结构》课程，集成题库管理、试卷解析、AI 出题与智能组卷等功能。

## 项目架构

```
ds_exam_system/
├── systemlkr-Springboot/       # 后端 — Spring Boot 2.5.15 (Java 17)
├── systemlkr-Vue3-master/      # 前端 — Vue 3 + Element Plus + Vite
├── examParserApi/              # 解析服务 — Python FastAPI（Word 试卷解析）
├── Parser/                     # 旧版独立解析脚本（已废弃）
├── sql/                        # MySQL 数据库脚本
└── package.json                # 根目录 WebSocket 依赖
```

### 整体架构图

```
┌─────────────────────────┐
│   浏览器 (Vue 3 SPA)     │
│   Vite Dev :80 / Nginx  │
└────────────┬────────────┘
             │ HTTP / WebSocket (STOMP)
             ▼
┌─────────────────────────┐      ┌──────────────────┐
│   Spring Boot 后端       │─────▶│  MySQL (testpaper)│
│   :8080                  │      └──────────────────┘
│                         │      ┌──────────────────┐
│  - REST API 控制器       │─────▶│  Redis            │
│  - JWT 认证 / Spring Sec │      └──────────────────┘
│  - MyBatis ORM           │
│  - WebSocket / STOMP     │      ┌──────────────────┐
│                          │─────▶│  腾讯云 COS (图片) │
└──────┬─────────┬─────────┘      └──────────────────┘
       │         │
       │         │ DashScope API (HTTP)
       │         ▼
       │  ┌──────────────────────────────────┐
       │  │    阿里云百炼平台（RAG 知识库应用）   │
       │  │                                  │
       │  │  ┌──────────┐  ┌──────────┐      │
       │  │  │ 应用 1    │  │ 应用 2    │      │
       │  │  │ 出题+对话  │  │ 智能组卷   │      │
       │  │  └────┬─────┘  └────┬─────┘      │
       │  │       │              │            │
       │  │       ▼              ▼            │
       │  │  ┌─────────────────────────┐      │
       │  │  │   知识库 (向量检索)        │      │
       │  │  │   数据结构教材 / 题库文档   │      │
       │  │  └─────────────────────────┘      │
       │  └──────────────────────────────────┘
       │
       │ HTTP (试卷解析)
       ▼
┌─────────────────────────┐
│   FastAPI 解析服务 :8000  │
│   (Word 文档解析 / 图片)  │
└─────────────────────────┘
```

## 技术栈

| 层级 | 技术 | 说明 |
|------|------|------|
| **前端** | Vue 3.4 + Vite 5 | Composition API |
| | Element Plus 2.7 | UI 组件库 |
| | Pinia 2.1 | 状态管理 |
| | ECharts 5.6 | 数据可视化 |
| | docx / docx-templates | Word 文档生成 |
| | html2pdf.js | PDF 导出 |
| | vue-quill | 富文本编辑器 |
| **后端** | Spring Boot 2.5.15 | 核心框架 (Java 17) |
| | Spring Security 5.7 | JWT 认证授权 |
| | MyBatis + PageHelper | ORM 与分页 |
| | Quartz | 定时任务调度 |
| | Swagger (Springfox 3) | API 文档 |
| **数据库** | MySQL 8.0 | 主数据库 |
| | Redis | 缓存 / 会话管理 |
| **解析服务** | Python FastAPI | Word 试卷解析 |
| | python-docx | Word 文档读写 |
| | Inkscape (CLI) | EMF 转 PNG |
| **AI 集成** | 阿里云 DashScope (百炼) | LLM 出题 / 智能组卷 |
| **存储** | 腾讯云 COS | 图片存储 |

## 核心功能

### 1. 题库管理

- 支持四种题型：**选择题**、**填空题**、**简答题**、**编程题**
- 题目属性：题干、难度（1/2/3）、答案、解析、分值
- 选择题支持 A/B/C/D 选项管理
- 题目图片与答案图片分别存储
- 知识点多对多关联

### 2. 知识点管理

按照《数据结构》教材章节组织：

| 章节 | 内容 |
|------|------|
| 第 1 章 | 绪论 |
| 第 2 章 | 线性表 |
| 第 3 章 | 栈和队列 |
| 第 4 章 | 串、数组和广义表 |
| 第 5 章 | 树和二叉树 |
| 第 6 章 | 图 |
| 第 7 章 | 查找 |
| 第 8 章 | 排序 |

### 3. 试卷解析

- 上传 Word 格式试卷与答案文档
- FastAPI 服务自动解析题目、选项、图片
- 图片提取并上传至腾讯云 COS
- 解析结果一键导入题库

### 4. AI 智能出题

- 集成阿里云百炼平台中已开发好的 **RAG 知识库应用**
- 支持按题型、章节、数量、难度生成题目
- WebSocket 流式对话（AI 助教悬浮窗）
- 生成结果可逐题或批量保存至题库

### 5. 智能组卷

- **分数分布表**：按 [章节 × 题型] 矩阵配置分值
- **AI 自动组卷**：LLM 根据分布表自动生成完整试卷
- **手动组卷**：从题库中手动选题
- **导出功能**：
  - 导出为 Word (.docx)
  - 导出为 PDF
  - 导出答案卷
  - 导出命题分布表

## AI 与 RAG 架构

本项目的 AI 功能基于**阿里云百炼平台**上已开发好的 RAG 知识库应用。LLM、向量检索、知识库管理均在百炼平台内部完成，项目代码仅负责调用百炼的 Application API。

> **前置条件**：需要在[阿里云百炼控制台](https://bailian.console.aliyun.com/)中创建应用，上传数据结构教材、题库等文档作为知识库，并获取 `API Key` 和 `App ID`。

### 调用流程

```
┌──────────┐     HTTP      ┌──────────────┐    DashScope API    ┌──────────────────────┐
│  Vue 前端 │ ────────────▶ │ Spring Boot  │ ──────────────────▶ │  阿里云百炼 Application │
│          │              │   后端        │                     │                      │
│          │ ◀───────────  │  (转发请求)   │ ◀────────────────── │  1. 向量检索知识库     │
│          │   渲染结果     │              │    返回生成结果       │  2. 注入检索结果到 Prompt│
└──────────┘              └──────────────┘                     │  3. LLM 生成内容      │
                                                               └──────────────────────┘
```

### 两个百炼应用

项目使用了两个不同的百炼应用，通过 `application.yml` 中不同的配置项区分：

| 配置项 | 应用 | 用途 |
|--------|------|------|
| `dashscope.app.id1` | 应用 1 | 结构化出题 + AI 对话 |
| `bailian.app-id`（`dashscope.app.id2`） | 应用 2 | 智能组卷（返回 JSON） |

### 三个 AI 场景的输入输出

#### 场景一：结构化出题（`POST /api/rag/generate`）

**输入** — 用户在前端选择题型、章节、数量、难度后，后端组装请求发送至百炼应用 1：

```jsonc
// 发送到百炼的参数
{
  "appId": "应用1 ID",
  "prompt": "请根据以下要求生成题目：\n- 选择题：2道，章节：第五章 树和二叉树，难度：中等\n- 填空题：3道，章节：第三章 栈和队列，难度：基础",
  "bizParams": {
    "chapter_for_mcq": "第五章 树和二叉树",  // 填充 System Prompt 模板中的 {{ chapter_for_mcq }}
    "chapter_for_fill": "第三章 栈和队列",   // 填充 {{ chapter_for_fill }}
    "difficulty": "中等",                    // 填充 {{ difficulty }}
    "mcq_count": 2,                          // 填充 {{ mcq_count }}
    "fill_count": 3,                          // 填充 {{ fill_count }}
    "saq_count": 0,
    "code_count": 0
  }
}
```

`bizParams` 会填充到百炼平台上配置的 System Prompt 模板占位符，`${documents}` 由百炼平台自动注入知识库检索结果。

**输出** — 百炼返回格式化的 Markdown 文本：

```markdown
选择题
【题干】以下关于二叉树的说法正确的是：（     ）
【选项】
A. 二叉树中每个节点最多有两个子节点
B. 二叉树就是度为2的树
C. 满二叉树一定是完全二叉树
D. 完全二叉树一定是满二叉树
【答案】A
【解析】二叉树每个节点最多有两个子树...

---

填空题
【题干】栈的特点是___。
【答案】后进先出（LIFO）
【解析】栈是一种后进先出的线性表...
```

前端通过正则按 `---` 分割，再按 `【题干】`、`【选项】`、`【答案】`、`【解析】` 提取字段，解析为结构化的 `Question` 对象。

#### 场景二：智能组卷（`POST /api/rag/auto-select`）

**输入** — 从命题分布配置表生成任务列表，发送至百炼应用 2：

```jsonc
{
  "appId": "应用2 ID",
  "prompt": "请根据 tasks 参数智能试卷及答案，返回纯 JSON，严格按照 System Prompt 执行。",
  "bizParams": {
    "paperTitle": "数据结构综合试卷",
    "tasks": [
      { "kpName": "第五章 树和二叉树", "questionType": "single_choice", "score": 10, "limit": 10 },
      { "kpName": "第三章 栈和队列",   "questionType": "fill_blank",    "score": 15, "limit": 10 },
      { "kpName": "第六章 图",         "questionType": "short_answer",  "score": 20, "limit": 10 },
      { "kpName": "第八章 排序",       "questionType": "code",          "score": 25, "limit": 10 }
    ]
  }
}
```

**输出** — 百炼返回纯 JSON（完整的试卷结构）：

```json
{
  "paperTitle": "数据结构综合试卷",
  "totalScore": 100,
  "sections": [
    {
      "type": "single_choice",
      "title": "一、选择题",
      "questions": [
        {
          "number": 1,
          "title": "下列关于二叉树遍历的说法...",
          "options": ["先序遍历", "中序遍历", "后序遍历", "层次遍历"],
          "answer": "B",
          "analysis": "根据二叉树遍历定义...",
          "score": 2,
          "type": "single_choice",
          "knowledgePoints": ["第五章 树和二叉树"]
        }
      ]
    },
    {
      "type": "code",
      "title": "四、编程题",
      "questions": [
        {
          "number": 1,
          "title": "编写快速排序算法...",
          "answer": "void QuickSort(int arr[], int low, int high) { ... }",
          "analysis": "快速排序采用分治策略...",
          "score": 25,
          "type": "code"
        }
      ]
    }
  ]
}
```

后端去除可能的 Markdown 代码块包裹后，用 Gson 反序列化为 `PaperData` 对象返回前端。

#### 场景三：AI 对话（WebSocket `/ws → /app/chat`）

**输入** — 用户在悬浮聊天窗口输入消息，通过 STOMP 发送：

```jsonc
{
  "messages": [
    { "role": "user", "content": "帮我出两道排序的编程题" },
    { "role": "user", "content": "难度中等" }
  ],
  "bizParams": {
    "difficulty": "中等",
    "code_count": 2,
    "chapter_for_code": "第八章 排序"
  }
}
```

**输出** — 百炼通过流式接口（`streamCall`）返回，后端逐帧通过 WebSocket 推送至前端：

```
帧1: "好的"
帧2: "，我来"
帧3: "出两道排序"
...
帧N: "[DONE]"
```

前端逐帧追加到对话气泡中，实现打字机效果。

### 三个场景对比

| | 结构化出题 | 智能组卷 | AI 对话 |
|---|---|---|---|
| **百炼应用** | 应用 1 (`dashscope.app.id1`) | 应用 2 (`bailian.app-id`) | 应用 1 |
| **调用方式** | `application.call()` 非流式 | `application.call()` 非流式 | `application.streamCall()` 流式 |
| **输入** | prompt + bizParams（题型/章节/数量/难度） | prompt + tasks（章节×题型×分值矩阵） | messages（对话历史）+ bizParams |
| **输出** | Markdown 文本（`【题干】【答案】` 格式） | JSON（完整的 sections/questions 结构） | 流式文本片段 |
| **前端解析** | 正则分割 Markdown | JSON 直接反序列化 | 逐帧追加显示 |
| **RAG 检索** | 百炼平台内部完成 | 百炼平台内部完成 | 百炼平台内部完成 |

### 6. 系统管理（若依框架）

- 用户 / 角色 / 部门 / 岗位管理
- 菜单 / 字典 / 参数配置
- 操作日志 / 登录日志
- 定时任务管理
- 服务器监控 / 缓存监控

## 数据库设计

数据库名：`testpaper`，主要业务表：

| 表名 | 说明 |
|------|------|
| `question` | 题目表 |
| `question_option` | 选择题选项表 |
| `question_image` | 题目图片表 |
| `question_knowledge` | 题目-知识点关联表 |
| `knowledge_point` | 知识点表 |
| `paper` | 试卷表 |
| `paper_question` | 试卷-题目关联表 |

> 完整 SQL 脚本位于 `sql/testpaper.sql`。

## 快速开始

### 环境要求

- **Java** 17+
- **Node.js** 16+
- **Python** 3.10+
- **MySQL** 8.0+
- **Redis** 6.0+
- **Inkscape**（图片格式转换，可选）

### 1. 初始化数据库

```bash
# 创建数据库并导入
mysql -u root -p -e "CREATE DATABASE testpaper DEFAULT CHARACTER SET utf8mb4;"
mysql -u root -p testpaper < sql/testpaper.sql
```

### 2. 启动后端

```bash
cd systemlkr-Springboot

# 修改数据库与 Redis 连接配置
# 编辑 systemlkr-admin/src/main/resources/application.yml
# 编辑 systemlkr-admin/src/main/resources/application-druid.yml

# 构建并运行
mvn clean package -DskipTests
java -jar systemlkr-admin/target/systemlkr-admin.jar
```

后端默认运行在 `http://localhost:8080`。

### 3. 启动前端

```bash
cd systemlkr-Vue3-master

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

前端默认运行在 `http://localhost:80`，自动代理 API 请求到后端。

### 4. 启动解析服务（可选）

```bash
cd examParserApi

# 安装 Python 依赖
pip install fastapi uvicorn pymysq python-docx qcloud_cos

# 启动服务
python main.py
# 或
uvicorn main:app --host 0.0.0.0 --port 8000
```

解析服务默认运行在 `http://localhost:8000`。

## 主要 API

| 方法 | 路径 | 说明 |
|------|------|------|
| `POST` | `/login` | 用户登录 |
| `GET` | `/testpaper/question/listWithDetail` | 题目列表（含详情） |
| `POST` | `/testpaper/question` | 新增题目 |
| `PUT` | `/testpaper/question` | 修改题目 |
| `DELETE` | `/testpaper/question/{ids}` | 删除题目 |
| `GET` | `/testpaper/knowledge_point/list` | 知识点列表 |
| `GET` | `/paper/paperlist/list` | 试卷列表 |
| `POST` | `/paper/paperlist` | 创建试卷 |
| `POST` | `/api/rag/generate` | AI 出题 |
| `POST` | `/api/rag/auto-select` | AI 智能组卷 |
| `WS` | `/ws` | WebSocket AI 对话 |
| `POST` | `http://localhost:8000/api/parse` | 试卷 Word 解析 |

> 完整 API 文档启动后端后访问 Swagger：`http://localhost:8080/swagger-ui.html`

## 配置说明

### 后端配置（application.yml）

| 配置项 | 默认值 | 说明 |
|--------|--------|------|
| `server.port` | `8080` | 服务端口 |
| `jwt.secret` | — | JWT 签名密钥 |
| `jwt.expireTime` | `45` (分钟) | Token 过期时间 |
| `spring.datasource` | `localhost:3306/testpaper` | MySQL 连接 |
| `spring.redis` | `localhost:6379` | Redis 连接 |
| `dashscope.api.key` | — | 阿里云 DashScope API Key |
| `dashscope.app.id1` | — | 百炼应用 1 ID（结构化出题 + AI 对话） |
| `dashscope.app.id2` | — | 百炼应用 2 ID（智能组卷） |
| `bailian.api-key` | — | 百炼 API Key（组卷服务，同 `dashscope.api.key`） |
| `bailian.app-id` | — | 百炼应用 ID（组卷服务，同 `dashscope.app.id2`） |
| `cos.*` | — | 腾讯云 COS 配置 |
| `fastapi.parse-url` | `http://localhost:8000/api/parse` | 解析服务地址 |

### 前端配置

- `.env.development` — 开发环境
- `.env.production` — 生产环境
- `.env.staging` — 预发布环境

## 项目依赖说明

| 依赖 | 用途 |
|------|------|
| [RuoYi-Vue](https://gitee.com/y_project/RuoYi-Vue) | 基础后台管理框架 v3.8.9 |
| [阿里云百炼](https://www.aliyun.com/product/bailian) | 大模型服务（通义千问） |
| [腾讯云 COS](https://cloud.tencent.com/product/cos) | 对象存储服务 |

## License

本项目仅供学习交流使用。
