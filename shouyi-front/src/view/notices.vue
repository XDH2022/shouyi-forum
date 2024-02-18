<template>
  <div>
    <div class="container">
      <el-table
          :data="tableData"
          border
          stripe
          class="table"
          ref="multipleTable"
          @selection-change="handleSelectionChange"
          header-cell-class-name="table-header">
        <el-table-column label="公告标题">
          <template #default="scope">
            {{ scope.row.content.slice(0, 10) }}{{ scope.row.content.length > 10 ? '...' : '' }}
          </template>
        </el-table-column>
        <el-table-column label="完整内容" align="center">
          <template #default="scope">
            <el-button type="success" plain size="small" @click="showMessage(scope.$index,scope.row)">完整内容</el-button>
          </template>
        </el-table-column>
        <el-table-column label="状态" align="center">
          <template #default="scope">
            <el-tag
                :type="scope.row.isDelete === 0 ? 'success' : scope.row.isDelete === 1 ? 'danger' : ''"
            >
              正常
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="发布时间"></el-table-column>
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

  <el-dialog v-model="dialogMessageVisible" title="公告信息">
    <template #default>
      <v-md-preview :text="text"></v-md-preview>
      <span class="dialog-footer">
        <el-button @click="dialogMessageVisible = false">关闭</el-button>
      </span>
    </template>
  </el-dialog>

  <el-dialog title="发布公告" v-model="addVisible" width="75%">
    <el-form label-width="70px">
      <el-form-item label="公告内容">
        <Content @show-message="getText"/>
      </el-form-item>
    </el-form>
    <template #footer>
				<span class="dialog-footer">
					<el-button @click="addVisible = false">取 消</el-button>
					<el-button type="primary" @click="addDoNotice">确 定</el-button>
				</span>
    </template>
  </el-dialog>

  <el-dialog title="修改公告" v-model="editVisible" width="75%">
    <el-form label-width="70px">
      <el-form-item label="公告内容">
        <Content @show-message="getText" :text="editNotice.content"/>
      </el-form-item>
    </el-form>
    <template #footer>
				<span class="dialog-footer">
					<el-button @click="editVisible = false">取 消</el-button>
					<el-button type="primary" @click="saveEdit">确 定</el-button>
				</span>
    </template>
  </el-dialog>
</template>
<script setup lang="ts">
import {ref, reactive, onMounted} from 'vue';
import {ElMessage, ElMessageBox, UploadUserFile} from 'element-plus';
import {getNoticeInfo} from "../api/notice";



const query = reactive({
  pageNum: 1,
  pageSize: 10
});
const tableData = ref<Notice[]>([]);
const pageTotal = ref(0);
// 获取表格数据
const getOriginInfo = async () => {
  const result = await getNoticeInfo(query)
  if (result.code == 0) {
    tableData.value = result.data.items
    pageTotal.value = result.data.total
  } else {
    ElMessage.error(result.message)
  }
}
onMounted(() => {
  getOriginInfo()
})

/**
 * 新增操作
 */
const addVisible = ref<boolean>(false)
const addNotice = reactive<Notice>({})
const openAddOrigin = () => {
  addNotice.content = ''
  addVisible.value = true
}

//显示markdown帖子
const dialogMessageVisible = ref(false)
const text = ref<string>('')
const showMessage = (index: number, row: any) => {
  dialogMessageVisible.value = true
  text.value = row.content
}
const getText = (text: string) => {
  addNotice.content = text
  editNotice.value.content = text
}

const handleRemove = (file: UploadFile) => {
  fileList.value = []
}

const handlePictureCardPreview = (file: UploadFile) => {
  dialogImageUrl.value = file.url!
  dialogVisible.value = true
}
/**
 * 获取学院id
 **/


// 分页导航
const handlePageChange = (val: number) => {
  query.pageNum = val;
  getOriginInfo();
};
// 表格编辑时弹窗和保存
const editNotice = ref<Notice>({})
const editVisible = ref(false);
const handleEdit = (index: number, row: any) => {
  editNotice.value = {...row}
  editVisible.value = true;
};

/**
 * 多选框事件
 */
const selectionQuery = reactive<any>({
      ids: []
    }
)
const handleSelectionChange = (rows?: any) => {
  rows.forEach((row: any) => {
    selectionQuery.ids.push(row.id)
  })
}


</script>

<style scoped>
.pagination {
  display: flex;
  margin-top: 15px;
  justify-content: center;
}
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
</style>
