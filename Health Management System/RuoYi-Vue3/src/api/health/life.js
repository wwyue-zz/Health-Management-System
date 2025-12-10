import request from '@/utils/request'

// 查询生活习惯干预跟踪列表
export function listLife(query) {
  return request({
    url: '/health/life/list',
    method: 'get',
    params: query
  })
}

// 查询生活习惯干预跟踪详细
export function getLife(lifestyleId) {
  return request({
    url: '/health/life/' + lifestyleId,
    method: 'get'
  })
}

// 新增生活习惯干预跟踪
export function addLife(data) {
  return request({
    url: '/health/life',
    method: 'post',
    data: data
  })
}

// 修改生活习惯干预跟踪
export function updateLife(data) {
  return request({
    url: '/health/life',
    method: 'put',
    data: data
  })
}

// 删除生活习惯干预跟踪
export function delLife(lifestyleId) {
  return request({
    url: '/health/life/' + lifestyleId,
    method: 'delete'
  })
}
