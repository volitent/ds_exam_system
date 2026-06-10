import request from '@/utils/request'

// 查询问题表列表
export function listQuestion(query) {
  return request({
    url: '/testpaper/question/list',
    method: 'get',
    params: query
  })
}

// 查询问题表详细
export function getQuestion(id) {
  return request({
    url: '/testpaper/question/' + id,
    method: 'get'
  })
}

// 新增问题表
export function addQuestion(data) {
  return request({
    url: '/testpaper/question',
    method: 'post',
    data: data
  })
}

// 修改问题表
export function updateQuestion(data) {
  return request({
    url: '/testpaper/question',
    method: 'put',
    data: data
  })
}

// 删除问题表
export function delQuestion(id) {
  return request({
    url: '/testpaper/question/' + id,
    method: 'delete'
  })
}

/**
 * 上传题目图片
 */
export function uploadFiles(data) {
  return request({
    url: '/common/uploads',
    method: 'post',
    data: data,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}

// 新增接口
export function batchQuestionDetail(ids) {
  return request({
    url: '/testpaper/question/batchDetail',
    method: 'post',
    data: ids
  });
}

// 分页查询题目（带子表）
export function listQuestionWithDetail(query) {
  return request({
    url: '/testpaper/question/listWithDetail',
    method: 'get',
    params: query
  })
}


