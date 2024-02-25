<template>
  <div style="margin-top: 45px">
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div class="clearfix">
              <span>基础信息</span>
            </div>
          </template>
          <div class="info">
            <div class="info-image" @click="showDialog">
              <el-avatar :size="100" :src="userStore.currentUser.userAvatar"/>
              <span class="info-edit">
								<i class="el-icon-lx-camerafill"></i>
							</span>
            </div>
            <div class="info-name">
              {{ userStore.currentUser.userName }}
              <el-tag class="ml-2" type="success" v-if="userStore.currentUser.status===1">在校</el-tag>
              <el-tag class="ml-2" type="warning" v-else>毕业</el-tag>
            </div>
            <div class="info-desc">所属学院：{{ userStore.currentUser.collegeName }}</div>
            <div class="info-desc">签名：{{ userStore.currentUser.userSign }}</div>
            <div class="info-desc">创建时间：{{ userStore.currentUser.joinTime }}</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div class="clearfix">
              <span>修改密码</span>
            </div>
          </template>
          <el-form label-width="90px">
            <el-form-item label="用户名："> {{ userStore.currentUser.userName }}</el-form-item>
            <el-form-item label="旧密码：">
              <el-input type="password" v-model="form.oldPassword"></el-input>
            </el-form-item>
            <el-form-item label="新密码：">
              <el-input type="password" v-model="form.newPassword"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="onSubmit(userStore.currentUser.userId)">修改</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
      <el-row :gutter="30">
        <el-col :span="60" :style="{marginTop: '15px' ,marginLeft:'10px'}">
          <el-card shadow="hover">
            <template #header>
              <div class="clearfix">
                <span>已加入的组织</span>
              </div>
            </template>
            <div class="origin-main">
              <div v-show="originData && Object.keys(originData).length !== 0">
                <!-- 当originData不为空时，显示组织信息 -->
                <el-row :gutter="20">
                  <el-col :span="12" v-for="(item,index) in originData" :key="index"  class="origin-card" >
                    <el-card :body-style="{ padding: '0px' }">
                      <img :src=item.avatar class="image"/>
                      <div style="padding: 12px; margin-top: 20px;">
                        <h5 style="font-size: 16px">组织名：{{ item.originName }}</h5><br>
                        <span style="color: #00000073;">创建人：{{ item.userName }}</span><br>
                        <span style="color: #00000073;">所属学院：{{ item.collegeName }}</span><br>
                        <span style="color: #00000073;">创建时间：{{ item.createTime }}</span><br>
                        <div style="margin-top: 5px">
                          <el-button color="#d5ebe1" size="small" :icon="RemoveFilled" round @click="quitOriginUser(item)">退出组织</el-button>
                          <el-button color="#d5ebe1" size="small" :icon="Monitor" round @click="showOriginUser(item)">组织成员</el-button>
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
              </div>

             <el-drawer v-model="openOriginUserVisible" :show-close="false">
                <template #header="{ close, titleId, titleClass }">
                  <h4 :id="titleId" :class="titleClass">组织成员列表</h4>
                </template>
                <div style="overflow: auto" v-show="Object.keys(originUserData).length !== 0">
                  <el-card :body-style="{ padding: '0px' }" v-for="(item, index) in originUserData">
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
              </el-drawer>
              <div v-show="!originData || Object.keys(originData).length === 0" style="height: 644px; width: 698px; display: flex; align-items: center; justify-content: center;">
                <!-- 当originData为空时，显示一个占位元素 -->
                <span>暂无已加入的组织</span>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
      <el-col :span="12" :style="{marginTop: '-70px', marginBottom: '20px' ,marginLeft: 'auto'}">
        <el-card shadow="hover">
          <template #header>
            <div class="clearfix">
              <span>用户信息编辑</span>
            </div>
          </template>
          <el-form label-width="90px">
            <el-form-item label="邮箱：">
              <el-input type="text" v-model="userStore.currentUser.email" disabled></el-input>
            </el-form-item>
            <el-form-item label="用户名：">
              <el-input type="text" :placeholder="userStore.currentUser.userName"
                        v-model="updateUserReq.user.username"></el-input>
            </el-form-item>
            <el-form-item label="所属学院">
              <college-select @get-college-id="getCollegeId" :collegeName="userStore.currentUser.collegeName" v-model="updateUserReq.user.collegeId"/>
            </el-form-item>
            <el-form-item label="所属地区">
              <region-select style="width: 500px" @get-region-id="getRegionId"
                             :regionName="userStore.currentUser.regionName"/>
            </el-form-item>
            <el-form-item label="签名">
              <el-input type="text" :placeholder="userStore.currentUser.userSign"
                        v-model="updateUserReq.user.sign"></el-input>
            </el-form-item>
            <el-form-item label="状态">
              <el-select style="width: 500px"
                         v-model="updateUserReq.user.status"
                         clearable
                         class="m-2"
                         :placeholder="userStore.currentUser.status===1?'在校':'毕业'" size="default">
                <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="性别">
              <el-select style="width: 500px"
                         v-model="updateUserReq.userInfo.sex"
                         clearable
                         class="m-2"
                         :placeholder="userStore?.currentUser.userInfo.sexType" size="default">
                <el-option
                    v-for="item in sexOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="年龄">
              <el-input type="text" :placeholder="userStore.currentUser.userInfo.age"
                        v-model="updateUserReq.userInfo.age"></el-input>
            </el-form-item>
            <el-form-item label="生日">
              <el-date-picker
                  v-model="updateUserReq.userInfo.birthday"
                  type="datetime"
                  :placeholder="userStore?.currentUser.userInfo.birthday"
              />
            </el-form-item>
            <el-form-item label="电话">
              <el-input type="text" :placeholder="userStore.currentUser.userInfo.mobile"
                        v-model="updateUserReq.userInfo.mobile"></el-input>
            </el-form-item>
            <el-form-item label="qq">
              <el-input type="text" :placeholder="userStore.currentUser.userInfo.qq"
                        v-model="updateUserReq.userInfo.qq"></el-input>
            </el-form-item>
            <el-form-item label="微信号">
              <el-input type="text" :placeholder="userStore.currentUser.userInfo.wechat"
                        v-model="updateUserReq.userInfo.wechat"></el-input>
            </el-form-item>
            <el-form-item label="微博号">
              <el-input type="text" :placeholder="userStore.currentUser.userInfo.microblog"
                        v-model="updateUserReq.userInfo.microblog"></el-input>
            </el-form-item>
            <el-form-item label="地址">
              <el-input type="text" :placeholder="userStore.currentUser.userInfo.address"
                        v-model="updateUserReq.userInfo.address"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary"
                         @click="updateOnSubmit(userStore.currentUser.userId,userStore.currentUser.email)">修改
              </el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
    <el-dialog title="裁剪图片" v-model="dialogVisible" width="600px">
      <vue-cropper
          ref="cropper"
          :src="updateUserReq.user.avatar"
          :ready="cropImage"
          :zoom="cropImage"
          :cropmove="cropImage"
          style="width: 100%; height: 400px"
      ></vue-cropper>

      <template #footer>
				<span class="dialog-footer">
					<el-button class="crop-demo-btn" type="primary"
          >选择图片
						<input class="crop-input" type="file" name="image" accept="image/*" @change="setImage"/>
					</el-button>
					<el-button type="primary"
                     @click="saveAvatar(userStore.currentUser.userId,userStore.currentUser.email)">上传并保存</el-button>
				</span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts" name="user">
import {onMounted, reactive, ref, nextTick, h} from 'vue';
import VueCropper from 'vue-cropperjs';
import 'cropperjs/dist/cropper.css';
import {updateUser, updateUserPassword} from "../api/user";
import {ElMessage, UploadUserFile} from "element-plus";
import {useRouter} from "vue-router";
import {uploadOssImg} from "../api/oss";
import {useUserStore} from "../stores/user";
import {House, Monitor, Plus, RemoveFilled, Search} from "@element-plus/icons-vue";
import CollegeSelect from "../components/collegeSelect.vue";
import {getOriginInfo,getOriginByUser} from "../api/origin";
import {addOriginUserInfo, getOriginUserInfo, quitOrigin} from "../api/originUser";


const userStore = useUserStore()
userStore.getUserInfo()

const form = reactive<any>({
  id: null,
  oldPassword: null,
  newPassword: null
});
const updateUserReq = reactive<any>({
  user: {
    id: null,
    rid: null,
    collegeId: null,
    username: null,
    avatar: null,
    sign: null,
    status: null
  },
  userInfo: {
    id: null,
    sex: null,
    age: null,
    birthday: null,
    mobile: null,
    qq: null,
    wechat: null,
    microblog: null,
    address: null
  }
})
onMounted(() => {
  getOriginData()
})
const getOriginReq = reactive<any>({
  pageNum: 1,
  pageSize: 6,
  uid: userStore.currentUser.userId,
  collegeId: null,
  userName: null,
  originName: null,
})
const pageTotal = ref(0);
const originData = ref<any>({})

const getOriginData = async () => {
  const result = await getOriginByUser(getOriginReq)
  if (result.code == 0) {
    originData.value = {...result.data.items}
    pageTotal.value = result.data.total
  } else {
    ElMessage.error(result.message)
  }
}


// 分页导航
const handlePageChange = (val: number) => {
  getOriginReq.pageNum = val;
  getOriginData();
};

const getCollegeId = (id: number) => {
  getOriginReq.collegeId = id
}


const quitOriginReq = reactive<any>({
  uid: userStore.currentUser?.userId,
  oid: null
})

const quitOriginUser = async (origin: any) => {
  quitOriginReq.oid = origin.id
  const result = await quitOrigin(quitOriginReq);
  if (result.code == 0) {
    ElMessage.success('退出组织成功！');
    await getOriginData(); // 刷新已加入组织列表
  }  else {
    ElMessage.error(result.message);
  }
}


const openOriginUserVisible = ref<boolean>(false)
const showOriginUser = (origin: any) => {
  openOriginUserVisible.value = true
  getOriginUser(origin.id)
}
const originUserData = ref<any>({})
const getOriginUserReq = reactive<any>({
  pageNum: 1,
  pageSize: 100,
  oid: null,
  userName: null,
  regionName: null
})
const getOriginUser = async (id: number) => {
  getOriginUserReq.oid = id
  const result = await getOriginUserInfo(getOriginUserReq)
  if (result.code == 0) {
    originUserData.value = {...result.data.items}
  }
}

const router = useRouter();
const onSubmit = async (id: number) => {
  form.id = id
  const result = await updateUserPassword(form)
  if (result.code == 0) {
    ElMessage.success('更新密码成功')
    localStorage.removeItem('acp_token')
    await router.push('/')
    setTimeout(()=>{
      location.reload()
    },50)
  } else {
    ElMessage.error(result.message)
  }
};

const updateOnSubmit = async (id: number, email: string) => {
  updateUserReq.user.id = id
  updateUserReq.userInfo.id = id
  updateUserReq.user.email = email
  updateUserReq.userInfo.email = email
  const result = await updateUser(updateUserReq)
  if (result.code == 0) {
    ElMessage.success('更新用户信息成功')
    location.reload()
  } else {
    ElMessage.error(result.message)
  }
}

const getRegionId = (id: bigint) => {
  updateUserReq.user.rid = id
}

const dialogVisible = ref(false);

const showDialog = () => {
  updateUserReq.user.avatar = userStore.currentUser.userAvatar
  dialogVisible.value = true;
};
const setImage = async (info: any) => {
  const file = info.target.files[0]
  const formData = new FormData();
  formData.append('file', file);
  const result = await uploadOssImg(formData)

  if (result.code == 0) {
    updateUserReq.user.avatar = result.data;
    console.log(result.data)
      // 显示一个成功的消息
      ElMessage.success("上传头像成功");

    }
   else {
    ElMessage.error(result.message)
  }
}
// 用 import 导入 blob-util 模块
import { dataURLToBlob } from 'blob-util';

// 定义一个函数，将 dataURL 转换为 Blob 对象
function dataURLtoBlob(dataUrl) {
  // 将 dataUrl 分割成两部分
  let arr = dataUrl.split(',');
  // 获取媒体类型
  let mime = arr[0].match(/:(.*?);/)[1];
  // 获取 base64 编码的数据
  let bstr = atob(arr[1]);
  // 创建一个 Uint8Array 对象
  let n = bstr.length;
  let u8arr = new Uint8Array(n);
  // 将 base64 编码的数据解码成 Uint8Array 对象
  while (n--) {
    u8arr[n] = bstr.charCodeAt(n);
  }
  // 将 Uint8Array 对象转换成 Blob 对象
  let blob = new Blob([u8arr], {type: mime});
  // 返回 Blob 对象
  return blob;
}
const saveAvatar = async (id: number, email: string) => {
  if (cropImg.value) {
    let blob = dataURLtoBlob(cropImg.value);
    const formData = new FormData();
    // 这里假定cropImg.value是一个base64编码的图像数据，我们需要将其转换成Blob对象
    formData.append('file', blob);
    try {
      const result = await uploadOssImg(formData); // 替换为您上传裁剪图像的API调用
      if (result.code == 0) {
        ElMessage.success("头像更新成功");
        // 在用户存储或必要的地方更新用户的头像
        updateUserReq.user.avatar = result.data
        await updateOnSubmit(id,result.data)
      } else {
        ElMessage.error(result.message);
      }
    } catch (error) {
      ElMessage.error("上传失败");
      console.error(error);
    }
  } else {
    ElMessage.warning("请先裁剪图片");
  }
};
const cropImg = ref('');
const cropper: any = ref();
const cropImage = () => {
  cropImg.value = cropper.value.getCroppedCanvas().toDataURL();
};

const options = [
  {
    value: 1,
    label: '在校',
  },
  {
    value: 2,
    label: '毕业',
  }
]

const sexOptions = [
  {
    value: 1,
    label: '女',
  },
  {
    value: 2,
    label: '男',
  }
]


</script>

<style scoped>
.origin-main {

  margin-top: 20px;
  height: 644px;
  width: 698px;
}
.origin-card {
  margin-right:auto;
  margin-bottom: 10px;
}
.pagination{
  margin-top: 80px;
  display: flex;
  justify-content: center;
}


.origin-main .image {
  height: 60px;
  float: right;
  margin-top: 12px;
  margin-right: 12px;
  border-radius: 50%;
}
.info {
  text-align: center;
  padding: 35px 0;
}

.info-image {
  position: relative;
  margin: auto;
  width: 100px;
  height: 100px;
  background: #f8f8f8;
  border: 1px solid #eee;
  border-radius: 50px;
  overflow: hidden;
}

.info-edit {
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.info-edit i {
  color: #eee;
  font-size: 25px;
}

.info-image:hover .info-edit {
  opacity: 1;
}

.info-name {
  margin: 15px 0 10px;
  font-size: 24px;
  font-weight: 500;
  color: #262626;
}

.crop-demo-btn {
  position: relative;
}

.crop-input {
  position: absolute;
  width: 100px;
  height: 40px;
  left: 0;
  top: 0;
  opacity: 0;
  cursor: pointer;
}
</style>
