import request from '@/utils/request'

// 查询血压及生命体征记录列表
export function listXueya(query) {
  return request({
    url: '/health/xueya/list',
    method: 'get',
    params: query
  })
}

// 查询血压及生命体征记录详细
export function getXueya(recordId) {
  return request({
    url: '/health/xueya/' + recordId,
    method: 'get'
  })
}

// 新增血压及生命体征记录
export function addXueya(data) {
  return request({
    url: '/health/xueya',
    method: 'post',
    data: data
  })
}

// 修改血压及生命体征记录
export function updateXueya(data) {
  return request({
    url: '/health/xueya',
    method: 'put',
    data: data
  })
}

// 删除血压及生命体征记录
export function delXueya(recordId) {
  return request({
    url: '/health/xueya/' + recordId,
    method: 'delete'
  })
}
