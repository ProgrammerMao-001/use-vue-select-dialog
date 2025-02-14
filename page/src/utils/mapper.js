// 部门/岗位/菜单 - 状态
const statusList = [
    {
        label: "正常",
        value: 0,
    },
    {
        label: "停用",
        value: 1,
    },
]
const yOrNList = [
    {
        label: "是",
        value: 0,
    },
    {
        label: "否",
        value: 1,
    },
]
// 部门 - 节点类型
const nodeTypeList = [
    {
        label: "区域",
        value: 1,
    },
    {
        label: "部门",
        value: 2,
    },
    {
        label: "部门分支",
        value: 3,
    },
]

export {
    statusList,
    yOrNList,
    nodeTypeList
}
