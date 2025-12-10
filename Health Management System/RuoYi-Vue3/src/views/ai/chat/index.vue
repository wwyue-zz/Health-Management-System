<template>
    <div class="app-container">
        <el-card class="box-card">
            <template #header>
                <div class="card-header">
                    <span>AI Personalized Recommendation Generation</span>
                </div>
            </template>
            <el-form :model="form" :rules="rules" ref="formRef" label-width="120px">
                <el-form-item label="Patient Name" prop="patientName">
                    <el-input v-model="form.patientName" placeholder="Please enter patient name" />
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm" :loading="loading">Submit</el-button>
                    <el-button @click="resetForm">Reset</el-button>
                </el-form-item>
            </el-form>
            <div v-if="loading" class="loading-container">
                <el-alert title="Generating recommendations, please wait..." type="info" :closable="false" show-icon>
                    <template #default>
                        <div class="loading-tips">
                            <p>AI is analyzing patient information and generating personalized recommendations</p>
                            <p>This may take some time, please be patient</p>
                        </div>
                    </template>
                </el-alert>
            </div>
            <div v-if="iframeHtml" class="ai-iframe-result">
                <iframe :srcdoc="iframeHtml" style="width:100%;height:800px;border:none;"></iframe>
            </div>
        </el-card>
    </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { ElMessage } from 'element-plus'
import { sendPatientInfo } from '@/api/ai/chat'

const formRef = ref()
const loading = ref(false)
const iframeHtml = ref('')

const form = reactive({
    patientName: ''
})

const rules = {
    patientName: [
        { required: true, message: 'Please enter patient name', trigger: 'blur' },
        { min: 2, max: 20, message: 'Length must be between 2 and 20 characters', trigger: 'blur' }
    ]
}

const submitForm = async () => {
    if (!formRef.value) return
    await formRef.value.validate(async (valid) => {
        if (valid) {
            loading.value = true
            iframeHtml.value = ''
            try {
                let html = ''
                const response = await sendPatientInfo(form.patientName)
                if (response && typeof response.data === 'string') {
                    html = response.data
                } else if (response && typeof response.text === 'function') {
                    html = await response.text()
                } else if (typeof response === 'string') {
                    html = response
                } else {
                    html = ''
                }
                // Remove leading ```html
                html = html.replace(/^```html\s*/i, '')
                iframeHtml.value = html
                ElMessage.success('Successfully retrieved recommendations')
            } catch (error) {
                ElMessage.error('Failed to retrieve recommendations: ' + (error.message || error))
            } finally {
                loading.value = false
            }
        }
    })
}

const resetForm = () => {
    if (!formRef.value) return
    formRef.value.resetFields()
    iframeHtml.value = ''
}
</script>

<style scoped>
.app-container {
    padding: 20px;
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.loading-container {
    margin: 20px 0;
}

.loading-tips {
    margin-top: 10px;
    color: #666;
    font-size: 14px;
}

.loading-tips p {
    margin: 5px 0;
}

.ai-iframe-result {
    margin-top: 20px;
}

/***** You can paste the styles returned by the backend here *****/
.ai-html-result h1 {
    color: #2c3e50;
}

.ai-html-result .section {
    border: 1px solid #ddd;
    padding: 20px;
    margin: 20px 0;
    border-radius: 8px;
}

.ai-html-result .assessment {
    background-color: #f8f9fa;
}

.ai-html-result .recommendation {
    background-color: #eef;
}

.ai-html-result table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

.ai-html-result th,
.ai-html-result td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.ai-html-result th {
    background-color: #f0f0f0;
}

.ai-html-result .highlight {
    color: #e74c3c;
    font-weight: bold;
}
</style>
