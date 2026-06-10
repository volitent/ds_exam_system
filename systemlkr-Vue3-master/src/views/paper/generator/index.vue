<template>
    <div class="app-container">
        <!-- 📌 筛选区域 -->
        <el-card class="card-block" shadow="hover">
            <template #header>📂 题库筛选</template>
            <el-form :model="queryParams" inline class="filter-form">
                <el-form-item label="题型">
                    <el-select v-model="queryParams.questionType" placeholder="请选择题型">
                        <el-option label="选择题" value="single_choice" />
                        <el-option label="填空题" value="fill_blank" />
                        <el-option label="简答题" value="short_answer" />
                        <el-option label="编程题" value="code" />
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="handleQuery">搜索</el-button>
                    <el-button @click="resetQuery">重置</el-button>
                </el-form-item>
            </el-form>

            <el-table :data="questionList" @selection-change="handleSelectionChange" border>
                <el-table-column type="selection" width="50" />
                <el-table-column prop="title" label="题目标题/题干" />
                <el-table-column prop="questionType" label="题型" />
            </el-table>

            <div style="margin-top: 10px;">
                <el-button type="success" @click="addSelectedQuestions">加入试卷</el-button>
            </div>

            <pagination
                v-show="total > 0"
                :total="total"
                v-model:page="queryParams.pageNum"
                v-model:limit="queryParams.pageSize"
                @pagination="handlePageChange"
            />
        </el-card>
        <!-- 📘 试卷信息 -->
        <el-card class="card-block" shadow="hover">
            <template #header>📝 试卷基本信息</template>
            <el-form :model="paperInfo" label-width="100px">
                <el-form-item label="试卷标题">
                    <el-input v-model="paperInfo.title" placeholder="请输入试卷标题" />
                </el-form-item>
                <el-form-item label="课程名称">
                    <el-input v-model="paperInfo.courseName" placeholder="请输入课程名称" />
                </el-form-item>
                <el-form-item label="考试时长">
                    <el-input v-model="paperInfo.duration" placeholder="分钟" />
                </el-form-item>
            </el-form>
        </el-card>

        <!-- 📚 试卷题目编辑 -->
        <el-card class="card-block" shadow="hover">
            <template #header>📦 试卷结构编辑</template>

            <div style="margin-bottom: 12px; font-size: 16px;">
                当前总分：<b>{{ totalScore }}</b> 分
            </div>

            <div v-for="section in paperSections" :key="section.type" class="section-block">
                <h3 style="margin-bottom: 10px;">
                    {{ section.typeName }}
                    <span v-if="section.type === 'fill_blank'">（每空 {{ section.scorePerBlank }} 分）</span>
                    <span v-else-if="section.type === 'single_choice'">（每题 {{ section.scorePerQuestion }} 分）</span>
                </h3>

                <el-form-item label="每题分值" v-if="section.type === 'single_choice'">
                    <el-input-number v-model="section.scorePerQuestion" :min="1" />
                </el-form-item>
                <el-form-item label="每空分值" v-if="section.type === 'fill_blank'">
                    <el-input-number v-model="section.scorePerBlank" :min="1" />
                </el-form-item>

                <el-card
                    v-for="(question, index) in section.questions"
                    :key="question.id"
                    style="margin-bottom: 10px;"
                >
                    <div style="margin-bottom: 6px;">
                        {{ index + 1 }}. {{ question.title }}
                    </div>

                    <template v-if="question.options">
                        <div style="display: flex; flex-wrap: wrap; margin-left: 20px;">
                            <div v-for="(opt, i) in question.options" :key="i" style="width: 50%; padding: 4px 0;">
                                {{ optionLabel[i] }}. {{ opt }}
                            </div>
                        </div>
                    </template>

                    <el-form-item label="题目分值" v-if="section.type === 'short_answer' || section.type === 'code'">
                        <el-input-number v-model="question.score" :min="1" />
                    </el-form-item>

                    <el-button size="small" @click="moveQuestionUp(section, index)">上移</el-button>
                    <el-button size="small" @click="moveQuestionDown(section, index)">下移</el-button>
                    <el-button size="small" type="danger" @click="removeQuestion(section, index)">删除</el-button>
                </el-card>
            </div>
        </el-card>

        <!-- 📤 导出操作 -->
        <el-card class="card-block" shadow="hover">
            <template #header>📁 操作区</template>
            <el-button type="primary" @click="previewPaper">预览试卷</el-button>
            <el-button type="success" @click="exportWord">导出 Word</el-button>
            <el-button type="info" @click="exportAnswerWord">导出参考答案</el-button>
            <el-button type="warning" @click="exportPDF">导出 PDF</el-button>
        </el-card>

        <!--  预览弹窗 -->
        <el-dialog v-model="previewVisible" title="试卷预览" width="80%" top="5vh">
            <div id="previewContent" style="padding: 30px;">
                <!-- 试卷头部 -->
                <h2 style="text-align:center; font-weight:bold; font-family: '宋体';">
                    贵州大学 2023-2024 学年第一学期考试试卷 A
                </h2>
                <h3 style="text-align:center; font-family: '宋体';">
                    {{ paperInfo.courseName }}
                </h3>
                <div style="text-align:center; font-family: '宋体';">
                    考试时间：{{ paperInfo.duration }}分钟
                </div>

                <!-- 得分总表 -->
                <table style="width:100%; border-collapse:collapse; text-align:center; margin: 20px 0; border:1px solid #000;">
                    <tr>
                        <td style="border:1px solid #000;">题号</td>
                        <td style="border:1px solid #000;">一</td>
                        <td style="border:1px solid #000;">二</td>
                        <td style="border:1px solid #000;">三</td>
                        <td style="border:1px solid #000;">四</td>
                        <td style="border:1px solid #000;">总分</td>
                        <td style="border:1px solid #000;">统分人</td>
                    </tr>
                    <tr>
                        <td style="border:1px solid #000;">得分</td>
                        <td style="border:1px solid #000;">______</td>
                        <td style="border:1px solid #000;">______</td>
                        <td style="border:1px solid #000;">______</td>
                        <td style="border:1px solid #000;">______</td>
                        <td style="border:1px solid #000;">______</td>
                        <td style="border:1px solid #000;">______</td>
                    </tr>
                </table>

                <!-- 注意事项 -->
                <div style="margin-top: 20px; font-family: '宋体';">
                    <b>注意事项：</b>
                    <ol>
                        <li>请考生按要求填写姓名、学号和年级专业。</li>
                        <li>请仔细阅读各种题目的回答要求。</li>
                        <li>不要乱写乱画，不要在装订线内填写无关内容。</li>
                        <li>满分100分，考试时间120分钟。</li>
                    </ol>
                </div>

                <!-- 正式题目内容 -->
                <div v-for="(section, sIndex) in paperSections" :key="section.type" style="margin-top: 30px;">
                    <!-- 每大题的小得分栏 -->
                    <div style="display: flex; align-items: center; margin-bottom: 10px;">
                        <table style="width: 150px; border-collapse: collapse; text-align: center; border: 1px solid #000; margin-right: 20px;">
                            <tr>
                                <td style="border: 1px solid #000;">得分</td>
                                <td style="border: 1px solid #000;">评分人</td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #000;">______</td>
                                <td style="border: 1px solid #000;">______</td>
                            </tr>
                        </table>
                        <h3 style="font-family: '宋体'; margin: 0;">{{ section.typeName }}</h3>
                    </div>


                    <div v-for="(question, qIndex) in section.questions" :key="qIndex" class="question-item" style="margin-bottom: 20px; font-family: '宋体';">
                        {{ getDisplayNumber(sIndex, qIndex) }}. {{ question.title }}
                        <template v-if="question.options">
                            <div style="display: flex; flex-wrap: wrap; margin-left: 20px;">
                                <div
                                    v-for="(opt, i) in question.options"
                                    :key="i"
                                    style="width: 50%; padding: 4px 0; box-sizing: border-box; padding-right: 30px;"
                                >
                                    {{ optionLabel[i] }}. {{ opt }}
                                </div>
                            </div>
                        </template>


                        <!-- 填空题 -->
                        <template v-if="section.type === 'fill_blank'">
                            <div style="border-bottom:1px dashed #000; width: 80%; margin-top:10px;"></div>
                        </template>

                        <!-- 简答题/编程题 -->
                        <template v-if="section.type === 'short_answer' || section.type === 'code'">
                            <div style="border-bottom:1px dashed #000; width: 100%; height: 20px; margin-top:10px;"></div>
                            <div style="border-bottom:1px dashed #000; width: 100%; height: 20px; margin-top:10px;"></div>
                            <div style="border-bottom:1px dashed #000; width: 100%; height: 20px; margin-top:10px;"></div>
                        </template>
                    </div>
                </div>


            </div>
        </el-dialog>

    </div>
</template>

<script setup>
import { ref, reactive, computed } from 'vue';
import { ElMessage } from 'element-plus';
import html2pdf from 'html2pdf.js';
import { Document, Packer, Paragraph, Table, Footer, TableRow, TableCell, WidthType, TextRun, AlignmentType, Header, BorderStyle } from 'docx';
import { saveAs } from 'file-saver';
import {batchQuestionDetail, listQuestion} from "@/api/testpaper/question.js";
const loading = ref(false);
const total = ref(0);  // 记得补上

const queryParams = reactive({
    pageNum: 1,
    pageSize: 10,  // 每页10条（或者20条都可以）
    questionType: ''
});
const questionList = ref([]);
const selectedQuestions = ref([]);

const previewVisible = ref(false);
const previewPage = ref(1);
const previewPageSize = 10; // 每页10道题
const optionLabel = ['A', 'B', 'C', 'D', 'E', 'F'];
const docChildren = [];

const totalQuestions = computed(() => {
    return paperSections.value.reduce((sum, sec) => sum + sec.questions.length, 0);
});

function handlePageChange() {
    getList();
}

// 计算题目的总序号
function getDisplayNumber(sectionIndex, questionIndex) {
    let number = 0;
    for (let i = 0; i < sectionIndex; i++) {
        number += paperSections.value[i].questions.length;
    }
    return number + questionIndex + 1;
}

// 获取分页后的section内题目
function pagedSectionQuestions(section) {
    const allQuestions = paperSections.value.flatMap(s => s.questions);
    const start = (previewPage.value - 1) * previewPageSize;
    const end = start + previewPageSize;
    const currentIds = new Set(allQuestions.slice(start, end).map(q => q.id));
    return section.questions.filter(q => currentIds.has(q.id));
}

// 打开预览
function previewPaper() {
    previewPage.value = 1;
    previewVisible.value = true;
}

const paperInfo = reactive({
    title: '',
    courseName: '',
    duration: 120,
});

const paperSections = ref([
    { type: 'single_choice', typeName: '一、选择题', questions: [], scorePerQuestion: 2 },
    { type: 'fill_blank', typeName: '二、填空题', questions: [], scorePerQuestion: 2, scorePerBlank: 2 },
    { type: 'short_answer', typeName: '三、简答题', questions: [] },
    { type: 'code', typeName: '四、编程题', questions: [] }
]);

const totalScore = computed(() => {
    let score = 0;
    paperSections.value.forEach(section => {
        if (section.type === 'short_answer' || section.type === 'code') {
            section.questions.forEach(q => {
                score += Number(q.score || 0);
            });
        } else if (section.type === 'fill_blank') {
            const perBlankScore = section.scorePerBlank || 2;
            section.questions.forEach(q => {
                const blankCount = (q.title.match(/____+/g) || []).length;
                score += blankCount * perBlankScore;
            });
        } else {
            score += (section.questions.length * (section.scorePerQuestion || 0));
        }
    });
    return score;
});


function handleQuery() {
    getList();
}

async function getList() {
    loading.value = true;
    try {
        const response = await listQuestion(queryParams);
        questionList.value = response.rows;
        total.value = response.total;

        const ids = response.rows.map(q => q.id);
        if (ids.length > 0) {
            const detailResponse = await batchQuestionDetail(ids);
            mergeQuestionDetails(detailResponse.data);
        }
    } finally {
        loading.value = false;
    }
}

function mergeQuestionDetails(detailList) {
    const map = new Map();
    detailList.forEach(item => {
        map.set(item.id, item);
    });

    questionList.value.forEach(q => {
        const detail = map.get(q.id);
        if (detail) {
            q.optionList = detail.optionList || [];
            q.knowledgePoints = detail.knowledgePoints || [];
            q.imageList = detail.imageList || [];
        }
    });
}

// 获取每道题得分
const getQuestionScore = (section, question) => {
    if (section.type === 'short_answer' || section.type === 'code') {
        return Number(question.score || 0);
    }

    if (section.type === 'fill_blank') {
        const title = question.title || '';
        const blanks = title.match(/_{2,}|（\s*）|【\s*】|[（(]\s*[)）]/g);
        const blankCount = blanks ? blanks.length : 0;
        return blankCount * (section.scorePerBlank || 2);
    }

    return section.scorePerQuestion || 0;
};

function resetQuery() {
    queryParams.questionType = '';
    handleQuery();
}

function handleSelectionChange(val) {
    selectedQuestions.value = val;
}

function addSelectedQuestions() {
    selectedQuestions.value.forEach(q => {
        const section = paperSections.value.find(s => s.type === q.questionType);
        if (section && !section.questions.some(existing => existing.id === q.id)) {
            const questionCopy = {
                ...q,
                options: q.optionList ? q.optionList.map(opt => opt.optionContent) : []  // 统一成 options 数组
            };
            section.questions.push(questionCopy);
        }
    });
    ElMessage.success('已加入试卷');
}


function moveQuestionUp(section, index) {
    if (index > 0) {
        [section.questions[index - 1], section.questions[index]] = [section.questions[index], section.questions[index - 1]];
    }
}

function moveQuestionDown(section, index) {
    if (index < section.questions.length - 1) {
        [section.questions[index], section.questions[index + 1]] = [section.questions[index + 1], section.questions[index]];
    }
}

function removeQuestion(section, index) {
    section.questions.splice(index, 1);
}

function createSectionHeaderRow(typeName) {
    return new Table({
        width: { size: 100, type: WidthType.PERCENTAGE },
        rows: [
            new TableRow({
                children: [
                    // 左列：得分栏子表格
                    new TableCell({
                        width: { size: 25, type: WidthType.PERCENTAGE },
                        children: [
                            new Table({
                                width: { size: 100, type: WidthType.PERCENTAGE },
                                rows: [
                                    new TableRow({
                                        children: ['得分', '评分人'].map(text =>
                                            new TableCell({
                                                children: [
                                                    new Paragraph({
                                                        children: [new TextRun({ text, font: '宋体', size: 24 })],
                                                        alignment: AlignmentType.CENTER
                                                    })
                                                ],
                                                borders: {
                                                    top: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
                                                    bottom: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
                                                    left: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
                                                    right: { style: BorderStyle.SINGLE, size: 1, color: '000000' }
                                                }
                                            })
                                        )
                                    }),
                                    new TableRow({
                                        children: ['', ''].map(() =>
                                            new TableCell({
                                                children: [
                                                    new Paragraph({
                                                        children: [new TextRun({ text: '', font: '宋体', size: 24 })],
                                                        alignment: AlignmentType.CENTER
                                                    })
                                                ],
                                                borders: {
                                                    top: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
                                                    bottom: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
                                                    left: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
                                                    right: { style: BorderStyle.SINGLE, size: 1, color: '000000' }
                                                }
                                            })
                                        )
                                    })
                                ]
                            })
                        ],
                        borders: {
                            top: { style: "none", size: 0, color: "FFFFFF" },
                            bottom: { style: "none", size: 0, color: "FFFFFF" },
                            left: { style: "none", size: 0, color: "FFFFFF" },
                            right: { style: "none", size: 0, color: "FFFFFF" }
                        }
                    }),

                    // 右列：大题标题段落（无边框）
                    new TableCell({
                        width: { size: 75, type: WidthType.PERCENTAGE },
                        children: [
                            new Paragraph({
                                children: [new TextRun({ text: typeName, bold: true, font: '宋体', size: 28 })],
                                alignment: AlignmentType.LEFT
                            })
                        ],
                        borders: {
                            top: { style: "none", size: 0, color: "FFFFFF" },
                            bottom: { style: "none", size: 0, color: "FFFFFF" },
                            left: { style: "none", size: 0, color: "FFFFFF" },
                            right: { style: "none", size: 0, color: "FFFFFF" }
                        }
                    })
                ]
            })
        ],
        alignment: AlignmentType.LEFT,
        spacing: { after: 300 }
    });
}




function createTableCell(text, removeBottomBorder = false) {
    const borders = {
        top: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
        bottom: { style: removeBottomBorder ? "none" : BorderStyle.SINGLE, size: 1, color: '000000' },
        left: { style: BorderStyle.SINGLE, size: 1, color: '000000' },
        right: { style: BorderStyle.SINGLE, size: 1, color: '000000' }
    };

    return new TableCell({
        children: [new Paragraph({
            children: [new TextRun({ text, font: '宋体', size: 24 })],
            alignment: AlignmentType.CENTER
        })],
        borders: borders
    });
}


function createFooterParagraph() {
    return new Paragraph({
        children: [
            new TextRun({ text: '第 ', font: '宋体' }),
            new TextRun({
                font: '宋体',
                field: {
                    type: 'PAGE'
                }
            }),
            new TextRun({ text: ' 页', font: '宋体' })
        ],
        alignment: AlignmentType.CENTER
    });
}


function exportPDF() {
    const element = document.getElementById('previewContent');
    html2pdf()
        .set({
            margin: [0.5, 0.5, 0.5, 0.5],
            filename: `${paperInfo.title || '试卷'}.pdf`,
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' }
        })
        .from(element)
        .save();
}

function exportWord() {
    console.log('导出Word触发了');
    const startTime = Date.now(); // ⏱ 开始时间打点

    const docChildren = [];
    let totalScore = 0;

    // 标题部分
    docChildren.push(
        new Paragraph({
            children: [new TextRun({ text: paperInfo.title || '贵州大学 2023-2024 学年第一学期考试试卷 A', bold: true, font: '宋体', size: 32 })],
            alignment: AlignmentType.CENTER,
            spacing: { after: 200 }
        }),
        new Paragraph({
            children: [new TextRun({ text: paperInfo.courseName || '', font: '宋体', size: 28 })],
            alignment: AlignmentType.CENTER
        }),
    );

    // 注意事项标题（不缩进，加粗）
    docChildren.push(new Paragraph({
        children: [new TextRun({ text: '注意事项：', font: '宋体', size: 24, bold: true })],
        spacing: { after: 100 }
    }));

    // 注意事项 1~4（首行缩进 2 字）
    [
        '1. 请考生按要求填写姓名、学号和年级专业。',
        '2. 请仔细阅读各种题目的回答要求。',
        '3. 不要在试卷上乱写乱画，不要在装订线内填写无关内容。',
        '4. 满分100分，考试时间120分钟。'
    ].forEach(note => {
        docChildren.push(new Paragraph({
            children: [new TextRun({ text: note, font: '宋体', size: 24 })],
            spacing: { after: 100 },
            indent: { firstLine: 420 } // 两个汉字左右
        }));
    });


    // 总得分表格
    const header = ['题号', '一', '二', '三', '四', '总分', '统分人'];
    docChildren.push(
        new Table({
            width: { size: 90, type: WidthType.PERCENTAGE },
            rows: [
                new TableRow({ children: header.map(text => createTableCell(text)) }),
                new TableRow({ children: header.map(() => createTableCell('')) })
            ],
            alignment: AlignmentType.CENTER
        })
    );

    // 正式题目内容
    let counter = 1;
    paperSections.value.forEach(section => {
        docChildren.push(new Paragraph({ text: '', children: [] }));
        docChildren.push(createSectionHeaderRow(section.typeName));

        section.questions.forEach(q => {
            const qScore = getQuestionScore(section, q);
            totalScore += qScore;

            docChildren.push(new Paragraph({
                children: [new TextRun({ text: `${counter++}. ${q.title}`, font: '宋体', size: 24 })],
                spacing: { after: 100 }
            }));

            // 选择题选项
            if (q.options && section.type === 'single_choice') {
                for (let i = 0; i < q.options.length; i += 2) {
                    const firstOption = optionLabel[i] + '. ' + (q.options[i] || '');
                    const secondOption = q.options[i + 1] ? optionLabel[i + 1] + '. ' + q.options[i + 1] : '';
                    docChildren.push(new Paragraph({
                        children: [
                            new TextRun({ text: firstOption, font: '宋体', size: 24 }),
                            new TextRun({ text: '                                              ', font: '宋体' }),  // 用空格拉开间距
                            new TextRun({ text: secondOption, font: '宋体', size: 24 })
                        ],
                        spacing: { after: 100 },
                        indent: { left: 400 }
                    }));
                }
            }

            // 填空题占位
            if (section.type === 'fill_blank') {
                docChildren.push(new Paragraph({
                    children: [new TextRun({ text: '', font: '宋体', size: 24 })],
                    spacing: { after: 200 }
                }));
            }

            // 简答 / 代码题 留白段落（空行）
            if (section.type === 'short_answer' || section.type === 'code') {
                for (let i = 0; i < 5; i++) {
                    docChildren.push(new Paragraph({
                        children: [new TextRun({ text: '', font: '宋体', size: 24 })],
                        spacing: { after: 200 }
                    }));
                }
            }
        }); // ⬅️ 这里才是 q 的作用域结束
    });

    const doc = new Document({
        sections: [{
            properties: {},
            footers: {
                default: new Footer({
                    children: [createFooterParagraph()]
                })
            },
            children: docChildren
        }]
    });

    Packer.toBlob(doc).then(blob => {
        const endTime = Date.now(); // ⏱ 结束时间打点
        const duration = endTime - startTime;
        console.log(`📦 Word 导出完成，用时 ${duration} 毫秒`);
        saveAs(blob, `${paperInfo.title || '试卷'}.docx`);
        ElMessage.success(`Word 导出成功，耗时 ${duration}ms`);
    });
}

function exportAnswerWord() {
    const docChildren = [];

    // 标题部分（答卷头）
    docChildren.push(
        new Paragraph({
            children: [new TextRun({ text: (paperInfo.title || '贵州大学 2023-2024 学年第一学期考试试卷 A') + '（参考答案）', bold: true, font: '宋体', size: 32 })],
            alignment: AlignmentType.CENTER,
            spacing: { after: 200 }
        }),
        new Paragraph({
            children: [new TextRun({ text: paperInfo.courseName || '', font: '宋体', size: 28 })],
            alignment: AlignmentType.CENTER
        }),
    );

    // ---------- 知识点分布 ----------
    const kpMap = new Map();
    let qNum = 1;

    paperSections.value.forEach(section => {
        section.questions.forEach(q => {
            const kps = q.knowledgePoints && q.knowledgePoints.length > 0 ? q.knowledgePoints : ['未定义章节'];
            const points = Array.isArray(kps) ? kps : [kps];
            const score = getQuestionScore(section, q);
            points.forEach(kp => {
                if (!kpMap.has(kp)) kpMap.set(kp, []);
                kpMap.get(kp).push(score);
            });
            qNum++;
        });
    });

    docChildren.push(new Paragraph({
        children: [new TextRun({ text: '分布：', font: '宋体', size: 24, bold: true })],
        spacing: { after: 200 }
    }));

    kpMap.forEach((scores, kp) => {
        const total = scores.reduce((a, b) => a + b, 0);
        const line = `${kp} ${scores.join(' ')} = ${total}`;
        docChildren.push(new Paragraph({
            children: [new TextRun({ text: line, font: '宋体', size: 24 })],
            spacing: { after: 100 }
        }));
    });

    docChildren.push(new Paragraph({ text: '', spacing: { after: 300 } }));

    // ---------- 每题型答案 ----------
    const typeNameMap = {
        single_choice: '一、选择题',
        fill_blank: '二、填空题',
        short_answer: '三、简答题',
        code: '四、编程题'
    };

    paperSections.value.forEach(section => {
        const scorePerQuestion = (section.questions.length > 0) ? getQuestionScore(section, section.questions[0]) : 0;
        let total = 0;
        let perItemDesc = '';

        if (section.type === 'fill_blank') {
            const scorePerBlank = section.scorePerBlank || 2;
            let totalBlanks = 0;
            section.questions.forEach(q => {
                const blankCount = (q.title.match(/____+/g) || []).length;
                totalBlanks += blankCount;
            });
            total = totalBlanks * scorePerBlank;
            perItemDesc = `每空${scorePerBlank}分`;
        } else {
            const scorePerQuestion = section.questions.length > 0 ? getQuestionScore(section, section.questions[0]) : 0;
            total = section.questions.length * scorePerQuestion;
            perItemDesc = `每题${scorePerQuestion}分`;
        }

        const title = `[指标点] ${typeNameMap[section.type]}（共${total}分, ${perItemDesc}）`;

        docChildren.push(new Paragraph({
            children: [new TextRun({ text: title, font: '宋体', size: 24, bold: true })],
            spacing: { after: 200 }
        }));

        let localCounter = 1;

        section.questions.forEach(q => {
            if (section.type === 'code') {
                docChildren.push(new Paragraph({
                    children: [new TextRun({ text: `${localCounter++}. `, font: '宋体', size: 24 })],
                    spacing: { after: 100 }
                }));
                docChildren.push(...renderMultilineCode(q.answer || ''));
            } else {
                docChildren.push(new Paragraph({
                    children: [new TextRun({ text: `${localCounter++}. ${q.answer || '(无答案)'}`, font: '宋体', size: 24 })],
                    spacing: { after: 100 }
                }));
            }
        });

        docChildren.push(new Paragraph({ text: '', spacing: { after: 300 } }));
    });


    const doc = new Document({
        sections: [{
            children: docChildren
        }]
    });

    Packer.toBlob(doc).then(blob => {
        saveAs(blob, `${paperInfo.title || '试卷'} 参考答案.docx`);
    });
}
function getAnswerText(q) {
    if (!q) return '无';

    if (q.questionType === 'single_choice' && q.optionList?.length) {
        const correctOpt = q.optionList.find(opt => opt.isCorrect);
        const idx = q.optionList.indexOf(correctOpt);
        if (idx !== -1) {
            return `${optionLabel[idx]}. ${correctOpt.optionContent}`;
        }
    }

    return q.answer || '无';
}

function renderMultilineCode(codeStr) {
    const lines = codeStr.split('\n');
    return lines.map(line =>
        new Paragraph({
            children: [
                new TextRun({
                    text: line,
                    font: '宋体',
                    size: 24,
                })
            ],
            spacing: { after: 100 },
        })
    );
}


</script>

<style scoped>
.page {
    page-break-after: always;
    padding: 20px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    background: white;
}
.question-item {
    margin: 10px 0;
}
.answer-line {
    border-bottom: 1px dashed #999;
    height: 20px;
    margin-top: 5px;
}

.question-item {
    margin: 10px 0;
}
.answer-line {
    border-bottom: 1px dashed #999;
    height: 20px;
    margin-top: 5px;
}
#previewContent {
    font-family: '宋体', serif;
    line-height: 1.8;
    font-size: 16px;
}

.question-block {
    margin-bottom: 20px;
    font-size: 16px;
    font-family: '宋体';
}
table {
    border-collapse: collapse; /* 合并表格边框 */
    width: 100%;
}
td, th {
    border: 1px solid #000; /* 设置边框 */
    padding: 8px;
    text-align: center; /* 居中对齐 */
}
.el-card {
    margin-bottom: 10px;
}
.el-form-item {
    margin-bottom: 5px;
}
.card-block {
    margin-bottom: 24px;
}

.section-block {
    margin-top: 16px;
    padding: 12px;
    border-left: 4px solid #409EFF;
    background-color: #f9f9f9;
    border-radius: 4px;
}

</style>
