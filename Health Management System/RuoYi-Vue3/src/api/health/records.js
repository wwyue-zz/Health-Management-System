import request from '@/utils/request'

// 查询随访及风险评估列表
export function listRecords(query) {
  return request({
    url: '/health/records/list',
    method: 'get',
    params: query
  })
}

// 查询随访及风险评估详细
export function getRecords(followId) {
  return request({
    url: '/health/records/' + followId,
    method: 'get'
  })
}

// 新增随访及风险评估
export function addRecords(data) {
  return request({
    url: '/health/records',
    method: 'post',
    data: data
  })
}

// 修改随访及风险评估
export function updateRecords(data) {
  return request({
    url: '/health/records',
    method: 'put',
    data: data
  })
}

// 删除随访及风险评估
export function delRecords(followId) {
  return request({
    url: '/health/records/' + followId,
    method: 'delete'
  })
}
