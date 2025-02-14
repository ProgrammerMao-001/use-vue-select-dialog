<!--
 * @Description: 无分页 页面
 * @Author: mhf
 * @Date: 2025/2/6 22:57
-->
<template>
  <div>
    <el-form ref="form" :model="formData" label-width="80px">
      <el-row :gutter="0">
       <el-col :span="12">
         <el-form-item label="部门 : " prop="enterpriseName">
           <el-input
               v-model="formData.enterpriseName"
               placeholder="选择所属部门"
               readonly
           >
             <template slot="append">
               <div
                   style="color: #1492ff; cursor: pointer; font-weight: bolder"
                   @click="chooseEnterpriseDialog"
               >
                 <i class="el-icon-thumb"/>
                 {{ title === "详情" ? "查看" : "选择" }}
               </div>
             </template>
           </el-input>
         </el-form-item>
       </el-col>
      </el-row>
    </el-form>

    <vueSelectDialog
        ref="vueSelectDialog"
        idKey="dept_id"
        valueKey="dept_name"
        menuTitle="部门清单"
        selectedTitle="已选部门"
        validate
        :maxSelectable="num"
        :pagination="false"
        :disabled="['详情'].includes(title)"
        :formLabel="formLabel"
        :tableDataColumn="tableDataColumn"
        :processingData="
        (res) => {
          return { data: res.data, total: res.data.length };
        }
      "
        @update-formLabel="handleUpdateFormLabel"
        @on-response="getChooseArr"
    >
      <template slot-scope="scope" slot="status">
        {{
          deptStatusMapper.find((i) => i.value == scope.row.status)
              ?.label
        }}
      </template>
      <template slot-scope="scope" slot="nodeType">
        {{
          nodeTypeMapper.find((i) => i.value == scope.row.node_type)
              ?.label
        }}
      </template>
    </vueSelectDialog>
  </div>
</template>

<script>
import vueSelectDialog from "vue-select-dialog";
import {getDeptQueryList} from "@/api";
import {statusList, nodeTypeList} from "@/utils/mapper";
import axios from "axios";

export default {
  name: "simpleList",
  components: {vueSelectDialog},
  mixins: [],
  props: {
    title: {
      type: String,
      default: "",
    },
    num: {
      type: Number,
      default: -1,
    }
  },
  computed: {
    deptStatusMapper() {
      return statusList;
    },
    nodeTypeMapper() {
      return nodeTypeList;
    },
  },
  provide() {
    return {
      requestName: getDeptQueryList,
      // requestName: (params) => getDeptQueryList(params)
      // requestName: this.interfaceName
    };
  },
  watch: {},
  filters: {},
  data() {
    return {
      formData: {},
      formLabel: [
        {
          label: "部门名称",
          value: "dept_name",
          type: "input",
        },
        {
          label: "创建者",
          value: "create_by",
          type: "input",
        },
        {
          label: "部门状态",
          value: "status",
          type: "select",
          opts: [],
          optLabel: "label",
          optValue: "value",
        },
        {
          label: "节点类型",
          value: "node_type",
          type: "select",
          opts: [],
          optLabel: "label",
          optValue: "value",
        },
      ],
      tableDataColumn: [
        {
          label: "序号",
          accumulate: true,
        },
        {
          label: "名称",
          prop: "dept_name",
        },
        {
          label: "状态",
          prop: "status",
          isSlot: true,
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
      ],
      lineArr: [
        // {
        //   dept_id: 1,
        //   dept_name: "总公司",
        // },
        // {
        //   dept_id: 104,
        //   dept_name: "112112 :",
        // },
      ], // 回显需要的数据格式：[{idKey: '', valueKey: ''}]
    };
  },
  methods: {
    interfaceName(params) {
      let url = process.env.VUE_APP_BASE_API + "/getDeptList";
      return axios.get(url, {params});
    },

    chooseEnterpriseDialog() {
      let passData = {
        data: this.lineArr,
        title: "选择部门",
      };
      this.$refs.vueSelectDialog.showDialog(passData);
    },

    getChooseArr(data) {
      let name = data?.map((i) => i.dept_name).join(",");
      let id = data?.map((i) => i.id).join(",");
      this.$set(this.formData, "enterpriseName", name);
      this.$set(this.formData, "enterpriseId", id);
      this.lineArr = data;
    },

    /**
     * @Event 方法
     * @description: 新版本中建议在此处更新表单数据
     * @author: mhf
     * @time: 2025-02-06 16:08:15
     **/
    handleUpdateFormLabel() {
      this.formLabel.find((i) => i.value === "status").opts = this.deptStatusMapper;
      this.formLabel.find((i) => i.value === "node_type").opts = this.nodeTypeMapper;
    },
  },
  created() {
  },
  mounted() {
  },
  destroyed() {
  },
};
</script>

<style lang="scss" scoped></style>
