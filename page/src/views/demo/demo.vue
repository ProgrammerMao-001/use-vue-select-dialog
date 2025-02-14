<!--
 * @Description: demo 页面
 * @Author: mhf
 * @Date: 2025/2/9 19:16
-->
<template>
  <div class="demo">
    <el-button type="primary" icon="el-icon-plus" size="small" style="margin-bottom: 20px" @click="showDemoDialog(null, '新增')">新增</el-button>

    <div class="demo-table">
      <el-table
          stripe
          border
          height="500"
          style="width: 100%"
          :data="tableData"
      >
        <el-table-column label="序号" type="index" width="55"/>
        <el-table-column prop="username" label="用户名" show-overflow-tooltip/>
        <el-table-column prop="phone" label="联系方式" show-overflow-tooltip/>
        <el-table-column prop="depts" label="部门" show-overflow-tooltip>
          <template slot-scope="scope">
            {{ scope.row.depts | getName('dept_name') }}
          </template>
        </el-table-column>

        <el-table-column prop="posts" label="岗位" show-overflow-tooltip>
          <template slot-scope="scope">
            {{ scope.row.posts | getName('post_name') }}
          </template>
        </el-table-column>

        <el-table-column prop="menus" label="菜单" show-overflow-tooltip>
          <template slot-scope="scope">
            {{ scope.row.menus | getName('menu_name') }}
          </template>
        </el-table-column>

        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button type="text"
                       icon="el-icon-tickets"
                       @click="showDemoDialog(scope.row, '详情')">详情</el-button>
            <el-button type="text"
                       icon="el-icon-edit"
                       @click="showDemoDialog(scope.row, '编辑')">编辑</el-button>
            <el-button type="text"
                       icon="el-icon-delete"
                       style="color: #e84e61" @click="handleRemove(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination
          style="margin-top: 15px;text-align: right"
          layout="total, sizes, prev, pager, next, jumper"
          :page-sizes="[2, 10, 20, 30, 40]"
          :current-page="params.pageNum"
          :page-size="params.pageSize"
          :total="total"
          @current-change="currentChange"
          @size-change="sizeChange"
      />
    </div>

    <demoDialog ref="demoDialog" @getTableData="getTableData"/>
  </div>
</template>

<script>
import {getUserList, removeUser} from "@/api";
import demoDialog from "@/views/demo/demoDialog.vue";

export default {
  name: "demo",
  components: {demoDialog},
  mixins: [],
  props: {},
  computed: {},
  watch: {},
  filters: {
    getName(arr, key) {
      if (arr && JSON.parse(arr).length > 0) {
        return JSON.parse(arr).map(i => i[key]).join(",")
      }
    }
  },
  data() {
    return {
      tableData: [],
      params: {
        pageNum: 1,
        pageSize: 10,
      },
      total: 0,
    };
  },
  methods: {
    getTableData() {
      getUserList(this.params).then((res) => {
        console.log(res, "res")
        this.tableData = res.data.list;
        this.total = res.data.total;
      });
    },

    currentChange(pageNum) {
      this.params.pageNum = pageNum;
      this.getTableData();
    },

    sizeChange(pageSize) {
      this.params.pageSize = pageSize;
      this.getTableData();
    },

    handleRemove(data) {
      this.$confirm('此操作将永久删除该用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
          .then(() => {
            removeUser({userId: data.user_id}).then(() => {
              this.getTableData();
            }).catch(() => {
              this.$message({
                type: 'error',
                message: '删除失败！'
              });
            })
          })
          .catch(() => {
            this.$message({
              type: 'info',
              message: '已取消删除'
            });
          })
    },

    showDemoDialog(data, title) {
      this.$refs.demoDialog.showDialog({data, title});
    }
  },
  created() {
    this.getTableData();
  },
  mounted() {
  },
  destroyed() {
  }
};
</script>

<style scoped>
.demo {
}

.demo-table {
}
</style>
