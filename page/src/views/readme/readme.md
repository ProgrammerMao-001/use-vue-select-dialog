# vue-slect-dialog

![vue](https://img.shields.io/badge/vue-2.x-4fc08d.svg?colorA=2c3e50&style=flat-square)

## 安装

```bash
npm i vue-slect-dialog -D
```

## 注册

```javascript
import Vue from 'vue'
import vueSelectDialog from "vue-select-dialog";

Vue.use(vueSelectDialog)
```

## 使用

> [参考示例](http://60.204.234.113:91/)

## 配置

| 参数              | 说明                                  | 类型       | 可选值              | 默认值                                 | 是否必填 |
|-----------------|-------------------------------------|----------|------------------|-------------------------------------|------|
| dialogWidth     | 弹窗宽度                                | String   | -                | 1000px                              | -    |
| disabled        | 是否禁用                                | Boolean  | -                | false                               | -    |
| menuTitle       | 左侧列表标题                              | String   | -                | 清单                                  | -    |
| selectedTitle   | 右侧已选列表标题                            | Array    | -                | 已选                                  | -    |
| maxSelectable   | 最大可选数量                              | Number   | -1不限制,1单选,大于1的整数 | -1                                  | -    |
| behavior        | 当超出限制数量后的行为 (maxSelectable!==-1时启用) | Number   | -                | 0 表示不允许选择，1 表示自动去除多余的选择项（优先去除最先选择的） | -    |
| validate        | 点击保存是否需要校验                          | Boolean  | false,true       | false                               | -    |
| validateMessage | 校验提示语                               | String   | -                | 请先选择一条数据！                           | -    |
| processingData  | 请求接口后处理返回数据                         | Function | -                | 见下方processingData示例                 | -    |
| idKey           | 表格单行数据的唯一标识                         | String   | -                | id                                  | -    |
| valueKey        | tag上展示的字段                           | String   | -                | name                                | 必填   |
| pagination      | 当前列表是否需要分页(根据接口，该组件本身不支持前端分页)       | Boolean  | -                | true                                | -    |
| pageNum         | 分页页码(对应后端接口的分页字段)                   | String   | -                | pageNum                             | -    |
| pageSize        | 分页大小(对应后端接口的分页字段)                   | String   | -                | pageSize                            | -    |
| formLabel       | 查询条件                                | Array    | -                | 见下方formLabel示例                      | -    |
| tableDataColumn | 表格的表头数据                             | Array    | -                | 见下方tableDataColumn示例                | 必填   |

### processingData 示例

```javascript
// 用于处理接口返回的数据(data：表格数据，total：表格数据总条数)
const processingDataDemo1 = (res) => {
    return {data: res.data, total: res.data.length};
}
const processingDataDemo2 = (res) => {
    return {data: res.data.list, total: res.data.total};
}
```

### formLabel 示例
[参考文档](https://programmermao-001.github.io/ytUi-doc/components/ytForm/ytForm.html)

### tableDataColumn 示例

| 参数         | 说明                           | 类型      | 可选值 | 默认值 | 是否必填 |
|------------|------------------------------|---------|-----|-----|------|
| label      | 表头名称                         | String  | -   | -   | 必填   |
| prop       | 对应接口返回的字段                    | String  | -   | -   | 必填   |
| isSlot     | 是否是插槽                        | Boolean | -   | -   | -    |
| width      | 表头宽度                         | Number  | -   | -   | -    |
| accumulate | 序号是否累加(仅对label是序号或者index时有效) | Boolean | -   | -   | -    |

```javascript
tableDataColumn = [
    {
        label: "序号", // 表头名称
        width: 50, // 表头宽度
        accumulate: false, // 序号是否累加
    },
    {
        label: "部门名称",
        prop: "dept_name",
    },
    {
        label: "部门ID",
        prop: "dept_id",
    },
    {
        label: "部门状态",
        prop: "status", // 对应接口返回的字段
        isSlot: true, // 是否是插槽
    },
    {
        label: "节点类型",
        prop: "nodeType",
        isSlot: true,
    },
    {
        label: "创建者",
        prop: "create_by",
    },
    {
        label: "创建时间",
        prop: "create_time",
    },
];
```

## inject/provide 接口传参

### 示例1

```vue

<script>
import {getDeptQueryList} from "@/api";

export default {
  provide() {
    return {
      requestName: getDeptQueryList,
      // requestName: (params) => getDeptQueryList(params) // 和上面效果一样【需在注册接口的地方接参】
    };
  }
}
</script>
```

### 示例2

```vue

<script>
import axios from "axios";

export default {
  provide() {
    return {
      requestName: this.interfaceName
    };
  },
  methods: {
    interfaceName(params) {
      let url = "接口地址";
      return axios.get(url, {params});
    }
  }
}
</script>
```

## emit 事件

| 事件名称             | 说明                                         | 回调参数      |
|------------------|--------------------------------------------|-----------|
| update-formLabel | 主要用于更新formLabel中配置的下拉数据(如果查询条件是动态的下拉数据则必填) | formLabel |
| on-response      | 点击确定按钮后接收选择的表格行数据                          | []        | 
