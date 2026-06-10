import request from '@/utils/request'

// 查询知识点列表
export function listKnowledge_point(query) {
  return request({
    url: '/testpaper/knowledge_point/list',
    method: 'get',
    params: query
  })
}

// 查询知识点详细
export function getKnowledge_point(id) {
  return request({
    url: '/testpaper/knowledge_point/' + id,
    method: 'get'
  })
}

// 新增知识点
export function addKnowledge_point(data) {
  return request({
    url: '/testpaper/knowledge_point',
    method: 'post',
    data: data
  })
}

// 修改知识点
export function updateKnowledge_point(data) {
  return request({
    url: '/testpaper/knowledge_point',
    method: 'put',
    data: data
  })
}

// 删除知识点
export function delKnowledge_point(id) {
  return request({
    url: '/testpaper/knowledge_point/' + id,
    method: 'delete'
  })
}
