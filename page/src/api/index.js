import request from "@/utils/request";
export function getDeptList(params) {
  return request({
    url: "/getDeptListWithPagination",
    method: "get",
    params
  });
}
export function getDeptQueryList(params) {
  return request({
    url: "/getDeptList",
    method: "get",
    params
  });
}

export function getMenuList(params) {
  return request({
    url: "/getMenuListWithPagination",
    method: "get",
    params
  });
}

export function getPostList(params) {
  return request({
    url: "/getPostListWithPagination",
    method: "get",
    params
  });
}

export function getUserList(params) {
  return request({
    url: "/getUserListWithPagination",
    method: "get",
    params
  });
}
export function getUserDetail(userId) {
  return request({
    url: `/getUserById/${userId}`,
    method: "get",
  });
}

export function removeUser(data) {
  return request({
    url: "/removeUser",
    method: "post",
    data
  });
}

export function insertUser(data) {
  return request({
    url: "/insertUser",
    method: "post",
    data
  });
}

export function updateUser(data) {
  return request({
    url: "/updateUser",
    method: "post",
    data
  });
}
