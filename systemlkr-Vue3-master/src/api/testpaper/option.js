import request from '@/utils/request'

// 查询选择题选项列表
export function listOption(query) {
  return request({
    url: '/testpaper/option/list',
    method: 'get',
    params: query
  })
}

// 查询选择题选项详细
export function getOption(id) {
  return request({
    url: '/testpaper/option/' + id,
    method: 'get'
  })
}

// 新增选择题选项
export function addOption(data) {
  return request({
    url: '/testpaper/option',
    method: 'post',
    data: data
  })
}

// 修改选择题选项
export function updateOption(data) {
  return request({
    url: '/testpaper/option',
    method: 'put',
    data: data
  })
}

// 删除选择题选项
export function delOption(id) {
  return request({
    url: '/testpaper/option/' + id,
    method: 'delete'
  })
}
