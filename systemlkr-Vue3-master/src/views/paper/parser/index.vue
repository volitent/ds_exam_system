<template>
    <div class="exam-parser">
        <!-- 上传区域 -->
        <el-card class="upload-card">
            <template #header>
                <span>上传试卷与答案（Word格式）</span>
            </template>

            <div style="display: flex; flex-direction: column; gap: 16px">
                <!-- 上传试卷 -->
                <el-upload
                    :auto-upload="false"
                    :limit="1"
                    :show-file-list="true"
                    :before-upload="beforeUpload"
                    accept=".doc,.docx"
                    :on-change="handlePaperChange"
                >
                    <el-button type="primary">上传试卷文件</el-button>
                </el-upload>

                <!-- 上传答案 -->
                <el-upload
                    :auto-upload="false"
                    :limit="1"
                    :show-file-list="true"
                    :before-upload="beforeUpload"
                    accept=".doc,.docx"
                    :on-change="handleAnswerChange"
                >
                    <el-button type="success">上传答案文件</el-button>
                </el-upload>

                <!-- 解析按钮 -->
                <el-button type="primary" @click="submitUpload">解析</el-button>
            </div>
        </el-card>

        <!-- 解析结果展示 -->
        <el-card class="result-card" v-if="parsedData.length > 0">
            <template #header>
                <span>解析结果</span>
            </template>

            <el-tabs v-model="activeTab">
                <el-tab-pane
                    v-for="type in questionTypes"
                    :key="type"
                    :label="type"
                >
                    <el-collapse>
                        <el-collapse-item
                            v-for="(question, index) in filteredQuestions(type)"
                            :key="index"
                            :title="`第 ${index + 1} 题：${question.title}`"
                        >
                            <div v-if="question.answer_images && question.answer_images.length">
                                <img
                                    v-for="(img, i) in question.answer_images"
                                    :key="i"
                                    :src="img"
                                    style="max-width: 100%; margin: 10px 0"
                                />
                            </div>
                            <div class="meta">
                                <strong>答案：</strong>{{ question.answer }}
                            </div>
                        </el-collapse-item>
                    </el-collapse>
                </el-tab-pane>
            </el-tabs>

            <!-- ✅ 确认入库按钮 -->
            <div style="text-align: center; margin-top: 20px">
                <el-button
                    type="success"
                    @click="submitImport"
                >
                    确认入库
                </el-button>
            </div>
        </el-card>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { ElMessage } from 'element-plus'
import useUserStore from '@/store/modules/user'

// 用户信息
const userStore = useUserStore()
const userId = computed(() => userStore.id)

// 文件引用
const paperFile = ref(null)
const answerFile = ref(null)
const parsedData = ref([])
const fullParseResult = ref(null)

const activeTab = ref('')
const questionTypes = computed(() => [...new Set(parsedData.value.map(q => q.type))])
const filteredQuestions = (type) => parsedData.value.filter(q => q.type === type)

// 上传前校验
const beforeUpload = (file) => {
    const isWord =
        file.type === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ||
        file.type === 'application/msword'
    const isLt10M = file.size / 1024 / 1024 < 10
    if (!isWord) ElMessage.error('只能上传 Word 文档')
    if (!isLt10M) ElMessage.error('文件大小不能超过 10MB')
    return isWord && isLt10M
}

// 手动存储文件
const handlePaperChange = (file) => {
    paperFile.value = file.raw
}
const handleAnswerChange = (file) => {
    answerFile.value = file.raw
}

// 上传并解析
const submitUpload = async () => {
    if (!paperFile.value || !answerFile.value) {
        ElMessage.error('请上传完整的试卷和答案文件')
        return
    }

    const form = new FormData()
    form.append("paper", paperFile.value)
    form.append("answer", answerFile.value)

    try {
        const res = await fetch("http://localhost:8000/api/parse", {
            method: "POST",
            body: form
        })
        const result = await res.json()
        if (result.code === 200) {
            parsedData.value = result.data.questions || []
            fullParseResult.value = result.data
            activeTab.value = questionTypes.value[0] || ''
            ElMessage.success('解析成功，请确认是否入库')
        } else {
            ElMessage.error(result.msg || '解析失败')
        }
    } catch (err) {
        ElMessage.error('请求失败')
    }
}

// 确认入库
const submitImport = async () => {
    if (!fullParseResult.value || !userId.value) {
        ElMessage.warning("解析数据不存在或用户未登录")
        return
    }

    try {
        const res = await fetch("http://localhost:8000/api/import", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                questions: fullParseResult.value.questions,
                answers_map: fullParseResult.value.answers_map,
                paper_name: fullParseResult.value.paper_name,
                creator_id: userId.value
            })
        })
        const result = await res.json()
        if (result.code === 200) {
            ElMessage.success("入库成功")
        } else {
            ElMessage.error(result.msg || "入库失败")
        }
    } catch (err) {
        ElMessage.error("请求失败")
    }
}
</script>

<style scoped>
.exam-parser {
    padding: 24px;

    .upload-card,
    .result-card {
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
        border: none;
        background-color: #fff;
        padding: 20px;
    }

    .upload-card .el-upload {
        display: inline-block;
        margin-right: 20px;
    }

    .el-button {
        border-radius: 6px;
    }

    .result-card {
        .el-tabs__nav-wrap {
            padding-left: 10px;
        }

        .el-collapse-item__header {
            font-weight: 500;
            background: #f4f6fa;
            padding: 12px 20px;
            border-radius: 6px;
            margin-bottom: 4px;
        }

        .el-collapse-item__content {
            background: #fff;
            padding: 16px 20px;
            border-radius: 6px;
            border: 1px solid #eaecef;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
        }

        img {
            border-radius: 4px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);
        }

        .meta {
            margin-top: 12px;
            font-size: 14px;
            color: #333;
            line-height: 1.6;
            background: #f6f8fa;
            padding: 8px 12px;
            border-radius: 6px;
            border-left: 4px solid #67c23a;
        }

        .el-button {
            margin-top: 20px;
        }
    }
}

</style>
