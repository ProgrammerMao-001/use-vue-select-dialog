<template>
  <div>
    <el-dialog
        :title="title"
        :visible.sync="dialogVisible"
        :close-on-click-modal="false"
        @close="hideDialog"
    >
      <el-form ref="form"
               label-width="90px"
               :rules="rules"
               :model="formData"
      >
        <el-form-item label="用户名 : " prop="username">
          <el-input v-model="formData.username"
                    :disabled="['详情'].includes(title)"
          ></el-input>
        </el-form-item>

        <el-form-item label="联系方式 : " prop="phone">
          <el-input v-model="formData.phone"
                    :disabled="['详情'].includes(title)"
          ></el-input>
        </el-form-item>

        <el-form-item label="部门 : " prop="depts">
          <el-input
              v-model="formData.depts"
              placeholder="选择部门"
              disabled
          >
            <template slot="append">
              <div
                  style="color: #1492ff; cursor: pointer; font-weight: bolder"
                  @click="showVueSelectDialog(0)"
              >
                <i class="el-icon-thumb"/>
                {{ title === "详情" ? "查看" : "选择" }}
              </div>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item label="岗位 : " prop="posts">
          <el-input
              v-model="formData.posts"
              placeholder="选择岗位"
              disabled
          >
            <template slot="append">
              <div
                  style="color: #1492ff; cursor: pointer; font-weight: bolder"
                  @click="showVueSelectDialog(1)"
              >
                <i class="el-icon-thumb"/>
                {{ title === "详情" ? "查看" : "选择" }}
              </div>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item label="菜单 : " prop="menus">
          <el-input
              v-model="formData.menus"
              placeholder="选择菜单"
              disabled
          >
            <template slot="append">
              <div
                  style="color: #1492ff; cursor: pointer; font-weight: bolder"
                  @click="showVueSelectDialog(2)"
              >
                <i class="el-icon-thumb"/>
                {{ title === "详情" ? "查看" : "选择" }}
              </div>
            </template>
          </el-input>
        </el-form-item>


      </el-form>

      <div slot="footer" class="dialog-footer" v-show="!['详情'].includes(title)">
        <el-button @click="hideDialog">取 消</el-button>
        <el-button type="primary" @click="handleValidate">确 定</el-button>
      </div>
    </el-dialog>

    <vueSelectDialog
        ref="vueSelectDialog"
        validate
        background
        layout="total, sizes, prev, pager, next, jumper"
        :pager-count="5"
        :page-sizes="[5, 10, 20, 100, 200]"
        :behavior="0"
        :maxSelectable="maxSelectable"
        :idKey="idKey"
        :menuTitle="menuTitle"
        :valueKey="valueKey"
        :selectedTitle="selectedTitle"
        :pagination="pagination"
        :disabled="['详情'].includes(title)"
        :formLabel="formLabel"
        :tableDataColumn="tableDataColumn"
        :processingData="processingData"
        @update-formLabel="handleUpdateFormLabel"
        @on-response="getChooseArr"
    >

      <!-- 部门、岗位、菜单 => 状态 -->
      <template slot-scope="scope" slot="status">
        {{
          statusMapper.find((i) => i.value == scope.row.status)
              ?.label
        }}
      </template>

      <!-- 部门 -->
      <template slot-scope="scope" slot="nodeType">
        {{
          nodeTypeMapper.find((i) => i.value == scope.row.node_type)
              ?.label
        }}
      </template>

      <!-- 菜单 -->
      <template slot-scope="scope" slot="is_cache">
        {{
          yOrNMapper.find((i) => i.value == scope.row.is_cache)
              ?.label
        }}
      </template>
    </vueSelectDialog>
  </div>
</template>

<script>
import {
  insertUser,
  updateUser,
  getUserDetail,
  getDeptQueryList,
  getPostList
} from "@/api";
import axios from "axios";
import vueSelectDialog from "vue-select-dialog";
import {statusList, nodeTypeList, yOrNList} from "@/utils/mapper";

export default {
  name: "demoDialog",
  components: {vueSelectDialog},
  mixins: [],
  props: {},
  computed: {
    statusMapper() {
      return statusList;
    },
    nodeTypeMapper() {
      return nodeTypeList;
    },
    yOrNMapper() {
      return yOrNList;
    },
  },
  watch: {},
  filters: {},
  provide() {
    return {
      requestName: params => this.typeMapper[this.dialogType]?.request(params)
      // requestName: getDeptQueryList,
      // requestName: (params) => getDeptQueryList(params)
    };
  },
  data() {
    return {
      title: undefined,
      dialogVisible: false,
      formData: {
        depts: undefined,
        posts: undefined,
        menus: undefined,
      },
      rules: {
        username: [
          {required: true, message: "请输入用户名", trigger: "blur"},
        ],
        phone: [
          {required: true, message: "请输入联系方式", trigger: "blur"},
        ],
      },
      maxSelectable: -1,
      valueKey: undefined,
      idKey: "dept_id",
      menuTitle: undefined,
      selectedTitle: undefined,
      processingData: () => {
      },
      pagination: true,
      formLabel: [],
      tableDataColumn: [],
      typeMapper: {
        0: {
          name: "部门",
          request: getDeptQueryList,
          maxSelectable: 1,
          idKey: "dept_id",
          valueKey: "dept_name",
          key: "depts",
          pagination: false,
          processingData: (res) => {
            return {data: res.data, total: res.data.length};
          }
        },
        1: {
          name: "岗位",
          request: getPostList,
          maxSelectable: 3,
          idKey: "post_id",
          valueKey: "post_name",
          key: "posts",
          pagination: true,
          processingData: (res) => {
            return {data: res.data.list, total: res.data.total};
          }
        },
        2: {
          name: "菜单",
          request: (params) => axios.get(process.env.VUE_APP_BASE_API + "/getMenuListWithPagination", {params}),
          maxSelectable: -1,
          idKey: "menu_id",
          valueKey: "menu_name",
          key: "menus",
          pagination: true,
          processingData: (res) => {
            return {data: res.data.data.list, total: res.data.data.total};
          }
        },
      },
      dialogType: 0, // 0:部门 1：岗位 2：菜单
    };
  },
  methods: {
    showDialog(data) {
      this.dialogVisible = true;
      this.title = data.title;

      if (!['新增'].includes(this.title)) {
        this.getDetail(data.data.user_id)
      }
    },

    hideDialog() {
      this.formData = {}
      this.$refs.form.resetFields();
      this.$emit("getTableData");
      this.dialogVisible = false;
    },

    handleValidate() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.submitForm()
        }
      });
    },

    submitForm() {
      if (['新增'].includes(this.title)) {
        insertUser(this.formData).then((res) => {
          console.log(res, "res")
          this.$message({
            message: "新增成功",
            type: "success",
          });
          this.hideDialog();
        });
      } else {
        updateUser(this.formData).then((res) => {
          console.log(res, "res")
          this.$message({
            message: "修改成功",
            type: "success",
          });
          this.hideDialog();
        })
      }

    },

    getDetail(id) {
      getUserDetail(id).then((res) => {
        this.formData = res.data
        console.log(this.formData, "this.formData")
      })
    },

    setDialogData(type) {
      if (Number(type) === 0) {
        /* 部门 */
        this.formLabel = [
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
        ]
        this.tableDataColumn = [
          {
            label: "序号",
            width: 50,
            accumulate: false,
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
        ];
      } else if (Number(type) === 1) {
        /* 岗位 */
        this.formLabel = [
          {
            label: "岗位名称",
            value: "post_name",
            type: "input",
          },
          {
            label: "岗位编号",
            value: "post_code",
            type: "input",
          },
          {
            label: "岗位状态",
            value: "status",
            type: "select",
            opts: [],
            optLabel: "label",
            optValue: "value",
          },
        ];
        this.tableDataColumn = [
          {
            label: "序号",
            width: 60,
            accumulate: true,
          },
          {
            label: "岗位名称",
            prop: "post_name",
          },
          {
            label: "岗位ID",
            prop: "post_id",
          },
          {
            label: "岗位编号",
            prop: "post_code",
          },
          {
            label: "岗位排序",
            prop: "post_sort",
          },
          {
            label: "岗位状态",
            prop: "status",
            isSlot: true,
          }
        ];
      } else if (Number(type) === 2) {
        /* 菜单 */
        this.formLabel = [
          {
            label: "菜单名称",
            value: "menu_name",
            type: "input",
          },
          {
            label: "是否缓存",
            value: "is_cache",
            type: "select",
            opts: [],
            optLabel: "label",
            optValue: "value",
          },
          {
            label: "菜单状态",
            value: "status",
            type: "select",
            opts: [],
            optLabel: "label",
            optValue: "value",
          },
        ];
        this.tableDataColumn = [
          {
            label: "序号",
            width: 80,
            accumulate: true,
          },
          {
            label: "菜单名称",
            prop: "menu_name",
          },
          {
            label: "菜单ID",
            prop: "menu_id",
          },
          {
            label: "路由地址",
            prop: "path",
          },
          {
            label: "组件路径",
            prop: "component",
          },
          {
            label: "菜单状态",
            prop: "status",
            isSlot: true,
          },
          {
            label: "是否缓存",
            prop: "is_cache",
            isSlot: true,
          }
        ];
      }
    },


    showVueSelectDialog(type) {
      console.log(type, "type")
      let {name, pagination, valueKey, idKey, maxSelectable, processingData} = this.typeMapper[type];
      this.maxSelectable = maxSelectable;
      this.valueKey = valueKey;
      this.idKey = idKey;
      this.menuTitle = `${name}清单`;
      this.selectedTitle = `已选${name}`;
      this.dialogType = type;
      this.pagination = pagination;
      this.processingData = processingData;
      this.setDialogData(type);

      const dataForDialog = this.formData[this.typeMapper[type].key]
      let passData = {
        data: JSON.parse(dataForDialog || "[]"),
        title: `选择${this.typeMapper[type].name}`
      };
      console.log(passData, "passData")
      this.$refs.vueSelectDialog.showDialog(passData);
    },

    handleUpdateFormLabel(e) {
      if (e.length === 0) {
        return;
      }
      if ([0, 1, 2, '0', '1', '2'].includes(this.dialogType)) {
        this.formLabel.find((i) => i.value === "status").opts = this.statusMapper;
      }
      if (this.dialogType === 0) {
        this.formLabel.find((i) => i.value === "node_type").opts = this.nodeTypeMapper;
      }
      if (this.dialogType === 2) {
        this.formLabel.find((i) => i.value === "is_cache").opts = this.yOrNMapper;
      }
    },

    getChooseArr(data) {
      console.log(data, "data")
      this.$set(this.formData, this.typeMapper[this.dialogType].key, JSON.stringify(data.map(i => {
        return {
          [this.idKey]: i[this.idKey],
          [this.valueKey]: i[this.valueKey]
        }
      })))
    },
  },
  created() {
  },
  mounted() {
  },
  destroyed() {
  }
};
</script>

<style lang="scss" scoped></style>
