<template>
  <div>
    <div class="container">
      <div class="handle-box">
        <el-input v-model="query.title" placeholder="标题名称" class="handle-input mr10"></el-input>
        <el-select v-model="query.isAuditType" clearable class="m-2" placeholder="过滤规则" size="default"
                   style="margin-right: 50px">
          <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value"
          />
        </el-select>
        <el-button icon="Search" @click="handleSearch" plain style="margin-left: 30px">搜索</el-button>
        <el-button type="danger" icon="Delete" @click="batchDelete" plain>删除</el-button>
      </div>
      <el-table
          :data="tableData"
          border
          stripe
          class="table"
          ref="multipleTable"
          @selection-change="handleSelectionChange"
          header-cell-class-name="table-header">
        <el-table-column type="selection" width="55"/>
        <el-table-column prop="id" label="ID" width="55" align="center"></el-table-column>
        <el-table-column prop="tagName" label="标签名称" width="100" align="center"></el-table-column>
        <el-table-column prop="title" label="问题标题" width="350" align="center"></el-table-column>
        <el-table-column label="问题信息" width="150" align="center">
          <template #default="scope">
            <el-button type="success" plain size="small" @click="showMessage(scope.$index,scope.row)">查看问题</el-button>
          </template>
        </el-table-column>
        <el-table-column label="审批情况" align="center" >
          <template #default="scope">
            <el-icon v-if="scope.row.isAudit === 1" class="check-icon" name="el-icon-check"><Select /></el-icon>
            <el-icon v-else-if="scope.row.isAudit === 2" class="failed-icon" name="el-icon-close" ><CloseBold /></el-icon>
            <el-icon v-else  name="el-icon-question"><SemiSelect /></el-icon>

          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="发布时间" width="100"></el-table-column>
        <el-table-column label="操作" width="277" align="center">
          <template #default="scope">
            <el-button plain type="danger" @click="handleDelete(scope.$index,scope.row)" v-permiss="11">
              删除
            </el-button>
            <el-popconfirm
                confirm-button-text="通过"
                cancel-button-text="拒绝"
                icon-color="#626AEF"
                :icon="InfoFilled"
                @confirm="confirmEvent(scope.row)"
                @cancel="cancelEvent(scope.row)"
                title="审批问题">
              <template #reference>
                <el-button v-permiss="22">审核</el-button>
              </template>
            </el-popconfirm>
            <el-button plain type="success" @click="handleAnswer(scope.$index,scope.row)" v-permiss="11">
              回答
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
            background
            layout="total, prev, pager, next"
            :current-page="query.pageNum"
            :page-size="query.pageSize"
            :total="pageTotal"
            @current-change="handlePageChange"
        ></el-pagination>
      </div>
    </div>
  </div>

  <el-dialog v-model="dialogMessageVisible" title="问题信息">

    <template #default>
      <v-md-preview :text="text"></v-md-preview>
      <span class="dialog-footer">
        <el-button @click="dialogMessageVisible = false">关闭</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import {onMounted, reactive, ref} from "vue";

import {ElMessage, ElMessageBox} from "element-plus";
import {useRouter} from "vue-router";
import Question from "../model/Question";
import {deleteQuestionInfo, getQuestionInfo, updateQuestionInfo} from "../api/question";

const query = reactive<any>({
  pageNum: 1,
  pageSize: 10,
  title: '',
  isAuditType: ''
})
const pageTotal = ref<number>(0)
const tableData = ref<Question[]>([])
const getTableData = async () => {
  const result = await getQuestionInfo(query)
  if (result.code == 0) {
    tableData.value = result.data.items
    pageTotal.value = result.data.total
  } else {
    ElMessage.error(result.message)
  }
}
onMounted(() => {
  getTableData()
})

const selectionQuery = reactive<any>({
      ids: []
    }
)


// 分页导航
const handlePageChange = (val: number) => {
  query.pageNum = val;
  getTableData()
};

//显示markdown帖子
const dialogMessageVisible = ref(false)
const text = ref<string>('')
const showMessage = (index: number, row: any) => {
  dialogMessageVisible.value = true
  text.value = row.content
}

//搜素
const handleSearch = () => {
  getTableData()
}

//删除
const batchDelete = () => {
  if (selectionQuery.ids[0] == null) {
    ElMessage.warning("未选中删除问题目标")
    return;
  }
  ElMessageBox.confirm(
      '确定要批量删除问题吗?',
      'Warning',
  )
      .then(async () => {
        const result = await deleteQuestionInfo(selectionQuery)
        if (result.code == 0) {
          ElMessage.success("批量删除问题成功")
          await getTableData()
          selectionQuery.ids = []
        } else {
          ElMessage.error(result.message)
        }
      })
}
const handleSelectionChange = (rows?: any) => {
  selectionQuery.ids = rows.map((row: any) => row.id);
}
const handleDelete = (index: number, row: any) => {
  ElMessageBox.confirm(
      '确定要删除该问题吗?',
      'Warning',
  ).then(async () => {
    selectionQuery.ids = [row.id]; // 只设置当前选中的问题ID
    const result = await deleteQuestionInfo(selectionQuery);
    if (result.code == 0) {
      ElMessage.success("删除该问题成功");
      await getTableData();
      selectionQuery.ids = []; // 删除完成后清空选中的问题ID
    } else {
      ElMessage.error(result.message);
    }
  });
}
const updateQuery = ref<Question>({})
const confirmEvent = async (row: any) => {
  if (row.isAudit == 1) {
    ElMessage.warning("审核状态当前已通过，无需重新审核")
    return;
  }
  updateQuery.value = {...row}
  updateQuery.value.isAudit = 1
  const result = await updateQuestionInfo(updateQuery.value)
  if (result.code == 0) {
    ElMessage.success("审核状态更改成功")
    await getTableData()
  } else {
    ElMessage.error(result.message)
  }
}

const cancelEvent = async (row: any) => {
  if (row.isAudit == 2) {
    ElMessage.warning("审核状态当前已拒绝，无需重新审核")
    return;
  }
  updateQuery.value = {...row}
  updateQuery.value.isAudit = 2
  const result = await updateQuestionInfo(updateQuery.value)
  if (result.code == 0) {
    ElMessage.success("审核状态更改成功")
    await getTableData()
  } else {
    ElMessage.error(result.message)
  }
}
const router = useRouter();
const handleAnswer = (index: number, row: any) => {
  router.push({path: `/answer/${row?.id}`})
}

const options = [
  {
    value: 0,
    label: '未审批',
  },
  {
    value: 1,
    label: '审批通过',
  },
  {
    value: 2,
    label: '审批拒绝',
  }
]
</script>

<style scoped>
.handle-box {
  margin-bottom: 30px;
}

.handle-select {
  width: 120px;
}

.handle-input {
  width: 300px;
}

.table {
  width: 100%;
  font-size: 14px;
}

.mr10 {
  margin-right: 10px;
}

.table-td-thumb {
  display: block;
  margin: auto;
  width: 40px;
  height: 40px;
}
.check-icon {
  color: green;
}

.failed-icon {
  color: red;
}

</style>
