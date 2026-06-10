<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="题目ID" prop="questionId">
        <el-input
          v-model="queryParams.questionId"
          placeholder="请输入所属题目的ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="选项标签" prop="optionLabel">
        <el-input
          v-model="queryParams.optionLabel"
          placeholder="请输入选项标签 A/B/C/D"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否正确" prop="isCorrect">
        <el-input
          v-model="queryParams.isCorrect"
          placeholder="请输入是否为正确选项，1=正确，0=错误"
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
          v-hasPermi="['testpaper:option:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['testpaper:option:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['testpaper:option:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['testpaper:option:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="optionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="选项ID" align="center" prop="id" />
      <el-table-column label="所属题目的ID" align="center" prop="questionId" />
      <el-table-column label="选项标签，如 A/B/C/D" align="center" prop="optionLabel" />
      <el-table-column label="选项内容" align="center" prop="optionContent" />
      <el-table-column label="是否为正确选项，1=正确，0=错误" align="center" prop="isCorrect" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['testpaper:option:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['testpaper:option:remove']">删除</el-button>
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

    <!-- 添加或修改选择题选项对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="optionRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属题目的ID" prop="questionId">
          <el-input v-model="form.questionId" placeholder="请输入所属题目的ID" />
        </el-form-item>
        <el-form-item label="选项标签，如 A/B/C/D" prop="optionLabel">
          <el-input v-model="form.optionLabel" placeholder="请输入选项标签，如 A/B/C/D" />
        </el-form-item>
        <el-form-item label="选项内容" prop="optionContent">
          <el-input v-model="form.optionContent" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="是否为正确选项，1=正确，0=错误" prop="isCorrect">
          <el-input v-model="form.isCorrect" placeholder="请输入是否为正确选项，1=正确，0=错误" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Option">
import { listOption, getOption, delOption, addOption, updateOption } from "@/api/testpaper/option";

const { proxy } = getCurrentInstance();

const optionList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    questionId: null,
    optionLabel: null,
    optionContent: null,
    isCorrect: null
  },
  rules: {
    questionId: [
      { required: true, message: "所属题目的ID不能为空", trigger: "blur" }
    ],
    optionLabel: [
      { required: true, message: "选项标签，如 A/B/C/D不能为空", trigger: "blur" }
    ],
    optionContent: [
      { required: true, message: "选项内容不能为空", trigger: "blur" }
    ],
    isCorrect: [
      { required: true, message: "是否为正确选项，1=正确，0=错误不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询选择题选项列表 */
function getList() {
  loading.value = true;
  listOption(queryParams.value).then(response => {
    optionList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    questionId: null,
    optionLabel: null,
    optionContent: null,
    isCorrect: null
  };
  proxy.resetForm("optionRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
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
  title.value = "添加选择题选项";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getOption(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改选择题选项";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["optionRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateOption(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addOption(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除选择题选项编号为"' + _ids + '"的数据项？').then(function() {
    return delOption(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('testpaper/option/export', {
    ...queryParams.value
  }, `option_${new Date().getTime()}.xlsx`)
}

getList();
</script>
