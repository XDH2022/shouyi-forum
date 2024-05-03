<template>
  <div style="margin-top: 45px">
    <div class="container">
      <div class="center">
        <h1 class="title">
          <el-icon class="icon">
            <Apple/>
          </el-icon>
          帖子内容
        </h1>
      </div>
      <Content @show-message="showMessage" style="height: 500px"/>
    </div>
    <div class="discuss-info">
      <el-form
          label-width="100px"
          :model="addDiscuss"
          style="max-width: 460px"
          class="el-form"
      >
        <el-form-item label="标签名">
          <tag @get-tag-id="getTagId"/>
        </el-form-item>
        <el-form-item label="标题名" placeholder="标题名">
          <el-input v-model="addDiscuss.title"/>
        </el-form-item>
        <el-form-item label="文章封面">
          <Upload2ALY :file="fileList" @get-aliyun-url="getALiYunUrl"/>
        </el-form-item>
        <el-form-item>
				<span>
					<el-button type="primary" @click="saveEdit">发 布</el-button>
				</span>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup lang="ts">
import {onMounted, ref, watch, reactive} from "vue";
import {useRouter} from "vue-router";
import type {UploadFile, UploadUserFile} from 'element-plus'
import Content from "../components/content.vue";
import {ElMessage} from "element-plus";
import {addDiscussUpInfo, addDiscussInfo} from "../api/discuss";
import Tag from "../components/tag.vue";
import {useUserStore} from "../stores/user";
import Upload2ALY from "../components/upload2ALY.vue";
import {Apple, KnifeFork} from "@element-plus/icons-vue";

const userStore = useUserStore()
userStore.getUserInfo()

const router = useRouter()
const active = ref<number>(1)
const message = ref<string>('')

const showMessage = (text: string) => {
  addDiscuss.message = text
}

watch(message, (val) => {
  if (val != '') {
    active.value = 2
  } else {
    active.value = 1
  }
})

const addDiscuss = reactive<any>({
  uid: null
})
const getTagId = (id: bigint) => {
  addDiscuss.tid = id
}
const fileList = ref<UploadUserFile []>([])
const getALiYunUrl = (url: string) => {
  addDiscuss.cover = url
  active.value = 3
}

/**
 * 发布帖子
 */
const saveEdit = async () => {
  addDiscuss.uid = userStore.currentUser?.userId
  if (addDiscuss.uid == null) {
    ElMessage.warning('登录后才能发布帖子')
    return
  }
  if (addDiscuss.title == null ||
      addDiscuss.cover == null ||
      addDiscuss.message == null ||
      addDiscuss.tid < 0) {
    ElMessage.warning("帖子有信息错误")
    return
  }
  const result = await addDiscussInfo(addDiscuss);
  if (result.code == 0) {
    ElMessage.success("发布帖子成功，待管理员审核后查看")
    await router.push('/posts')
  } else {
    ElMessage.error(result.message)
  }
}
</script>

<style scoped>
.discuss-info {
  display: flex;
  justify-content: center;
  margin-top: 30px;
  background: white;
  border-radius: 4px;
  height: 100%;
}

.center {
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 45px;
}

.title {
  display: flex;
  align-items: center;
  font-size: 24px;
  color: #60d4ff
}

.icon {
  font-size: 32px;
}
</style>
