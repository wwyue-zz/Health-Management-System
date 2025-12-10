import request from '@/utils/request'

// 发送患者信息到AI聊天接口
export function sendPatientInfo(patientName) {
    return request({
        url: '/ai/chat',
        method: 'post',
        params: {
            patientName: patientName
        },
        timeout: 120000  // 设置超时时间为2分钟
    })
} 