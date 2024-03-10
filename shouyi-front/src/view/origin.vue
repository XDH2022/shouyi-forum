<template>
  <div class="origin-choose">
    <el-card class="box-card">
      <el-row :gutter="20">
        <el-col :span="14">
          <el-form
              label-width="100px"
              :model="getOriginReq"
              style="max-width: 460px"
          >
            <el-form-item label="学院名称">
              <college-select @get-college-id="getCollegeId"/>
            </el-form-item>
            <el-form-item label="创建人名称">
              <el-input v-model="getOriginReq.userName"/>
            </el-form-item>
            <el-form-item label="组织名称">
              <el-input v-model="getOriginReq.originName"/>
            </el-form-item>
            <el-form-item>
              <el-button color="#d5ebe1" :icon="Search" round
                         @click="getOriginData">搜索
              </el-button>
              <el-button color="#d5ebe1" :icon="Plus" round
                         @click="openAddOrigin">创建组织
              </el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </el-card>
  </div>
  <div class="origin-main" v-show="Object.keys(originData).length !== 0">
    <el-row :gutter="20">
      <el-col :span="8" v-for="(item,index) in originData" :key="index" class="origin-card">
        <el-card :body-style="{ padding: '0px' }" >
          <img
              :src=item.avatar
              class="image"
          />
          <div style="padding: 14px">
            <h5 style="font-size: 16px">组织名：{{ item.originName }}</h5><br>
            <span style="color: #00000073;">创建人：{{ item.userName }}</span><br>
            <span style="color: #00000073;">所属学院：{{ item.collegeName }}</span><br>
            <span style="color: #00000073;">创建时间：{{ item.createTime }}</span><br>
            <div style="margin-top: 5px">
              <el-button color="#d5ebe1" size="small" :icon="House" round @click="addOriginUser(item)">加入组织</el-button>
              <el-button color="#d5ebe1" size="small" :icon="Monitor" round @click="showOriginUser(item)">组织成员
              </el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <div class="pagination">
      <el-pagination
          background
          layout="total, prev, pager, next"
          :current-page="getOriginReq.pageNum"
          :page-size="getOriginReq.pageSize"
          :total="pageTotal"
          @current-change="handlePageChange"
      ></el-pagination>
    </div>

    <el-drawer v-model="openOriginUserVisible" :show-close="false">
      <template #header="{ close, titleId, titleClass }">
        <h4 :id="titleId" :class="titleClass">组织成员列表</h4>
      </template>
      <div style="overflow: auto" v-show="Object.keys(originUserData).length !== 0">
        <el-card :body-style="{ padding: '0px' }" v-for="(item,index) in originUserData" :key="index">
          <img
              :src=item.userInfo.userAvatar
              class="image"
          />
          <div style="padding: 14px">
            <h5 style="font-size: 16px">用户名：{{ item.userInfo.userName }}</h5><br>
            <span style="color: #00000073;">用户签名：{{ item.userInfo.userSign }}</span><br>
            <span style="color: #00000073;">所属学院：{{ item.userInfo.collegeName }}</span><br>
            <span style="color: #00000073;">加入时间：{{ item.userInfo.joinTime }}</span><br>
          </div>
        </el-card>
      </div>
      <el-empty v-show="Object.keys(originUserData).length === 0" :image-size="200"/>
    </el-drawer>
  </div>
  <el-empty v-show="Object.keys(originData).length === 0" :image-size="200"/>
  <el-dialog title="添加组织" v-if="addVisible" v-model="addVisible" width="30%">
    <el-form label-width="70px">
      <el-form-item label="组织名">
        <el-input v-model="addOrigin.name"></el-input>
      </el-form-item>
      <el-form-item label="学院">
        <college-select @get-college-id="getCollegeId" college-name=""/>
      </el-form-item>
      <el-form-item label="上传头像">
        <el-upload
            :file-list="fileList"
            list-type="picture-card"
            accept="image/jpeg,image/jpg,image/png"
            :http-request="upload"
            :on-success="uploadSuccess"
            :before-upload="checkFile"
            ref="upload"
        >
          <el-icon>
            <Plus/>
          </el-icon>
          <template #file="{ file }">
            <div>
              <img class="el-upload-list__item-thumbnail" :src="file.url"/>
            </div>
            <span class="el-upload-list__item-actions">
          <span
              class="el-upload-list__item-preview"
              @click="handlePictureCardPreview(file)"
          >
            <el-icon><zoom-in/></el-icon>
          </span>
          <span
              v-if="!disabled"
              class="el-upload-list__item-delete"
              @click="handleRemove(file)"
          >
            <el-icon><Delete/></el-icon>
          </span>
        </span>
          </template>
        </el-upload>
        <el-dialog v-model="dialogVisible">
          <img w-full :src="dialogImageUrl" alt="组织照片"/>
        </el-dialog>
      </el-form-item>
    </el-form>
    <template #footer>
				<span class="dialog-footer">
					  <el-button @click="closeAddOrigin">取 消</el-button>
					<el-button type="primary" @click="addOriginInfo">确 定</el-button>
				</span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import {doOriginInfo, getOriginInfo} from "../api/origin";
import {ref, reactive, onMounted} from "vue";
import {Search, House, Monitor, Plus} from '@element-plus/icons-vue'
import {ElMessage, UploadFile, UploadUserFile} from "element-plus";
import CollegeSelect from "../components/collegeSelect.vue";
import {addOriginUserInfo, getOriginUserInfo} from "../api/originUser";
import {uploadOssImg} from "../api/oss";
import {useUserStore} from "../stores/user";

let isMessageShowing = false;

const showMessage = (type :any, message:any) => {
  if (!isMessageShowing) {
    isMessageShowing = true;
    ElMessage({
      message: message,
      type: type,
      onClose: () => {
        isMessageShowing = false;
      },
    });
  }
};

const userStore = useUserStore()
userStore.getUserInfo()

onMounted(() => {
  getOriginData()
})

const getOriginReq = reactive<any>({
  pageNum: 1,
  pageSize: 9,
  collegeId: null,
  userName: null,
  originName: null,
})

const pageTotal = ref(0);
const originData = ref<any>({})

const getOriginData = async () => {
  const result = await getOriginInfo(getOriginReq)
  if (result.code == 0) {
    originData.value = {...result.data.items}
    pageTotal.value = result.data.total
  } else {
    showMessage('error', result.message);
  }
}

const handlePageChange = (val: number) => {
  getOriginReq.pageNum = val;
  getOriginData();
};

const getCollegeId = (id: number) => {
  getOriginReq.collegeId = id
  addOrigin.cid = id
}

const addOriginReq = reactive<any>({
  uid: userStore.currentUser?.userId,
  oid: null
})

const addOriginUser = async (origin: any) => {
  ElMessageBox.confirm('确定要加入组织吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async () => {
    if (userStore.currentUser.userId==null){
      showMessage('warning', '登录后才能加入组织哟！');
      return;
    }
    addOriginReq.oid = origin.id
    const result = await addOriginUserInfo(addOriginReq);
    if (result.code == 0) {
      showMessage('success', '加入组织成功！');
    } else if (result.code == 30000) {
      showMessage('warning', '你已经加入了该组织');
    } else {
      showMessage('error', result.message);
    }
  }).catch(() => {
    showMessage('info', '已取消加入');
  });
}


const openOriginUserVisible = ref<boolean>(false)
const showOriginUser = (origin: any) => {
  openOriginUserVisible.value = true
  getOriginUser(origin.id)
}

const originUserData = ref<any>({})
const getOriginUserReq = reactive<any>({
  pageNum: 1,
  pageSize: 8,
  oid: null,
  userName: null,
  regionName: null
})

const getOriginUser = async (id: number) => {
  getOriginUserReq.oid = id
  const result = await getOriginUserInfo(getOriginUserReq)
  if (result.code == 0) {
    originUserData.value = {...result.data.items}
  } else {
    showMessage('error', result.message);
  }
}

const addVisible = ref<boolean>(false)
const addOrigin = reactive<any>({})
const openAddOrigin = () => {
  addOrigin.name = ''
  addOrigin.avatar = ''
  addOrigin.cid = ''
  addVisible.value = true
}
const closeAddOrigin = () => {
  addOrigin.name = null
  addOrigin.avatar = null
  addOrigin.cid = null
  addVisible.value = false
  fileList.value.splice(0, fileList.value.length) // 添加这一行
  console.log(addOrigin, addVisible.value)  // 添加这一行
}

const checkFile = (file: any) => {
  const isFileTypeValid = ['image/jpeg', 'image/png', 'image/gif'].includes(file.type);
  if (!isFileTypeValid) {
    showMessage('error', '只支持上传 jpg / png / gif 格式的图片');
    return false;
  }
  const isLt1M = file.size / 1024 / 1024 < 1;
  if (!isLt1M) {
    showMessage('error', '图片大小不能超过 1M');
    return false;
  }
  return true;
}


const fileList = ref<UploadUserFile[]>([])
const upload = async (info: any) => {
  const {file} = info
  fileList.value.push(file)
  const formData = new FormData();
  formData.append('file', file);
  const result = await uploadOssImg(formData)
  if (result.code == 0) {
    addOrigin.avatar = result.data
  } else {
    showMessage('error', result.message);
  }
}

const uploadSuccess = () => {
  showMessage('success', '文件上传成功！！');
}

const dialogImageUrl = ref('')
const dialogVisible = ref(false)
const disabled = ref(false)

const handleRemove = (file: UploadFile) => {
  fileList.value = []
}

const handlePictureCardPreview = (file: UploadFile) => {
  dialogImageUrl.value = file.url!
  dialogVisible.value = true
}



const addOriginInfo = async () => {
  if (userStore.currentUser.userId==null){
    showMessage('warning', '登录后才能添加组织哟！');
    return;
  }
  addOrigin.uid = userStore.currentUser?.userId
  const result = await doOriginInfo(addOrigin)
  if (result.code == 0) {
    showMessage('success', '添加组织成功！');
    addVisible.value = false
    await getOriginData()
  }
  else {
    showMessage('error', result.message);
    addVisible.value = false
  }
};
</script>



<style>
.origin-main {
  margin-top: 30px;
}
.origin-card {
  margin-bottom: 10px;

}
.origin-main .pagination {
  display: flex;
  margin-top: 15px;
  justify-content: center;
}

.origin-main .image {
  height: 60px;
  float: right;
  margin-top: 12px;
  margin-right: 12px;
  border-radius: 50%;
}

.origin-choose {
  margin-top: 55px;
}

.el-row {
  margin-bottom: 20px;
}

.el-row:last-child {
  margin-bottom: 0;
}

.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
</style>
