<template>
  <div>
    <el-form ref="formRef" :model="formData" :rules="rules" size="default" label-width="100px">
      <el-form-item label="患者姓名" prop="field101">
        <el-input v-model="formData.field101" type="text" placeholder="请输入患者姓名" clearable
          :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label-width="550px" label="生成建议" prop="field102">
        <el-button type="primary" icon="Search" size="default"> 主要按钮 </el-button>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script setup>
import {
  ElMessage
}
from 'element-plus'
const formRef = ref()
const data = reactive({
  formData: {
    field101: undefined,
    field102: '建议',
  },
  rules: {
    field101: [{
      required: true,
      message: '请输入患者姓名',
      trigger: 'blur'
    }],
  }
})
const {
  formData,
  rules
} = toRefs(data)

function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return
    // TODO 提交表单
  })
}

function resetForm() {
  formRef.value.resetFields()
}

</script>
<style>
</style>
