<template>
  <div style="margin-top: 45px">
    <div class="container">
      <div class="center">
        <h1 class="title">
          <el-icon class="icon">
            <Mug/>
          </el-icon>
          动态内容
        </h1>
      </div>
      <Content @show-message="showMessage" style="height: 300px"/>
    </div>
      <div class="discuss-info">
        <el-form
            label-width="100px"
            :model="addDiscuss"
            style="max-width: 460px">
          <!--          class="el-form"-->

          <el-form-item label="标签名">
            <tag @get-tag-id="getTagId"/>
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
import {reactive, ref, watch} from "vue";
import {useRouter} from "vue-router";
import {ElMessage} from "element-plus";
import {addDynamicInfo} from "../api/dynamic";
import {useUserStore} from "../stores/user";
import {Apple, KnifeFork, Mug} from "@element-plus/icons-vue";

const userStore = useUserStore()
userStore.getUserInfo()

const router = useRouter()
const active = ref<number>(1)
const message = ref<string>('')

const showMessage = (text: string) => {
  addDiscuss.content = text
}

watch(message, (val) => {
  if (val != '') {
    active.value = 2
  } else {
    active.value = 1
  }
})

const addDiscuss = reactive<any>({})
const getTagId = (id: bigint) => {
  addDiscuss.tid = id
}
/**
 * 发布帖子
 */
const saveEdit = async () => {
  addDiscuss.uid = userStore.currentUser?.userId
  if (addDiscuss.uid == null) {
    ElMessage.warning("登录后才能发布动态")
    return
  }
  if (addDiscuss.content == null ||
      addDiscuss.tid == null) {
    ElMessage.warning("发布的动态中有信息错误！")
    return
  }
  const result = await addDynamicInfo(addDiscuss);
  if (result.code == 0) {
    ElMessage.success("发布动态成功")
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
  margin-right: 600px; /* 调整偏移量 */
}

.el-form {
  position: relative;
  top: 70px;
  left: 300px;
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
