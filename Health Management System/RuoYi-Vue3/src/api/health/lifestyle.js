import request from '@/utils/request'

// 查询患者生活习惯列表
export function listLifestyleHabits(query) {
    return request({
        url: '/health/lifestyle/list',
        method: 'get',
        params: query
    })
}

// 查询患者生活习惯详细
export function getLifestyleHabits(patientId) {
    return request({
        url: '/health/lifestyle/' + patientId,
        method: 'get'
    })
}

// 新增患者生活习惯
export function addLifestyleHabits(data) {
    return request({
        url: '/health/lifestyle',
        method: 'post',
        data: data
    })
}

// 修改患者生活习惯
export function updateLifestyleHabits(data) {
    return request({
        url: '/health/lifestyle',
        method: 'put',
        data: data
    })
}

// 删除患者生活习惯
export function delLifestyleHabits(patientId) {
    return request({
        url: '/health/lifestyle/' + patientId,
        method: 'delete'
    })
}