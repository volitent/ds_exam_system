import request from '@/utils/request'

// 查询试卷表管理列表
export function listPaperlist(query) {
  return request({
    url: '/paper/paperlist/list',
    method: 'get',
    params: query
  })
}

// 查询试卷表管理详细
export function getPaperlist(id) {
  return request({
    url: '/paper/paperlist/' + id,
    method: 'get'
  })
}

// 新增试卷表管理
export function addPaperlist(data) {
  return request({
    url: '/paper/paperlist',
    method: 'post',
    data: data
  })
}

// 修改试卷表管理
export function updatePaperlist(data) {
  return request({
    url: '/paper/paperlist',
    method: 'put',
    data: data
  })
}

// 删除试卷表管理
export function delPaperlist(id) {
  return request({
    url: '/paper/paperlist/' + id,
    method: 'delete'
  })
}
