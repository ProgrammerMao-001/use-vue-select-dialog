<template>
  <div id="app">
    <a target="_blank"
       v-for="item in linkList"
       style="margin-right: 20px"
       :key="item.text"
       :href="item.url"
    > {{ item.text }}</a>
    <hr>

    <h2>
      1. 简单使用：
    </h2>
    <el-form ref="form" :model="searchForm" label-width="80px">
      <el-form-item label="标题：">
        <el-radio-group v-model="searchForm.type" size="medium" @input="handleRadioChange">
          <el-radio v-for="item in typeList" :key="item.label" :label="item.label" />
        </el-radio-group>
      </el-form-item>

      <el-form-item label="数量：">
        <el-input-number v-model="searchForm.num"
                         :min="-1"
                         label="">
        </el-input-number>
      </el-form-item>
    </el-form>

    <h3> 1-1. 有分页 </h3>
    <simplePagination ref="simplePagination" :title="searchForm.type" :num="searchForm.num"/>

    <h3> 1-2. 无分页 </h3>
    <simpleList ref="simplePagination" :title="searchForm.type" :num="searchForm.num"/>

    <hr>
    <h2>
      2. 完整示例：
    </h2>
    <h3> 2-1. 多种选择类型 </h3>
    <demo ref="demo" :num="searchForm.num" />

  </div>
</template>

<script>
import simplePagination from "@/views/simplePagination/simplePagination.vue";
import simpleList from "@/views/simpleList/simpleList.vue";
import demo from "@/views/demo/demo.vue";
export default {
  name: 'App',
  components: {simplePagination, simpleList, demo},
  data() {
    return {
      searchForm: {
        type: '新增',
        num: -1,
      },
      typeList: [
        {
          label: '新增',
        },
        {
          label: '修改',
        },
        {
          label: '详情',
        },
      ],
      linkList: [
        {
          url: "https://www.npmjs.com/package/vue-select-dialog?activeTab=readme",
          text: "npm地址"
        },
        {
          url: "http://www.maohangfei.cn",
          text: "我的个人主页"
        },
        {
          url: "https://gitee.com/ProgrammerMao-001/use-vue-select-dialog",
          text: "demo源码地址"
        },
        {
          // url: "/readme",
          url: "https://gitee.com/ProgrammerMao-001/use-vue-select-dialog#vue-slect-dialog",
          text: "配置项手册"
        },
      ]
    }
  },
  methods: {
    handleRadioChange(e) {
      console.log(e, "e")
    }
  }
}
</script>
