<template>
    <div class="app-container">
        <el-card class="box-card">
            <template #header>
                <div class="card-header">
                    <span>Patient Lifestyle Radar Chart</span>
                    <el-select v-model="selectedPatient" placeholder="Please select patient" @change="handlePatientChange">
                        <el-option v-for="item in patientList" :key="item.patientId" :label="item.name || ''"
                            :value="item.name || ''" />
                    </el-select>
                </div>
            </template>
            <div ref="radarChart" style="width: 100%; height: 500px;"></div>
        </el-card>
    </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import * as echarts from 'echarts'
import { listPatients } from '@/api/health/patients'
import { getLife } from '@/api/health/life'
import { ElMessage } from 'element-plus'

const radarChart = ref(null)
const chart = ref(null)
const selectedPatient = ref('')
const patientList = ref([])

// Initialize chart
const initChart = () => {
    if (radarChart.value) {
        chart.value = echarts.init(radarChart.value)
    }
}

// Update chart data
const updateChart = async (patientName) => {
    if (!patientName) return

    try {
        // Find patient ID by patient name
        const patient = patientList.value.find(p => p.name === patientName)
        if (!patient) {
            ElMessage.error('Patient information not found')
            return
        }

        const response = await getLife(patient.patientId)
        if (!response.data) {
            ElMessage.error('Patient lifestyle data not found')
            return
        }

        const data = response.data

        // Build radar chart data
        const indicator = [
            { name: 'Smoking Status', max: 100 },
            { name: 'Alcohol Intake', max: 100 },
            { name: 'Exercise Frequency', max: 100 },
            { name: 'Sleep Quality', max: 100 },
            { name: 'Diet Habits', max: 100 },
            { name: 'Stress Level', max: 100 }
        ]

        const seriesData = [
            {
                value: [
                    calculateSmokingScore(data.smokingStatus),
                    calculateDrinkingScore(data.drinkingStatus),
                    calculateExerciseScore(data.exerciseFrequency),
                    calculateSleepScore(data.sleepQuality),
                    calculateDietScore(data.dietHabits),
                    calculateStressScore(data.stressLevel)
                ],
                name: 'Lifestyle Score'
            }
        ]

        const option = {
            title: {
                text: `${patientName}'s Lifestyle Assessment`,
                left: 'center'
            },
            tooltip: {
                trigger: 'item'
            },
            legend: {
                data: ['Lifestyle Score'],
                bottom: 0
            },
            radar: {
                indicator: indicator,
                radius: '65%',
                splitNumber: 4,
                axisName: {
                    color: '#333',
                    backgroundColor: '#fff',
                    borderRadius: 3,
                    padding: [3, 5]
                }
            },
            series: [{
                type: 'radar',
                data: seriesData,
                areaStyle: {
                    opacity: 0.3
                },
                lineStyle: {
                    width: 2
                }
            }]
        }

        chart.value.setOption(option)
    } catch (error) {
        console.error('Failed to get lifestyle data:', error)
        ElMessage.error('Failed to get lifestyle data: ' + error.message)
    }
}

// Calculate scores for each item
const calculateSmokingScore = (status) => {
    const scores = {
        'Never': 100,
        'Quit': 80,
        'Occasional': 60,
        'Regular': 40,
        'Heavy': 20,
        '从不吸烟': 100,
        '已戒烟': 80,
        '偶尔吸烟': 60,
        '经常吸烟': 40,
        '重度吸烟': 20
    }
    return scores[status] || 50
}

const calculateDrinkingScore = (status) => {
    const scores = {
        'Never': 100,
        'Quit': 80,
        'Occasional': 60,
        'Regular': 40,
        'Heavy': 20,
        '从不饮酒': 100,
        '已戒酒': 80,
        '偶尔饮酒': 60,
        '经常饮酒': 40,
        '重度饮酒': 20
    }
    return scores[status] || 50
}

const calculateExerciseScore = (frequency) => {
    const scores = {
        'Daily': 100,
        '3-5 times/week': 80,
        '1-2 times/week': 60,
        'Occasional': 40,
        'Never': 20,
        '每天运动': 100,
        '每周3-5次': 80,
        '每周1-2次': 60,
        '偶尔运动': 40,
        '从不运动': 20
    }
    return scores[frequency] || 50
}

const calculateSleepScore = (quality) => {
    const scores = {
        'Excellent': 100,
        'Good': 80,
        'Fair': 60,
        'Poor': 40,
        'Very Poor': 20,
        '很好': 100,
        '良好': 80,
        '一般': 60,
        '较差': 40,
        '很差': 20
    }
    return scores[quality] || 50
}

const calculateDietScore = (habits) => {
    const scores = {
        'Very Healthy': 100,
        'Fairly Healthy': 80,
        'Fair': 60,
        'Unhealthy': 40,
        'Very Unhealthy': 20,
        '非常健康': 100,
        '比较健康': 80,
        '一般': 60,
        '不太健康': 40,
        '非常不健康': 20
    }
    return scores[habits] || 50
}

const calculateStressScore = (level) => {
    const scores = {
        'No Stress': 100,
        'Mild': 80,
        'Moderate': 60,
        'Severe': 40,
        'Extreme': 20,
        '无压力': 100,
        '轻度压力': 80,
        '中度压力': 60,
        '重度压力': 40,
        '极度压力': 20
    }
    return scores[level] || 50
}

// Get patient list
const getPatientList = async () => {
    try {
        const response = await listPatients()
        console.log('Patient list data received:', response)
        if (response.rows && Array.isArray(response.rows)) {
            // Filter out patients without names
            patientList.value = response.rows.filter(patient => patient.name)
            console.log('Patient list set:', patientList.value)
        } else {
            console.error('Patient list data format incorrect:', response)
            ElMessage.error('Failed to get patient list: incorrect data format')
        }
    } catch (error) {
        console.error('Failed to get patient list:', error)
        ElMessage.error('Failed to get patient list: ' + error.message)
    }
}

// Handle patient selection change
const handlePatientChange = (patientName) => {
    console.log('Selected patient:', patientName)
    updateChart(patientName)
}

// Listen to window resize
const handleResize = () => {
    chart.value && chart.value.resize()
}

onMounted(() => {
    initChart()
    getPatientList()
    window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
    window.removeEventListener('resize', handleResize)
    chart.value && chart.value.dispose()
})
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

.el-select {
    width: 200px;
}
</style>