import request from '@/utils/request'

// 查询降压药物使用及效果记录列表
export function listMedication(query) {
  return request({
    url: '/health/medication/list',
    method: 'get',
    params: query
  })
}

// 查询降压药物使用及效果记录详细
export function getMedication(medId) {
  return request({
    url: '/health/medication/' + medId,
    method: 'get'
  })
}

// 新增降压药物使用及效果记录
export function addMedication(data) {
  return request({
    url: '/health/medication',
    method: 'post',
    data: data
  })
}

// 修改降压药物使用及效果记录
export function updateMedication(data) {
  return request({
    url: '/health/medication',
    method: 'put',
    data: data
  })
}

// 删除降压药物使用及效果记录
export function delMedication(medId) {
  return request({
    url: '/health/medication/' + medId,
    method: 'delete'
  })
}
