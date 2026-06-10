<template>
    <div class="distribution-config">
        <h2 style="margin-bottom: 16px">📊 命题分布配置表</h2>

        <el-table :data="chapterDistributions" border style="width: 100%">
            <el-table-column prop="kpName" label="章节" width="120" />

            <el-table-column label="选择题（分）">
                <template #default="scope">
                    <el-input-number
                        v-model="scope.row.single_choice"
                        :min="0"
                        :step="1"
                    />
                </template>
            </el-table-column>

            <el-table-column label="填空题（分）">
                <template #default="scope">
                    <el-input-number
                        v-model="scope.row.fill_blank"
                        :min="0"
                        :step="1"
                    />
                </template>
            </el-table-column>

            <el-table-column label="简答题（分）">
                <template #default="scope">
                    <el-input-number
                        v-model="scope.row.short_answer"
                        :min="0"
                        :step="1"
                    />
                </template>
            </el-table-column>

            <el-table-column label="编程题（分）">
                <template #default="scope">
                    <el-input-number v-model="scope.row.code" :min="0" :step="1" />
                </template>
            </el-table-column>

            <el-table-column label="小计">
                <template #default="scope">
                    <span>{{ rowTotal(scope.row) }}</span>
                </template>
            </el-table-column>
        </el-table>

        <div style="margin-top: 20px; text-align: right">
            <b>总分：</b> {{ totalScore }} 分
        </div>

        <el-form :inline="true" style="margin-bottom: 20px">
            <el-form-item label="试卷标题：">
                <el-input v-model="paperTitle" placeholder="请输入试卷标题" style="width: 300px" />
            </el-form-item>
            <el-form-item label="授课专业：">
                <el-input v-model="metaInfo.major" style="width: 300px" />
            </el-form-item>
            <el-form-item label="年级：">
                <el-input v-model="metaInfo.grade" style="width: 300px" />
            </el-form-item>
            <el-form-item label="考试形式：">
                <el-input v-model="metaInfo.examType" style="width: 300px" />
            </el-form-item>
            <el-form-item label="闭卷 / 开卷：">
                <el-input v-model="metaInfo.openStatus" style="width: 300px" />
            </el-form-item>
            <el-form-item label="考试时间（分钟）：">
                <el-input v-model="metaInfo.duration" style="width: 300px" />
            </el-form-item>
            <el-form-item label="模拟完成时间：">
                <el-input v-model="metaInfo.simulate" style="width: 300px" />
            </el-form-item>
        </el-form>
<!--        <el-button type="danger" @click="injectTestPaper">载入测试数据</el-button>-->

        <el-button type="primary" :loading="loadingVisible" @click="handleAutoGenerate">点击组卷</el-button>
        <el-button type="success" @click="exportAgentWord">导出试卷 Word</el-button>
        <el-button type="info" @click="exportAgentAnswer">导出答案 Word</el-button>
        <el-button type="warning" @click="exportAgentPdf">导出 PDF</el-button>
        <el-button type="primary" @click="exportDistributionWord">导出分布表 Word</el-button>

        <!-- 导出与题目展示 -->
        <template v-if="currentPaper && currentPaper.sections">
            <h3>📋 当前试卷：{{ currentPaper.paperTitle }}</h3>

            <div v-for="(section, sidx) in currentPaper.sections" :key="sidx" style="margin-top: 16px">
                <h4>{{ section.title }}</h4>

                <div
                    v-for="(q, idx) in section.questions"
                    :key="idx"
                    class="question-preview"
                    style="margin-bottom: 12px"
                >
                    <p><strong>{{ q.number || idx + 1 }}. {{ q.title }}</strong></p>
                    <!-- 选择题选项 -->
                    <ul v-if="q.options && q.options.length">
                        <li v-for="(opt, i) in q.options" :key="i">
                            {{ optionLabel[i] || String.fromCharCode(65 + i) }}. {{ opt }}
                        </li>
                    </ul>
                    <p v-if="q.answer"><i>答案：</i> {{ q.answer }}</p>
                    <p v-if="q.analysis"><i>解析：</i> {{ q.analysis }}</p>
                    <!-- 其他题留空 -->
                    <div
                        v-else
                        style="height: 80px; border-bottom: 1px dashed #ccc; margin-top: 10px"
                    ></div>
                </div>
            </div>
        </template>

        <div id="pdfPreviewContent" style="padding: 20px; background: #fff; margin-top: 32px; display: none">
            <h2 style="text-align: center">自动组卷试卷</h2>
            <div v-for="(q, i) in parsedResult.questions" :key="i" style="margin-bottom: 20px">
                <p><strong>{{ i + 1 }}. {{ q.title }}</strong></p>
                <div v-if="q.options && q.options.length">
                    <div v-for="(opt, idx) in q.options" :key="idx">
                        {{ optionLabel[idx] }}. {{ opt }}
                    </div>
                </div>
                <div v-else style="height: 100px; border-bottom: 1px solid #ccc; margin-top: 10px"></div>
            </div>
        </div>

    </div>
    <el-dialog
        v-model="loadingVisible"
        width="400"
        title="自动组卷中"
        :close-on-click-modal="false"
        :show-close="false"
        :align-center="true"
    >
        <div style="text-align: center; padding: 20px 0">
            <el-icon class="is-loading" style="font-size: 32px; margin-bottom: 10px">
                <el-icon-loading />
            </el-icon>
            <div style="font-size: 16px">
                大模型正在智能生成试卷，请耐心等待<br />
                <small style="color: #999;">预计耗时 2～3 分钟</small>
            </div>
        </div>
    </el-dialog>

</template>

<script setup>
import mockPaperRaw from './package.json'; // 或将对象粘贴进脚本中
import { addPaperlist } from "@/api/paper/paperlist";
const injectTestPaper = () => {
    const paper = normalizePaper(mockPaperRaw.data); // ✅ 使用正确的字段
    console.log("原始mock数据", mockPaperRaw);

    paperMap.value = { [paper.paperTitle]: paper };
    selectedKey.value = paper.paperTitle;
    updateDistributionFromPaper(paper);

    // ✅ 同步 parsedResult 用于 PDF/Word 导出
    parsedResult.value.questions = paper.sections.flatMap(s => s.questions.map(q => ({
        ...q,
        type: q.type || s.type // 补全题型
    })));

    ElMessage.success("测试数据已加载！");
};

/* ---------- 依赖 ---------- */
import { Loading as ElIconLoading } from '@element-plus/icons-vue'
import { ref, computed } from 'vue'
import { ElMessage } from 'element-plus'
import { saveAs } from 'file-saver';
import {
    Document,
    Packer,
    Paragraph,
    TextRun,
    AlignmentType,
    Table,
    WidthType,
    TableRow,
    TableCell,
    BorderStyle,
    Footer,
    HeightRule
} from 'docx';
import { getUserProfile } from "@/api/system/user";
const state = reactive({
    user: {},
    roleGroup: {},
    postGroup: {}
});
const loadingVisible = ref(false);

const metaInfo = reactive({
    major: '计算机科学与技术',
    grade: '2022级',
    examType: '考试',
    openStatus: '闭卷',
    duration: '120',
    simulate: '60'
});

function getUser() {
    getUserProfile().then(response => {
        state.user = response.data;
        state.roleGroup = response.roleGroup;
        state.postGroup = response.postGroup;
    });
};
import axios from 'axios'

const parsedResult = ref({
    questions: [] // 接口返回后赋值即可
});
const paperMap = ref({});
const selectedKey = ref('');
const currentPaper = computed(() => paperMap.value[selectedKey.value] || null);
const termTitle = ref("2023-2024学年 第一学期"); // 学期标题输入

/* ---------- 常量 ---------- */
const API_BASE = 'http://localhost:8080'

/* ---------- 表格数据 ---------- */
const chapterDistributions = ref([
    {
        kpName: '第一章 绪论',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    },
    {
        kpName: '第二章 线性表',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    },
    {
        kpName: '第三章 栈和队列',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    },
    {
        kpName: '第四章 串和广义表',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    },
    {
        kpName: '第五章 树和二叉树',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    },
    {
        kpName: '第六章 图',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    },
    {
        kpName: '第七章 查找',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    },
    {
        kpName: '第八章 排序',
        single_choice: 0,
        fill_blank: 0,
        short_answer: 0,
        code: 0
    }
])
onMounted(() => {
    paperMap.value = {
        "测试卷": {
            paperTitle: "测试卷",
            sections: [
                {
                    type: "single_choice",
                    title: "一、选择题",
                    questions: [
                        {
                            number: 1,
                            title: "以下哪个是编程语言？",
                            options: ["Java", "HTML", "Excel", "Photoshop"],
                            answer: "A",
                            analysis: "Java 是编程语言，其他是工具或标记语言",
                            score: 2
                        }
                    ]
                }
            ]
        }
    };
    selectedKey.value = "测试卷";
});

const paperTitle = ref('数据结构综合试卷'); // 默认值可为空

/* ---------- 计算属性 ---------- */
const rowTotal = (row) =>
    row.single_choice + row.fill_blank + row.short_answer + row.code

const totalScore = computed(() =>
    chapterDistributions.value.reduce((sum, row) => sum + rowTotal(row), 0)
)

/* ---------- 生成任务 ---------- */

function exportAgentPdf() {
    if (!parsedResult.value || !parsedResult.value.questions?.length) {
        ElMessage.warning('无题目可导出');
        return;
    }
    saveExportedPaperToDB();

    // 确保预览区域显示
    const preview = document.getElementById('pdfPreviewContent');
    if (!preview) {
        ElMessage.error('找不到预览区域');
        return;
    }

    preview.style.display = 'block'; // 确保内容显示（html2pdf 要抓内容）

    html2pdf()
        .set({
            margin: 0.5,
            filename: '自动组卷试卷.pdf',
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' }
        })
        .from(preview)
        .save()
        .then(() => {
            preview.style.display = 'none'; // 导出后隐藏
        });
}
const AUTO_SELECT_URL = `${API_BASE}/api/rag/auto-select`
const normalizePaper = (paper) => {
    if (!paper?.sections) return paper;

    for (const section of paper.sections) {
        for (const question of section.questions || []) {
            // 1. optionList to options
            if (question.optionList && Array.isArray(question.optionList)) {
                question.options = question.optionList.map(opt =>
                    typeof opt === 'string' ? opt : opt.optionContent
                );
            }

            // 2. 补全 type 字段（可能为空）
            if (!question.type && section.type) {
                question.type = section.type;
            }
        }
    }

    return paper;
};

const handleAutoGenerate = async () => {
    const tasks = generateTasks();

    if (tasks.length === 0) {
        ElMessage.warning("请至少为一个章节设置分值！");
        return;
    }

    loadingVisible.value = true;

    try {
        const payload = {
            paperTitle: paperTitle.value || "未命名试卷",
            tasks
        };

        const response = await axios.post(AUTO_SELECT_URL, payload);

        if (response.data && response.data.code === 200) {
            const paper = normalizePaper(response.data.data);

            paperMap.value = {
                [paper.paperTitle]: paper
            };
            selectedKey.value = paper.paperTitle;


            if (!selectedKey.value) {
                ElMessage.warning("未获取到试卷内容");
            } else {
                ElMessage.success("自动组卷成功！");
            }
        } else {
            ElMessage.error(response.data.msg || "组卷失败，请稍后重试");
        }
    } catch (err) {
        console.error("调用失败", err);
        ElMessage.error("请求失败，请检查网络或后端服务");
    } finally {
        loadingVisible.value = false; // ✅ 正确关闭弹窗
    }
};

function groupQuestionsByTypeFromSections(sections) {
    const grouped = {};
    for (const section of sections) {
        for (const question of section.questions || []) {
            const type = question.type || section.type;
            if (!grouped[type]) grouped[type] = [];
            grouped[type].push(question);
        }
    }
    return grouped;
}

const generateTasks = () => {
    const tasks = [];
    chapterDistributions.value.forEach((row) => {
        const kpName = row.kpName?.trim();
        if (!kpName) return;

        Object.entries(row).forEach(([key, val]) => {
            if (key === 'kpName') return;
            if (!val || isNaN(val) || val <= 0) return;

            tasks.push({
                kpName,
                questionType: key,
                score: val,
                limit: 10 // 默认最多10题
            });
        });
    });
    return tasks;
};

const saveExportedPaperToDB = () => {
    const paper = currentPaper.value;
    if (!paper) return;
    return addPaperlist({
        paperName: paper.paperTitle,
        creatorId: state.user.userId,
        totalScore: paper.totalScore || 100,
        remarks: "由导出功能添加"
    });
};
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
function exportAgentWord() {
    const paper = currentPaper.value;
    if (!paper || !paper.sections || paper.sections.length === 0) {
        ElMessage.warning("没有可导出的试卷");
        return;
    }
    if (!parsedResult.value || !parsedResult.value.questions) return;
    saveExportedPaperToDB();

    const docChildren = [];

    // 标题与说明
    docChildren.push(
        new Paragraph({
            children: [new TextRun({ text: paper.paperTitle || "未命名试卷", bold: true, font: '宋体', size: 32 })],
            alignment: AlignmentType.CENTER,
            spacing: { after: 200 }
        }),
        new Paragraph({
            children: [new TextRun({ text: '考试时间：120 分钟    满分：100 分', font: '宋体', size: 24 })],
            alignment: AlignmentType.CENTER,
            spacing: { after: 300 }
        })
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

    docChildren.push(new Paragraph({ text: '', children: [] }));

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
    docChildren.push(new Paragraph({ text: '', children: [] }));

    // 大题区块：按题型分组
    const grouped = groupQuestionsByTypeFromSections(currentPaper.value.sections);

    for (const type in grouped) {
        const questions = grouped[type];
        const typeNameMap = {
            single_choice: '一、选择题',
            fill_blank: '二、填空题',
            short_answer: '三、简答题',
            code: '四、编程题'
        };

        docChildren.push(createSectionHeaderRow(typeNameMap[type] || '其他题型'));
        let localIndex = 1;

        questions.forEach(q => {
            docChildren.push(new Paragraph({
                children: [new TextRun({ text: `${localIndex++}. ${q.title}`, font: '宋体', size: 24 })],
                spacing: { after: 100 }
            }));

            // 选择题选项
            if (q.options && type === 'single_choice') {
                for (let i = 0; i < q.options.length; i += 2) {
                    const opt1 = optionLabel[i] + '. ' + q.options[i];
                    const opt2 = q.options[i + 1] ? optionLabel[i + 1] + '. ' + q.options[i + 1] : '';
                    docChildren.push(new Paragraph({
                        children: [
                            new TextRun({ text: opt1, font: '宋体', size: 24 }),
                            new TextRun({ text: '          ', font: '宋体' }),
                            new TextRun({ text: opt2, font: '宋体', size: 24 })
                        ],
                        indent: { left: 400 },
                        spacing: { after: 100 }
                    }));
                }
            }

            // 留白（非选择题）
            if (type === 'code') {
                // 编程题保留 6 行空白
                for (let i = 0; i < 6; i++) {
                    docChildren.push(new Paragraph({
                        children: [new TextRun({ text: '', font: '宋体', size: 24 })],
                        spacing: { after: 200 }
                    }));
                }
            } else if (type === 'short_answer') {
                // 简答题可留 4 行
                for (let i = 0; i < 2; i++) {
                    docChildren.push(new Paragraph({
                        children: [new TextRun({ text: '', font: '宋体', size: 24 })],
                        spacing: { after: 150 }
                    }));
                }
            }
// 填空题不留空行

        });
    }

    // 页脚
    const doc = new Document({
        sections: [{
            footers: {
                default: new Footer({ children: [createFooterParagraph()] })
            },
            children: docChildren
        }]
    });

    Packer.toBlob(doc).then(blob => saveAs(blob, `${paper.paperTitle || '试卷'}.docx`));
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
function updateDistributionFromPaper(paper) {
    const map = {};

    // 初始化 map，以章节名为 key
    chapterDistributions.value.forEach(row => {
        map[row.kpName] = {
            single_choice: 0,
            fill_blank: 0,
            short_answer: 0,
            code: 0
        };
    });

    paper.sections.forEach(section => {
        section.questions.forEach(q => {
            const kpList = q.knowledgePoints || [];
            const type = q.type || section.type;

            kpList.forEach(kp => {
                const kpName = typeof kp === 'object' ? kp.kpName : kp;
                if (!map[kpName]) return;

                if (type === 'single_choice') map[kpName].single_choice += q.score || 0;
                else if (type === 'fill_blank') map[kpName].fill_blank += q.score || 0;
                else if (type === 'short_answer') map[kpName].short_answer += q.score || 0;
                else if (type === 'code' || type === 'programming') map[kpName].code += q.score || 0;
            });
        });
    });

    // 写回 chapterDistributions
    chapterDistributions.value.forEach(row => {
        const newRow = map[row.kpName] || {};
        row.single_choice = newRow.single_choice || 0;
        row.fill_blank = newRow.fill_blank || 0;
        row.short_answer = newRow.short_answer || 0;
        row.code = newRow.code || 0;
    });
}

function generateScoreDistributionText() {
    const lines = ['分布：'];
    chapterDistributions.value.forEach(row => {
        const scores = [row.single_choice, row.fill_blank, row.short_answer, row.code];
        const filtered = scores.filter(s => s > 0); // 仅展示有分数的项
        const total = scores.reduce((sum, s) => sum + s, 0);
        const line = `${row.kpName} ${filtered.join('  ')} = ${total}`;
        lines.push(line);
    });
    return lines.join('\n');
}

function exportAgentAnswer() {
    if (!parsedResult.value || !parsedResult.value.questions) return;

    const docChildren = [];

    docChildren.push(
        new Paragraph({
            children: [new TextRun({ text: `${currentPaper.value?.paperTitle || "试卷"}（参考答案）`, bold: true, font: '宋体', size: 32 })],
            alignment: AlignmentType.CENTER,
            spacing: { after: 200 }
        })
    );

    const grouped = groupQuestionsByTypeFromSections(currentPaper.value.sections);
    const typeNameMap = {
        single_choice: '一、选择题',
        fill_blank: '二、填空题',
        short_answer: '三、简答题',
        code: '四、编程题'
    };
    // 📌 添加分布说明段（使用宋体单段落）
    const distributionText = generateScoreDistributionText();
    distributionText.split('\n').forEach(line => {
        docChildren.push(new Paragraph({
            children: [new TextRun({ text: line, font: '宋体', size: 24 })],
            spacing: { after: 100 }
        }));
    });

    for (const type in grouped) {
        const questions = grouped[type];

        docChildren.push(new Paragraph({
            children: [new TextRun({ text: typeNameMap[type] || '其他题型', bold: true, font: '宋体', size: 24 })],
            spacing: { after: 100 }
        }));

        questions.forEach((q, i) => {
            // 答案处理
            if (q.type === 'code' && q.answer) {
                // 处理代码题答案：按行显示
                const codeLines = q.answer.split('\n');
                docChildren.push(new Paragraph({
                    children: [new TextRun({ text: `第 ${i + 1} 题：`, font: '宋体', size: 24, bold: true })],
                    spacing: { after: 30 }
                }));

                docChildren.push(new Paragraph({
                    children: [new TextRun({ text: `答：${q.answer || '无'}`, font: '宋体', size: 24 })],
                    spacing: { after: 50 }
                }));


                codeLines.forEach(line => {
                    docChildren.push(new Paragraph({
                        children: [new TextRun({ text: line, font: 'Consolas', size: 22 })],
                        spacing: { after: 20 }
                    }));
                });
            } else {
                // 其他题型处理方式不变
                docChildren.push(new Paragraph({
                    children: [
                        new TextRun({ text: `${i + 1}. 答案：${q.answer || '无'}`, font: '宋体', size: 24 })
                    ],
                    spacing: { after: 50 }
                }));
            }

            // 解析部分
            if (q.analysis) {
                docChildren.push(new Paragraph({
                    children: [
                        new TextRun({ text: `解析：${q.analysis}`, font: '宋体', size: 24 })
                    ],
                    spacing: { after: 100 }
                }));
            }
        });


        docChildren.push(new Paragraph({ text: '', spacing: { after: 200 } }));
    }

    const doc = new Document({ sections: [{ children: docChildren }] });
    Packer.toBlob(doc).then(blob => saveAs(blob, `${currentPaper.value?.paperTitle || '试卷'}-参考答案.docx`));
}

const optionLabel = ['A', 'B', 'C', 'D', 'E', 'F'];

function groupQuestionsByType(questions) {
    const map = {};
    for (const q of questions) {
        if (!map[q.type]) map[q.type] = [];
        map[q.type].push(q);
    }
    return map;
}
getUser();
function exportDistributionWord() {
    const userName = state.user?.nickName || '系统自动生成';
    const dateObj = new Date();
    const dateString = `${dateObj.getFullYear()}年${dateObj.getMonth() + 1}月${dateObj.getDate()}日`;
    const titleText = `${paperTitle.value || "试卷"}命题分布表`;

    const docChildren = [];

    //在最顶部插入学年学期段落（黑体）
    docChildren.push(
        new Paragraph({
            children: [
                new TextRun({
                    text: termTitle.value || "",
                    font: "SimHei", // 黑体
                    size: 24,
                    bold: true
                })
            ],
            alignment: AlignmentType.CENTER,
            spacing: { after: 100 }
        })
    );


    // 大标题：使用黑体
    docChildren.push(new Paragraph({
        children: [
            new TextRun({
                text: `《${titleText}》`,
                font: "SimHei", // 黑体
                size: 32,
                bold: true
            })
        ],
        alignment: AlignmentType.CENTER,
        spacing: { after: 300 }
    }));

// 基本信息：一行拼接、用户输入 + 空格隔开，无需下划线
    const makeLine = (leftLabel, leftVal, rightLabel, rightVal) => {
        return new Paragraph({
            children: [
                new TextRun({ text: `${leftLabel}：`, font: "宋体", size: 24 }),
                new TextRun({ text: leftVal || "（未填写）", font: "宋体", size: 24 }),
                new TextRun({ text: "        ", font: "宋体", size: 24 }), // 中间空格
                new TextRun({ text: `${rightLabel}：`, font: "宋体", size: 24 }),
                new TextRun({ text: rightVal || "（未填写）", font: "宋体", size: 24 })
            ],
            spacing: { after: 100 }
        });
    };


    docChildren.push(
        makeLine("授课专业", metaInfo.major, "年级(班级)", metaInfo.grade),
        makeLine("考试（查）", metaInfo.examType, "闭卷或开卷", metaInfo.openStatus),
        makeLine("考试时间（分钟）", metaInfo.duration, "教师模拟完成时间（分钟）", metaInfo.simulate),
        new Paragraph({ text: "", spacing: { after: 200 } })
    );

    // 表格构建
    const rows = [];

    // 顶部表头行：题型 + 分值合并
    const headerRow = new TableRow({
        height: { value: 900, rule: HeightRule.AT_LEAST },
        children: [
            // 左上角“章节/题目”模拟
            new TableCell({
                rowSpan: 1,
                children: [
                    new Paragraph({
                        children: [new TextRun({ text: "题目", font: "宋体", size: 24 })],
                        alignment: AlignmentType.RIGHT
                    }),
                    new Paragraph({
                        children: [new TextRun({ text: "章节", font: "宋体", size: 24 })],
                        alignment: AlignmentType.LEFT
                    })
                ],
                verticalAlign: "center",
                rowSpan: 1
            }),
            ...["一、选择题（分值）", "二、填空题（分值）", "三、简答题（分值）", "四、编程题（分值）", "各章分数所占比例（%）"].map(label =>
                new TableCell({
                    children: [new Paragraph({
                        children: [new TextRun({ text: `${label}`, font: "宋体", size: 24 })],
                        alignment: AlignmentType.CENTER
                    })],
                    verticalAlign: "center"
                })
            )
        ]
    });
    rows.push(headerRow);

    // 数据行
    const totalScore = chapterDistributions.value.reduce((sum, row) =>
        sum + row.single_choice + row.fill_blank + row.short_answer + row.code, 0);

    chapterDistributions.value.forEach(row => {
        const total = row.single_choice + row.fill_blank + row.short_answer + row.code;
        const percent = totalScore > 0 ? Math.round((total / totalScore) * 100) : 0;

        const dataRow = new TableRow({
            height: { value: 1000, rule: HeightRule.AT_LEAST },
            children: [
                new TableCell({
                    children: [new Paragraph({ text: row.kpName, font: "宋体", size: 24 })],
                    verticalAlign: "center"
                }),
                ...[row.single_choice, row.fill_blank, row.short_answer, row.code, `${percent}%`].map(val =>
                    new TableCell({
                        children: [new Paragraph({ text: String(val), font: "宋体", size: 24, alignment: AlignmentType.CENTER })],
                        verticalAlign: "center"
                    })
                )
            ]
        });

        rows.push(dataRow);
    });

    // 合计行
    const scoreSumRow = new TableRow({
        height: { value: 1000, rule: HeightRule.AT_LEAST },
        children: [
            new TableCell({
                children: [new Paragraph({ text: "分数合计", font: "宋体", size: 24 })],
                verticalAlign: "center"
            }),
            ...["single_choice", "fill_blank", "short_answer", "code"].map(key =>
                new TableCell({
                    children: [new Paragraph({
                        text: String(chapterDistributions.value.reduce((s, r) => s + r[key], 0)),
                        font: "宋体",
                        size: 24 ,
                        alignment: AlignmentType.CENTER
                    })],
                    verticalAlign: "center"
                })
            ),
            new TableCell({
                children: [new Paragraph({ text: "100", font: "宋体", size: 24 })],
                verticalAlign: "center"
            })
        ]
    });
    rows.push(scoreSumRow);

    const table = new Table({
        rows,
        width: { size: 100, type: WidthType.PERCENTAGE },
        borders: {
            top: { style: BorderStyle.SINGLE, size: 1, color: "000000" },
            bottom: { style: BorderStyle.SINGLE, size: 1, color: "000000" },
            left: { style: BorderStyle.SINGLE, size: 1, color: "000000" },
            right: { style: BorderStyle.SINGLE, size: 1, color: "000000" },
            insideHorizontal: { style: BorderStyle.SINGLE, size: 1, color: "000000" },
            insideVertical: { style: BorderStyle.SINGLE, size: 1, color: "000000" }
        }
    });

    docChildren.push(table);

    // 命题教师与日期
    docChildren.push(
        new Paragraph({
            text: `命题教师：${userName}`,
            alignment: AlignmentType.RIGHT,
            spacing: { before: 300 },
            font: "宋体",
            size: 24
        }),
        new Paragraph({
            text: dateString,
            alignment: AlignmentType.RIGHT,
            font: "宋体",
            size: 24
        })
    );

    // 创建文档
    const doc = new Document({ sections: [{ children: docChildren }] });

    Packer.toBlob(doc).then(blob => {
        saveAs(blob, `${titleText}.docx`);
    });
}



</script>

<style scoped>
.distribution-config {
    padding: 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}
</style>
