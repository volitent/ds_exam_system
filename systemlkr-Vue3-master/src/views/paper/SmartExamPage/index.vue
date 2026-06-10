<template>
    <div class="app-container smart-exam-page">
        <!-- 左侧结构化出题 -->
        <div class="panel left-panel">
            <h2>结构化出题</h2>
            <fieldset class="type-block" v-for="type in questionTypes" :key="type">
                <legend>{{ type }}</legend>
                <div class="row">
                    <label>章节</label>
                    <select v-model="chaptersByType[type]" class="selector">
                        <option value="">无</option>
                        <option v-for="ch in filteredChapters" :key="ch" :value="ch">{{ ch }}</option>
                    </select>
                </div>
                <div class="row">
                    <label>数量</label>
                    <input type="number" min="0" class="input-box" v-model.number="counts[type]" placeholder="输入数量" />
                </div>
            </fieldset>

            <div class="group-label">统一设置难度</div>
            <select v-model="difficulty" class="selector">
                <option disabled value="">选择难度</option>
                <option v-for="d in difficulties" :key="d" :value="d">{{ d }}</option>
            </select>
            <button class="btn-generate" @click="handleGenerate" :disabled="loading">
                {{ loading ? '生成中...' : '生成题目' }}
            </button>

<!--            <button @click="debugParse">调试解析</button>-->
        </div>

        <!-- 右侧显示生成的题目 -->
        <div class="panel right-panel">
            <h3>生成的题目列表</h3>
            <div class="question-list">
                <div v-for="(q, index) in parsedQuestions" :key="index" class="question-card">
                    <div class="question-header">
                        <span class="question-number">题目{{ index + 1 }}</span>
                        <span class="question-type">{{ getQuestionType(q.questionType) }}</span>
                        <span class="question-chapter">{{ q.chapter }}</span>
                        <span class="question-difficulty" :class="'level-' + q.difficulty">
                    {{ ['基础', '中等', '较难'][q.difficulty - 1] }}
                </span>
                    </div>
                    <div class="question-title">
                        {{ q.title }}
                    </div>
                    <ul class="options-list" v-if="q.optionList.length > 0">
                        <li v-for="opt in q.optionList" :key="opt.optionLabel">
                            <span class="option-label">{{ opt.optionLabel }}.</span> {{ opt.optionContent }}
                        </li>
                    </ul>
                    <div class="answer">
                        <pre class="code-display">{{ q.answer }}</pre>
                    </div>
                    <div class="analysis">📝 解析：{{ q.analysis }}</div>

                    <div class="save-buttons">
                        <button class="btn-save" @click="saveQuestionToDB(q)" :disabled="saving">
                            {{ saving ? '保存中...' : '保存到题库' }}
                        </button>
                    </div>
                </div>
                <button class="btn-save-all" @click="saveAllToDB" :disabled="batchSaving">
                    {{ batchSaving ? '批量保存中...' : '保存全部到题库' }}
                </button>

            </div>
        </div>



        <!-- 悬浮聊天窗口 -->
        <div class="chat-float" :class="{ open: chatOpen }">
            <div class="chat-header" @click="toggleChat">
                {{ chatOpen ? '收起对话' : 'AI 助教' }}
            </div>
            <div v-if="chatOpen" class="chat-content">
                <div ref="chatContainer" class="chat-window">
                    <div v-for="(msg, i) in chatHistory" :key="i" :class="['chat-bubble', msg.role === 'user' ? 'right' : 'left']">
                        <div class="chat-avatar">
                            {{ msg.role === 'user' ? '🧑' : '🤖' }}
                        </div>
                        <div class="chat-content-wrapper">
                            <div
                                class="chat-content"
                                :class="{ collapsible: msg.content.length > 200 }"
                                v-show="!collapsedMap[i]"
                            >
                                {{ msg.content }}
                            </div>
                            <div class="chat-actions">
                            <span v-if="msg.content.length > 200" class="collapse-btn" @click="toggleCollapse(i)">
                                {{ collapsedMap[i] ? '展开' : '折叠' }}
                            </span>
                                <span class="copy-btn" @click="copyContent(msg.content)">复制</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 输入框 -->
                <div class="chat-input-bar">
                <textarea
                    v-model="chat"
                    placeholder="提问：比如 帮我出两道排序题"
                    class="chat-textarea"
                    rows="1"
                    @keydown.enter.prevent
                />
                    <button class="btn-send" @click="handleChatSend">发送</button>
                </div>
            </div>
        </div>
    </div>
    <el-dialog
        v-model="loading"
        width="300"
        title="正在生成题目"
        :close-on-click-modal="false"
        :show-close="false"
        :align-center="true"
    >
        <div style="text-align: center; padding: 20px 0">
            <el-icon class="is-loading" style="font-size: 32px; margin-bottom: 10px">
                <el-icon-loading />
            </el-icon>
            <div style="font-size: 16px">题目生成中，请稍候...</div>
        </div>
    </el-dialog>

</template>


<script setup>
import { ref, reactive, onUpdated, onMounted, onUnmounted, computed } from 'vue'
import { ElMessage } from 'element-plus'
import { Client } from '@stomp/stompjs'
import SockJS from 'sockjs-client'
import { ElLoading } from 'element-plus'
import { marked } from 'marked'
import useUserStore from '@/store/modules/user'
import { Loading as ElIconLoading } from '@element-plus/icons-vue'

const userStore = useUserStore()
const token = userStore.token
const userId = userStore.id

const chapters = ['无', '第一章 绪论', '第二章 线性表', '第三章 栈和队列', '第四章 串、数组和广义表', '第五章 树和二叉树', '第六章 图', '第七章 查找', '第八章 排序']
const difficulties = ['基础', '中等', '较难']
const questionTypes = ['选择题', '填空题', '简答题', '代码题']

const chapter = ref('')
const difficulty = ref('')
const counts = reactive({})
const result = ref('')
const chat = ref('')
const chatHistory = ref([])
const collapsedMap = reactive({})
const chatContainer = ref(null)
const chaptersByType = reactive({})
const stompClient = ref(null)
const resultTextarea = ref(null) // ✅ 绑定 textarea 的 ref

const renderedResult = ref('')
const parsedQuestions = ref([])

const saving = ref(false)          // 正在单个保存中
const batchSaving = ref(false)     // 正在批量保存中

const chatOpen = ref(false) // 控制悬浮聊天窗口开关

// 添加计算属性过滤掉"无"选项
const filteredChapters = computed(() => {
    return chapters.filter(ch => ch !== '无')
})

function toggleChat() {
    chatOpen.value = !chatOpen.value
}

// 清空按钮
const clearResult = () => {
    result.value = ''
    adjustTextareaHeight()
}

// 自动调节高度
const adjustTextareaHeight = () => {
    if (resultTextarea.value) {
        resultTextarea.value.style.height = 'auto' // 重置高度
        resultTextarea.value.style.height = resultTextarea.value.scrollHeight + 'px' // 适配内容高度
    }
}

// 监听 result 变化，动态调整高度
watch(result, () => {
    adjustTextareaHeight()
})

questionTypes.forEach(type => {
    counts[type] = 0
    chaptersByType[type] = ''
})

onMounted(() => {
    connectWebSocket()
})

onUnmounted(() => {
    disconnectWebSocket()
})

const connectWebSocket = () => {
    const socket = new SockJS('/ws', null, {
        transports: ['websocket', 'xhr-streaming', 'xhr-polling']
    })
    stompClient.value = new Client({
        webSocketFactory: () => socket,
        connectHeaders: {
            login: 'user',
            passcode: 'password',
        },
        debug: function (str) {
            console.log(str)
        },
        reconnectDelay: 5000,
        heartbeatIncoming: 4000,
        heartbeatOutgoing: 4000,
    })

    stompClient.value.onConnect = onConnected
    stompClient.value.onStompError = onError
    stompClient.value.activate()
}

const disconnectWebSocket = () => {
    try {
        if (stompClient.value && stompClient.value.connected) {
            stompClient.value.deactivate()
            console.log('✅ WebSocket 已断开')
        }
    } catch (e) {
        console.warn('WebSocket 断开失败', e)
    }
}


const onConnected = () => {
    stompClient.value.subscribe('/topic/reply', onMessageReceived)
}

const onError = (error) => {
    console.error('WebSocket连接错误:', error)
    ElMessage.error('WebSocket连接失败，请刷新页面重试')
}

onUpdated(() => {
    if (chatContainer.value) {
        chatContainer.value.scrollTop = chatContainer.value.scrollHeight
    }
})

watch(result, (newVal) => {
    renderedResult.value = marked(newVal || '')
})

const loading = ref(false) // ✅ 先定义 loading

const handleGenerate = async () => {
    console.log("🎯 点击了生成按钮");
    parsedQuestions.value = [];  // 先清空
    result.value = '';

    // 创建 payload，包括题型、章节、数量和难度
    const payload = {
        chapter_for_mcq: chaptersByType['选择题'],
        chapter_for_fill: chaptersByType['填空题'],
        chapter_for_saq: chaptersByType['简答题'],
        chapter_for_code: chaptersByType['代码题'],
        difficulty: difficulty.value,
        mcq_count: counts['选择题'] || 0,
        fill_count: counts['填空题'] || 0,
        saq_count: counts['简答题'] || 0,
        code_count: counts['代码题'] || 0
    }

    // 构建更详细的prompt，加入题型
    const prompt = `
        请根据以下要求生成题目：
        - 选择题：${counts['选择题']}道，章节：${chaptersByType['选择题']}，难度：${difficulty.value}
        - 填空题：${counts['填空题']}道，章节：${chaptersByType['填空题']}，难度：${difficulty.value}
        - 简答题：${counts['简答题']}道，章节：${chaptersByType['简答题']}，难度：${difficulty.value}
        - 代码题：${counts['代码题']}道，章节：${chaptersByType['代码题']}，难度：${difficulty.value}
    `;

    loading.value = true;

    try {
        console.log("📦 正在请求：/dev-api/api/rag/generate");
        console.log("📝 请求内容：", { prompt, bizParams: payload });

        const res = await fetch('/dev-api/api/rag/generate', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ prompt, bizParams: payload })
        });

        console.log("📨 请求响应状态：", res.status);

        if (!res.ok) {
            throw new Error('生成题目失败');
        }

        const data = await res.json();
        console.log("📊 返回的数据:", data); // 打印返回的数据，查看格式

        if (data.code === 200) {
            result.value = data.msg || '';
            console.log("✅ 生成题目成功：", data.msg);
            // ✅ 先尝试解析
            parseQuestionsFromMarkdown(data.msg);

            // 如果解析后 parsedQuestions为空，就用整体包一题
            if (parsedQuestions.value.length === 0 && result.value) {
                parsedQuestions.value.push({
                    questionType: 'single_choice', // 默认选择题
                    title: result.value,
                    difficulty: difficulty.value === '基础' ? 1 : difficulty.value === '中等' ? 2 : 3,
                    answer: '',
                    analysis: '',
                    optionList: []
                });
            }
        } else {
            ElMessage.error(data.msg || '生成题目失败');
        }
    } catch (error) {
        ElMessage.error('生成题目失败：' + error.message);
    } finally {
        loading.value = false;
    }
}




const handleChatSend = () => {
    if (!chat.value.trim()) {
        ElMessage.warning('请输入消息内容')
        return
    }

    const userMessage = { role: 'user', content: chat.value }
    chatHistory.value.push(userMessage)

    const assistantMsg = { role: 'assistant', content: '' }
    chatHistory.value.push(assistantMsg)

    chat.value = ''

    const bizParams = {
        difficulty: difficulty.value,
        chapter_for_mcq: chaptersByType['选择题'],
        mcq_count: counts['选择题'] || 0,
        chapter_for_fill: chaptersByType['填空题'],
        fill_count: counts['填空题'] || 0,
        chapter_for_saq: chaptersByType['简答题'],
        saq_count: counts['简答题'] || 0,
        chapter_for_code: chaptersByType['代码题'],
        code_count: counts['代码题'] || 0
    }

    // ✅ 创建干净的 messages，仅保留用户输入的历史
    const validMessages = chatHistory.value
        .filter(msg => msg.role === 'user' && msg.content && msg.content.trim().length > 0)
        .map(msg => ({ role: msg.role, content: msg.content.trim() }))

    if (stompClient.value && stompClient.value.connected) {
        stompClient.value.publish({
            destination: '/app/chat',
            body: JSON.stringify({
                messages: validMessages, // ✅ 只发用户有效历史
                bizParams: bizParams
            })
        })
    } else {
        ElMessage.error('WebSocket未连接，请刷新页面重试')
    }
    console.log("🧾 发送 messages:", validMessages)
    console.log("📦 发送 bizParams:", bizParams)
}


const onMessageReceived = (message) => {
    const last = chatHistory.value[chatHistory.value.length - 1]
    if (last.role === 'assistant') {
        if (message.body === '[DONE]') return
        last.content += message.body
    }
}

const toggleCollapse = (index) => {
    collapsedMap[index] = !collapsedMap[index]
}

const copyContent = (text) => {
    navigator.clipboard.writeText(text)
    ElMessage.success('内容已复制')
}

function parseQuestionsFromMarkdown(markdownText) {
    console.log("开始解析Markdown数据：", markdownText);
    parsedQuestions.value = [];

    if (!markdownText) return;

    const bigBlocks = markdownText
        .split(/-{3,}/g)
        .map(b => b.trim())
        .filter(Boolean);

    let currentType = '';
    let currentChapter = '';

    const typeToChapter = {
        'single_choice': chaptersByType['选择题'],
        'fill_blank': chaptersByType['填空题'],
        'short_answer': chaptersByType['简答题'],
        'code': chaptersByType['代码题']
    };

    for (const block of bigBlocks) {
        const lowerBlock = block.toLowerCase(); // 小写防止误判

        if (lowerBlock.includes('代码题')) {
            currentType = 'code';
            currentChapter = chaptersByType['代码题'];
        } else if (lowerBlock.includes('选择题')) {
            currentType = 'single_choice';
            currentChapter = chaptersByType['选择题'];
        } else if (lowerBlock.includes('填空题')) {
            currentType = 'fill_blank';
            currentChapter = chaptersByType['填空题'];
        } else if (lowerBlock.includes('简答题')) {
            currentType = 'short_answer';
            currentChapter = chaptersByType['简答题'];
        }

        const questions = block.split(/(?=【题干】)/g).map(q => q.trim()).filter(Boolean);

        for (const q of questions) {
            const titleMatch = q.match(/【题干】([\s\S]*?)(?=【选项】|【答案】|【解析】|【参考代码】|$)/);
            const answerMatch = q.match(/【答案】([\s\S]*?)(?=【解析】|$)/);
            const analysisMatch = q.match(/【解析】([\s\S]*?)$/);

            const codeAnswerMatch = q.match(/【参考代码】([\s\S]*?)(?=【解析】|$)/);

            const title = titleMatch ? titleMatch[1].trim() : '';
            const analysis = analysisMatch ? analysisMatch[1].trim() : '';

            let answer = '';
            if (currentType === 'code') {
                answer = codeAnswerMatch ? codeAnswerMatch[1].trim() : '';
            } else {
                answer = answerMatch ? answerMatch[1].trim() : '';
            }

            let optionList = [];
            if (currentType === 'single_choice') {
                const optionSection = q.match(/【选项】([\s\S]*?)【答案】/);
                if (optionSection) {
                    const lines = optionSection[1].split(/\n+/).map(l => l.trim()).filter(Boolean);
                    for (const line of lines) {
                        const optMatch = line.match(/^([A-D])\.\s*(.+)$/);
                        if (optMatch) {
                            optionList.push({
                                optionLabel: optMatch[1],
                                optionContent: optMatch[2],
                                isCorrect: answer.includes(optMatch[1]) ? 1 : 0
                            });
                        }
                    }
                }
            }

            if (title) {
                parsedQuestions.value.push({
                    questionType: currentType,
                    title,
                    optionList,
                    answer,
                    analysis,
                    chapter: currentChapter || '',
                    difficulty: difficulty.value === '基础' ? 1 : difficulty.value === '中等' ? 2 : 3
                });
            }
        }

    }

    console.log("✅ 最终解析出的题目：", parsedQuestions.value);
}




const getQuestionType = (type) => {
    switch(type) {
        case 'single_choice': return '选择题';
        case 'fill_blank': return '填空题';
        case 'short_answer': return '简答题';
        case 'code': return '代码题';
        default: return '选择题';
    }
}

// 保存按钮
async function saveQuestionToDB(q) {
    if (saving.value) return; // 如果正在保存中，直接返回
    
    try {
        saving.value = true;
        console.log('开始保存题目，token:', token);

        const payload = {
            creatorId: userStore.id,
            title: q.title,
            answer: q.answer,
            analysis: q.analysis,
            questionType: q.questionType,
            difficulty: q.difficulty,
            optionList: q.optionList || [],
            knowledgePoints: q.chapter ? [q.chapter] : [],
            imageList: []
        };

        console.log('保存题目的payload:', payload);

        const res = await fetch('/dev-api/api/rag/saveGeneratedQuestion', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + token
            },
            body: JSON.stringify(payload)
        });

        const data = await res.json();
        if (res.ok && data.code === 200) {
            ElMessage.success('保存成功！');
        } else {
            ElMessage.error(data.msg || '保存失败');
        }
    } catch (error) {
        console.error('保存失败:', error);
        ElMessage.error('保存失败：' + error.message);
    } finally {
        saving.value = false;
    }
}

async function saveAllToDB() {
    if (parsedQuestions.value.length === 0) {
        ElMessage.warning('暂无题目可保存');
        return;
    }
    batchSaving.value = true;
    for (const q of parsedQuestions.value) {
        try {
            const payload = {
                creatorId: userStore.id,
                title: q.title,
                answer: q.answer,
                analysis: q.analysis,
                questionType: q.questionType,
                difficulty: q.difficulty,
                optionList: q.optionList || [],
                knowledgePoints: q.chapter ? [q.chapter] : [],
                imageList: []
            };
            const res = await fetch('/dev-api/api/rag/saveGeneratedQuestion', {
                method: 'POST',
                headers: { 
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer ' + token
                },
                body: JSON.stringify(payload)
            });

            const data = await res.json();
            if (!(res.ok && data.code === 200)) {
                ElMessage.error(`保存失败：${data.msg || '未知错误'}`);
            }
        } catch (err) {
            console.error('保存失败：', err);
            ElMessage.error('保存失败，请检查网络或数据格式');
        }
    }
    ElMessage.success('全部题目已保存');
    batchSaving.value = false;
}
function debugParse() {
    const mockMarkdown = "---\n" +
        "代码题\n" +
        "【题干】编写一个函数，实现顺序表的二分查找算法。假设顺序表中的元素是整数，并且已经按升序排列。函数应接收两个参数：指向顺序表的指针和要查找的关键字。如果找到该关键字，则返回其在顺序表中的位置（从0开始计数）；如果没有找到，则返回-1。\n" +
        "【参考代码】\n" +
        "```c\n" +
        "#include <stdio.h>\n" +
        "\n" +
        "#define MAX_SIZE 100\n" +
        "\n" +
        "typedef struct {\n" +
        "    int data[MAX_SIZE];\n" +
        "    int length;\n" +
        "} SeqList;\n" +
        "\n" +
        "int BinarySearch(SeqList *L, int key) {\n" +
        "    int low = 0;\n" +
        "    int high = L->length - 1;\n" +
        "    while (low <= high) {\n" +
        "        int mid = (low + high) / 2;\n" +
        "        if (L->data[mid] == key)\n" +
        "            return mid; // 找到关键字，返回索引\n" +
        "        else if (L->data[mid] > key)\n" +
        "            high = mid - 1; // 关键字在左半部分\n" +
        "        else\n" +
        "            low = mid + 1; // 关键字在右半部分\n" +
        "    }\n" +
        "    return -1; // 没有找到关键字\n" +
        "}\n" +
        "\n" +
        "// 示例主函数\n" +
        "int main() {\n" +
        "    SeqList L;\n" +
        "    L.length = 5;\n" +
        "    L.data[0] = 1;\n" +
        "    L.data[1] = 3;\n" +
        "    L.data[2] = 5;\n" +
        "    L.data[3] = 7;\n" +
        "    L.data[4] = 9;\n" +
        "    \n" +
        "    int key = 7;\n" +
        "    int result = BinarySearch(&L, key);\n" +
        "    if (result != -1)\n" +
        "        printf(\"Element found at index: %d\\n\", result);\n" +
        "    else\n" +
        "        printf(\"Element not found.\\n\");\n" +
        "    \n" +
        "    return 0;\n" +
        "}\n" +
        "```\n" +
        "【解析】此题要求实现二分查找算法。首先定义一个顺序表结构体`SeqList`，然后通过`BinarySearch`函数进行查找。在循环中不断调整`low`与`high`来缩小查找范围，直到找到目标值或搜索区间为空。\n" +
        "\n" +
        "---\n" +
        "\n" +
        "代码题\n" +
        "【题干】给定一个链表头节点指针，编写一个函数`FindNode`用于查找链表中是否存在给定值的节点。如果存在则返回该节点的地址；若不存在则返回`NULL`。假设链表中的节点类型为`ListNode`，每个节点包含一个整数值和一个指向下一个节点的指针。\n" +
        "【参考代码】\n" +
        "```c\n" +
        "#include <stdio.h>\n" +
        "#include <stdlib.h>\n" +
        "\n" +
        "typedef struct ListNode {\n" +
        "    int val;\n" +
        "    struct ListNode *next;\n" +
        "} ListNode;\n" +
        "\n" +
        "ListNode* FindNode(ListNode* head, int target) {\n" +
        "    ListNode* p = head;\n" +
        "    while (p != NULL) {\n" +
        "        if (p->val == target) {\n" +
        "            return p; // 找到目标节点，返回其地址\n" +
        "        }\n" +
        "        p = p->next; // 移动到下一个节点\n" +
        "    }\n" +
        "    return NULL; // 链表中没有目标值，返回NULL\n" +
        "}\n" +
        "\n" +
        "// 辅助函数：创建新节点\n" +
        "ListNode* CreateNode(int value) {\n" +
        "    ListNode* newNode = (ListNode*)malloc(sizeof(ListNode));\n" +
        "    newNode->val = value;\n" +
        "    newNode->next = NULL;\n" +
        "    return newNode;\n" +
        "}\n" +
        "\n" +
        "// 示例主函数\n" +
        "int main() {\n" +
        "    // 创建链表 1 -> 3 -> 5\n" +
        "    ListNode* head = CreateNode(1);\n" +
        "    head->next = CreateNode(3);\n" +
        "    head->next->next = CreateNode(5);\n" +
        "\n" +
        "    int target = 3;\n" +
        "    ListNode* result = FindNode(head, target);\n" +
        "    if (result != NULL)\n" +
        "        printf(\"Node with value %d found at address: %p\\n\", target, (void*)result);\n" +
        "    else\n" +
        "        printf(\"Node with value %d not found.\\n\", target);\n" +
        "\n" +
        "    // 清理内存\n" +
        "    while (head != NULL) {\n" +
        "        ListNode* temp = head;\n" +
        "        head = head->next;\n" +
        "        free(temp);\n" +
        "    }\n" +
        "\n" +
        "    return 0;\n" +
        "}\n" +
        "```\n" +
        "【解析】本题旨在考察对链表的基本操作。通过遍历整个链表寻找具有特定值的节点。这里还提供了一个创建新节点的小辅助函数`CreateNode`以简化示例中的链表构建过程。";


    parseQuestionsFromMarkdown(mockMarkdown);
}

</script>

<style scoped>
.smart-exam-page {
    display: flex;
    gap: 24px;
    padding: 24px;
    box-sizing: border-box;
    flex-wrap: nowrap; /* 保证不换行 */
}

.left-panel {
    width: 400px; /* 左侧部分宽度 */
    flex-shrink: 0; /* 左侧不会被压缩 */
}

.right-panel {
    flex: 1; /* 右侧占满剩余空间 */
    display: flex;
    flex-direction: column;
    gap: 20px; /* 增加间距 */
}

.panel {
    background: #fff;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04);
}

.panel h2 {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 16px;
}

.selector {
    width: 100%;
    padding: 8px;
    margin-bottom: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.input-box {
    flex: 1;
    padding: 6px 10px;
    border: 1px solid #aaa;
    border-radius: 4px;
    font-size: 14px;
}
.btn-generate {
    margin-top: 10px;
    width: 100%;
}

.btn-generate,
.btn-send {
    background-color: #1890ff;
    color: white;
    padding: 8px 18px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 500;
    margin-top: 10px;
}

.btn-generate:hover,
.btn-send:hover {
    background-color: #40a9ff;
}
.chat-window {
    flex: 1;
    overflow-y: auto;
    padding: 16px;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 6px;
    margin-bottom: 12px;
    font-size: 14px;
    max-height: 480px;
}

.chat-bubble {
    display: flex;
    margin-bottom: 12px;
    align-items: flex-start;
}

.chat-bubble.left {
    justify-content: flex-start;
}

.chat-bubble.right {
    justify-content: flex-end;
}

.chat-avatar {
    font-size: 18px;
    margin: 0 8px;
}

.chat-content-wrapper {
    max-width: 75%;
    background-color: #f0f0f0;
    padding: 10px 14px;
    border-radius: 12px;
    position: relative;
    white-space: pre-wrap;
    word-wrap: break-word;
    overflow-wrap: break-word;
    word-break: break-word;
}

.chat-bubble.right .chat-content-wrapper {
    background-color: #daf0ff;
}

.chat-actions {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    font-size: 13px;
    margin-top: 6px;
    color: #555;
    cursor: pointer;
}

.collapse-btn:hover,
.copy-btn:hover {
    text-decoration: underline;
    color: #1677ff;
}

.chat-input-bar {
    display: flex;
    gap: 8px;
    align-items: center;
    margin-top: 4px;
}

.chat-textarea {
    flex: 1;
    padding: 10px;
    resize: none;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

.type-block {
    border: 1px solid #e2e2e2;
    padding: 16px;
    margin-bottom: 16px;
    border-radius: 8px;
    background-color: #fafafa;
}

.type-block legend {
    font-weight: 600;
    font-size: 16px;
    color: #333;
    margin-left: 8px;
}

.row {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    gap: 12px;
}

.row label {
    min-width: 50px;
    font-weight: 500;
    color: #444;
}

.selector,
.input-box {
    flex: 1;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
}

.textarea-result {
    width: 100%;
    min-height: 160px;
    max-height: 1000px;
    overflow: hidden;
    resize: none;
    border: 1px dashed #aaa;
    background-color: #fcfcfc;
    padding: 12px;
    font-family: "Courier New", monospace;
    border-radius: 8px;
    font-size: 14px;
    line-height: 1.6;
    transition: box-shadow 0.4s ease;
}

/* 生成后高亮动画 */
.highlight-flash {
    box-shadow: 0 0 0 4px rgba(24, 144, 255, 0.3);
}

.btn-clear {
    margin-top: 8px;
    background-color: #ff4d4f;
    color: white;
    padding: 6px 14px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 500;
}

.btn-clear:hover {
    background-color: #ff7875;
}

.markdown-body {
    background: #fcfcfc;
    padding: 16px;
    border: 1px dashed #ccc;
    border-radius: 8px;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    line-height: 1.7;
    font-size: 14px;
    color: #333;
}

.markdown-body h1,
.markdown-body h2,
.markdown-body h3 {
    margin-top: 20px;
    font-weight: bold;
    border-bottom: 1px solid #eee;
    padding-bottom: 4px;
}

.markdown-body ul {
    padding-left: 20px;
    margin-top: 10px;
}

.markdown-body strong {
    color: #d14;
}
.generated-questions {
    margin-top: 24px;
}

.question-card {
    background: #fefefe;
    border: 1px solid #eee;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
}

.question-title {
    font-weight: bold;
    margin-bottom: 8px;
}

.btn-save {
    background-color: #52c41a;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 8px;
}

.btn-save:hover {
    background-color: #73d13d;
}
.btn-save-all {
    background-color: #36cfc9;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 6px;
    cursor: pointer;
    margin-bottom: 16px;
    font-weight: 600;
}
.btn-save-all:hover {
    background-color: #5cdbd3;
}
/* 整体容器，只要左边出题，不再flex两列了 */
.smart-exam-page {
    position: relative;
    padding: 24px;
}

/* 悬浮聊天窗口 */
.chat-float {
    position: fixed;
    right: 24px;
    bottom: 24px;
    width: 360px; /* ✅ 展开时更宽 */
    height: 500px; /* ✅ 展开时更高 */
    transition: all 0.3s;
    background: white;
    border: 1px solid #ccc;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.2);
    overflow: hidden;
    z-index: 999;
    display: flex;
    flex-direction: column;
}

/* 头部栏，点击收起/展开 */
.chat-header {
    background-color: #1890ff;
    color: white;
    padding: 12px;
    font-weight: bold;
    cursor: pointer;
    text-align: center;
    font-size: 16px;
}
/* 展开时内容区 */
.chat-content {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 8px;
    overflow: hidden;
}

/* 聊天内容窗口 */
.chat-window {
    flex: 1;
    overflow-y: auto;
    padding: 8px;
    border: 1px solid #f0f0f0;
    background: #fafafa;
    border-radius: 8px;
}

/* 输入区域 */
.chat-input-bar {
    display: flex;
    gap: 8px;
    margin-top: 8px;
}

/* 缩放效果 */
.chat-float:not(.open) {
    width: 100px;
    height: 50px;
    background-color: #1890ff;
    border-radius: 24px;
    justify-content: center;
    align-items: center;
}

/* 小气泡只显示header */
.chat-float:not(.open) .chat-content {
    display: none;
}

.question-list {
    display: flex;
    flex-direction: column;
    gap: 16px;
}

.question-card {
    background: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 16px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}

.question-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
    flex-wrap: wrap;
    gap: 8px;
}

.question-number {
    font-weight: bold;
    font-size: 16px;
    color: #333;
}

.question-type {
    font-size: 14px;
    padding: 2px 8px;
    border-radius: 12px;
    background-color: #e6f7ff;
    color: #1890ff;
}

.question-chapter {
    font-size: 14px;
    color: #666;
    padding: 2px 8px;
    border-radius: 12px;
    background-color: #f5f5f5;
}

.question-difficulty {
    font-size: 13px;
    padding: 2px 6px;
    border-radius: 12px;
    background-color: #eee;
    color: #555;
}

.level-1 {
    background-color: #d9f7be;
    color: #389e0d;
}
.level-2 {
    background-color: #ffe58f;
    color: #d48806;
}
.level-3 {
    background-color: #ffccc7;
    color: #cf1322;
}

.question-title {
    margin-bottom: 10px;
    font-size: 15px;
    color: #555;
}

.options-list {
    margin-bottom: 10px;
    list-style: none;
    padding-left: 0;
}

.options-list li {
    padding: 4px 0;
}

.option-label {
    font-weight: bold;
}

.answer {
    margin: 8px 0;
    color: #52c41a;
    font-weight: 600;
}

.analysis {
    margin-bottom: 8px;
    font-size: 14px;
    color: #888;
}

.save-buttons {
    text-align: right;
}

.btn-save {
    background-color: #52c41a;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 4px;
    cursor: pointer;
}

.btn-save:hover {
    background-color: #73d13d;
}

</style>



