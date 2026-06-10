<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="试卷名称" prop="paperName">
        <el-input
          v-model="queryParams.paperName"
          placeholder="请输入试卷名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建者ID" prop="creatorId">
        <el-input
          v-model="queryParams.creatorId"
          placeholder="请输入创建者ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="该试卷的总分" prop="totalScore">
        <el-input
          v-model="queryParams.totalScore"
          placeholder="请输入该试卷的总分"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备注或考试说明" prop="remarks">
        <el-input
          v-model="queryParams.remarks"
          placeholder="请输入备注或考试说明"
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
          v-hasPermi="['paper:paperlist:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['paper:paperlist:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['paper:paperlist:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['paper:paperlist:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="paperlistList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="试卷ID" align="center" prop="id" />
      <el-table-column label="试卷名称" align="center" prop="paperName" />
        <el-table-column label="创建者" align="center" prop="creatorName" />
      <el-table-column label="该试卷的总分" align="center" prop="totalScore" />
      <el-table-column label="备注或考试说明" align="center" prop="remarks" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['paper:paperlist:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['paper:paperlist:remove']">删除</el-button>
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

    <!-- 添加或修改试卷表管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="paperlistRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="试卷名称" prop="paperName">
          <el-input v-model="form.paperName" placeholder="请输入试卷名称" />
        </el-form-item>
        <el-form-item label="创建者ID，可关联 user(id)" prop="creatorId">
          <el-input v-model="form.creatorId" placeholder="请输入创建者ID，可关联 user(id)" />
        </el-form-item>
        <el-form-item label="该试卷的总分" prop="totalScore">
          <el-input v-model="form.totalScore" placeholder="请输入该试卷的总分" />
        </el-form-item>
        <el-form-item label="备注或考试说明" prop="remarks">
          <el-input v-model="form.remarks" placeholder="请输入备注或考试说明" />
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

<script setup name="Paperlist">
import { listPaperlist, getPaperlist, delPaperlist, addPaperlist, updatePaperlist } from "@/api/paper/paperlist";

const { proxy } = getCurrentInstance();

const paperlistList = ref([]);
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
    paperName: null,
    creatorId: null,
    totalScore: null,
    remarks: null
  },
  rules: {
    paperName: [
      { required: true, message: "试卷名称不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询试卷表管理列表 */
function getList() {
  loading.value = true;
  listPaperlist(queryParams.value).then(response => {
    paperlistList.value = response.rows;
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
    paperName: null,
    createTime: null,
    creatorId: null,
    totalScore: null,
    remarks: null
  };
  proxy.resetForm("paperlistRef");
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
  title.value = "添加试卷表管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getPaperlist(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改试卷表管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["paperlistRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updatePaperlist(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPaperlist(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除试卷表管理编号为"' + _ids + '"的数据项？').then(function() {
    return delPaperlist(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('paper/paperlist/export', {
    ...queryParams.value
  }, `paperlist_${new Date().getTime()}.xlsx`)
}

getList();
</script>
