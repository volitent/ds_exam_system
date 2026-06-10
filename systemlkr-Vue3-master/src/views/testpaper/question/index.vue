<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="题干" prop="title">
            <el-input
                    v-model="queryParams.title"
                    placeholder="请输入题干关键词"
                    clearable
                    @keyup.enter="handleQuery"
            />
        </el-form-item>

        <el-form-item label="知识点" prop="kpName">
            <el-input
                    v-model="queryParams.kpName"
                    placeholder="请输入知识点关键词"
                    clearable
                    @keyup.enter="handleQuery"
            />
        </el-form-item>

        <el-form-item label="难度等级" prop="difficulty">
            <el-select v-model="queryParams.difficulty" placeholder="请选择难度">
                <el-option label="基础" value="1" />
                <el-option label="中等" value="2" />
                <el-option label="较难" value="3" />
            </el-select>
        </el-form-item>

      <el-form-item label="创建者ID" prop="creatorId">
        <el-input
          v-model="queryParams.creatorId"
          placeholder="请输入创建者的用户ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['testpaper:question:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['testpaper:question:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['testpaper:question:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['testpaper:question:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="questionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="题目ID" align="center" prop="id" />
      <el-table-column label="题型" align="center" prop="questionType" />
      <el-table-column label="题目标题或题干" align="center" prop="title" />
        <el-table-column label="难度等级" align="center" prop="difficulty">
            <template #default="scope">
                <el-tag :type="getTagType(scope.row.difficulty)">
                    {{ formatDifficulty(scope.row) }}
                </el-tag>
            </template>
        </el-table-column>
      <el-table-column label="正确/参考答案" align="center" prop="answer" />
      <el-table-column label="答案解析或思路讲解" align="center" prop="analysis" />
      <el-table-column label="创建者的用户ID" align="center" prop="creatorId" />
<!--      <el-table-column label="备注信息，或题目来源" align="center" prop="remarks" />-->
        <!-- 知识点列 -->
        <el-table-column label="关联知识点" align="center" prop="knowledgePoints">
            <template #default="scope">
                <el-tag v-for="(kp, index) in scope.row.knowledgePoints" :key="index" style="margin: 2px">
                    {{ kp }}
                </el-tag>
            </template>
        </el-table-column>
        <!-- 图片列 -->
        <el-table-column label="关联图片" align="center" prop="imageList">
            <template #default="scope">
                <div
                        v-for="(img, index) in scope.row.imageList"
                        :key="index"
                        class="image-wrapper"
                >
                    <el-image
                            style="width: 80px; height: 60px; cursor: pointer"
                            :src="img.imagePath"
                            fit="cover"
                            @click="openPreview(img.imagePath)"
                    />
                    <el-tag
                            size="small"
                            type="success"
                            class="img-tag"
                    >
                        {{ img.type == 1 ? '题图' : '答案图' }}
                    </el-tag>
                </div>


            </template>
        </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['testpaper:question:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['testpaper:question:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改问题表对话框 -->
    <el-dialog :title="title" v-model="open" width="1000px" append-to-body>
      <el-form ref="questionRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="题干" prop="title">
          <el-input v-model="form.title" type="textarea" placeholder="请输入内容" />
        </el-form-item>
          <el-form-item label="题型" prop="questionType">
              <el-select v-model="form.questionType" placeholder="请选择题型">
                  <el-option label="选择题" value="single_choice" />
                  <el-option label="填空题" value="fill_blank" />
                  <el-option label="简答题" value="short_answer" />
                  <el-option label="编程题" value="code" />
              </el-select>
          </el-form-item>
          <el-form-item label="难度等级" prop="difficulty">
          <el-input v-model="form.difficulty" placeholder="请输入难度等级，如 1=易，2=中，3=难" />
        </el-form-item>
        <el-form-item label="正确答案" prop="answer">
          <el-input v-model="form.answer" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="答案解析" prop="analysis">
          <el-input v-model="form.analysis" type="textarea" placeholder="请输入内容" />
        </el-form-item>

          <!-- 知识点编辑 -->
          <el-form-item label="知识点" prop="knowledgePoints">
              <el-select
                      v-model="form.knowledgePoints"
                      multiple
                      filterable
                      allow-create
                      placeholder="输入或选择知识点（支持多选）"
              >
                  <el-option
                          v-for="(kp, index) in knowledgeList"
                          :key="index"
                          :label="kp"
                          :value="kp"
                  />
              </el-select>
          </el-form-item>
          <!-- 仅选择题时显示选项编辑 -->
          <el-form-item label="选项列表" v-if="form.questionType === 'single_choice'">
              <div class="option-list-wrapper">
                  <div
                          class="option-item"
                          v-for="(opt, index) in form.optionList"
                          :key="index"
                          style="margin-bottom: 10px"
                  >
                      <el-input
                              v-model="opt.optionLabel"
                              placeholder="标签（如 A）"
                              style="width: 60px; margin-right: 10px"
                      />
                      <el-input
                              v-model="opt.optionContent"
                              placeholder="选项内容"
                              style="width: 300px; margin-right: 10px"
                      />
                      <el-checkbox
                              v-model="opt.isCorrect"
                              :true-label="1"
                              :false-label="0"
                              style="margin-right: 10px"
                      >正确</el-checkbox>
                      <el-button icon="Delete" type="danger" circle @click="form.optionList.splice(index, 1)" />
                  </div>
                  <el-button icon="Plus" @click="addNewOption">添加选项</el-button>
              </div>
          </el-form-item>

          <!-- 图片展示与上传 -->
          <el-form-item label="已上传图片">
              <div style="display: flex; gap: 10px; flex-wrap: wrap">
                  <div v-for="(img, index) in form.imageList" :key="index" class="image-item">
                      <el-image
                              style="width: 50px; height: 50px"
                              :src="getFullImageUrl(img.imagePath)"
                              :preview-src-list="[getFullImageUrl(img.imagePath)]"
                      ></el-image>
                      <div class="image-actions">
                          <el-button
                                  type="danger"
                                  icon="Delete"
                                  circle
                                  @click="form.imageList.splice(index, 1)"
                          />
                      </div>
                  </div>
                  <el-upload
                          :auto-upload="false"
                          multiple
                          accept="image/*"
                          :show-file-list="false"
                          :on-change="handleFileChange"
                  >
                      <el-button type="primary">添加新图片</el-button>
                  </el-upload>
              </div>
          </el-form-item>

          <el-form-item label="备注信息，或题目来源" prop="remarks">
          <el-input v-model="form.remarks" placeholder="请输入备注信息，或题目来源" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
      <!-- ✅ 图片预览弹窗 -->
      <el-dialog
              v-model="previewDialogVisible"
              append-to-body
              center
              :close-on-click-modal="true"
              class="image-preview-dialog"
              :show-close="true"
              :modal="true"
              :destroy-on-close="true"
      >
          <div class="preview-wrapper">
              <img
                      :src="previewImageUrl"
                      alt="预览图片"
                      class="preview-image"
              />
          </div>
      </el-dialog>

  </div>


</template>

<script setup name="Question">
import { listQuestion, getQuestion, delQuestion, addQuestion, updateQuestion, uploadFiles, } from "@/api/testpaper/question";
import {listKnowledge_point} from "@/api/testpaper/knowledge_point.js";
import { uploadToCOS } from "@/utils/cosUpload";
import { ElMessage } from 'element-plus'

// 获取用户ID
import useUserStore from '@/store/modules/user'
const userStore = useUserStore();
const userId = computed(() => userStore.id);

const { proxy } = getCurrentInstance();

const questionList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const knowledgeList = ref([]);

const previewDialogVisible = ref(false)
const previewImageUrl = ref('')


const data = reactive({
  form: {
      id: null,
      questionType: null,
      title: null,
      difficulty: null,
      answer: null,
      analysis: null,
      remarks: null,
      optionList: [
          { optionLabel: 'A', optionContent: '', isCorrect: 0 },
          { optionLabel: 'B', optionContent: '', isCorrect: 0 },
          { optionLabel: 'C', optionContent: '', isCorrect: 0 },
          { optionLabel: 'D', optionContent: '', isCorrect: 0 }
      ],

      knowledgePoints: [],
      imageList: []
  },
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    questionType: null,
    title: null,
    difficulty: null,
    creatorId: null,
    kpName: null
  },
  rules: {
    questionType: [
      { required: true, message: "题型，如 single_choice/multi_choice/fill_blank/short_answer/code 等不能为空", trigger: "change" }
    ],
    title: [
      { required: true, message: "题目标题或题干不能为空", trigger: "blur" }
    ],
    difficulty: [
      { required: true, message: "难度等级，如 1=易，2=中，3=难不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);
// 显示文字
function formatDifficulty(row) {
    const map = {
        1: '基础',
        2: '中等',
        3: '较难'
    };
    return map[row.difficulty] || '未知';
}

// 设置 Tag 颜色
function getTagType(difficulty) {
    const typeMap = {
        1: 'success', // 绿色（基础）
        2: 'warning', // 橙色（中等）
        3: 'danger'   // 红色（较难）
    };
    return typeMap[difficulty] || 'info'; // 默认灰色
}

/** 查询问题表列表 */
function getList() {
  loading.value = true;
  listQuestion(queryParams.value).then(response => {
    questionList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 单独加载知识点的方法
const loadKnowledgeList = () => {
    listKnowledge_point().then(response => {
        knowledgeList.value = response.rows.map(item => item.kpName);
    });
};

// 初始化时加载知识点
onMounted(() => {
    loadKnowledgeList(); // 单独调用
});

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    questionType: null,
    title: null,
    difficulty: null,
    answer: null,
    analysis: null,
    createTime: null,
    updateTime: null,
    creatorId: null,
    remarks: null,
      optionList: [
          { optionLabel: 'A', optionContent: '', isCorrect: 0 },
          { optionLabel: 'B', optionContent: '', isCorrect: 0 },
          { optionLabel: 'C', optionContent: '', isCorrect: 0 },
          { optionLabel: 'D', optionContent: '', isCorrect: 0 }
      ],

      knowledgePoints: [],
      imageList: []
  };
  proxy.resetForm("questionRef");
}

/** 上传图片操作 */
// 当用户选完文件后，这个回调会触发
async function handleFileChange(file, fileList) {
    const newImages = []

    for (const uploadFile of fileList) {
        const raw = uploadFile.raw
        const uniqueName = `${Date.now()}_${raw.name}`
        try {
            const url = await uploadToCOS(raw, uniqueName)
            newImages.push({
                imagePath: url,  // 直接保存 COS 完整地址
                description: ''
            })
        } catch (err) {
            ElMessage.error(`上传失败: ${raw.name}`)
        }
    }

    form.value.imageList = [...form.value.imageList, ...newImages]
    ElMessage.success('上传成功')
}
function addNewOption() {
    const labelChar = String.fromCharCode(65 + form.value.optionList.length) // 'A' + n
    form.value.optionList.push({
        optionLabel: labelChar,
        optionContent: '',
        isCorrect: 0
    })
}

// 添加获取完整 URL 的方法
const getFullImageUrl = (imagePath) => {
    return imagePath  // 已是完整URL
}

// 添加大图弹窗
function openPreview(url) {
    previewImageUrl.value = url
    previewDialogVisible.value = true
}



/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
    proxy.resetForm("queryRef");
    Object.assign(queryParams.value, {
        pageNum: 1,
        pageSize: 10,
        questionType: null,
        title: null,
        difficulty: null,
        creatorId: null,
        kpName: null
    });
    getList();
}


// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加问题表";
}

/** 修改按钮操作 */
// 编辑时数据转换
function handleUpdate(row) {
    reset();
    const _id = row.id || ids.value;
    getQuestion(_id).then(response => {
        const data = response.data;
        // 转换知识点格式
        data.knowledgePoints = data.knowledgePoints?.map(kp =>
            typeof kp === 'object' ? kp.kpName : kp
        ) || [];
        form.value = data;
        open.value = true;
        title.value = "修改问题表";
    });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["questionRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateQuestion(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addQuestion(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除问题表编号为"' + _ids + '"的数据项？').then(function() {
    return delQuestion(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('testpaper/question/export', {
    ...queryParams.value
  }, `question_${new Date().getTime()}.xlsx`)
}

getList();
</script>
<style scoped>
.image-item {
    position: relative;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 4px;
}

.image-actions {
    position: absolute;
    top: 2px;
    right: 2px;
}
.image-wrapper {
    position: relative;
    display: inline-block;
    margin: 4px;
}

.img-tag {
    position: absolute;
    top: 2px;
    right: 2px;
    font-size: 10px;
    padding: 2px 5px;
    z-index: 1;
}
.image-preview-dialog {
    z-index: 5000 !important;
}

.image-preview-dialog .el-dialog {
    width: auto !important;
    max-width: 90vw;
    max-height: 90vh;
    margin: auto !important;
    padding: 0;
    background: transparent;
    box-shadow: none;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
}

.preview-wrapper {
    max-width: 100%;
    max-height: 100%;
    background: white;
    border-radius: 6px;
    padding: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.preview-image {
    max-width: 80vw;
    max-height: 80vh;
    object-fit: contain;
    display: block;
}

</style>