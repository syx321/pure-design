<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
      <el-button class="ml-5" @click="load">搜索</el-button>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'">
<!--      <el-table-column> <img :src="item" alt="" style="width: 100%"> </el-table-column>-->
      <el-table-column prop="name" label="名称"></el-table-column>
      <el-table-column prop="flag" label="唯一标识"></el-table-column>
      <el-table-column prop="description" label="描述"></el-table-column>
      <el-table-column label="操作"  width="220" align="center">
        <template slot-scope="scope">
          <el-button type="info" v-if="scope.row.deliverState === 'FINISHED'" @click="selectMenu(scope.row)">评价 <i class="el-icon-edit"></i></el-button>
          <el-button type="success" @click="confirmReceive(scope.row)">确认收货</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="评价" :visible.sync="menuDialogVis" width="30%">
      <el-form label-width="10px" size="small">
        <el-form-item>
          <el-input
              type="textarea"
              :rows="8"
              placeholder="请输入对本次购物的评价"
              v-model="evaluateStr">
          </el-input>
        </el-form-item>
        <span style="text-align: center">交易评分</span>
        <el-form-item style="text-align: center">
          <el-rate
              v-model="value"
              :colors="colors">
          </el-rate>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="menuDialogVis = false">取 消</el-button>
        <el-button type="primary" @click="evaluate">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "MyOrder",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      menuDialogVis: false,
      value: null,
      evaluateStr: "",
      colors: ['#99A9BF', '#F7BA2A', '#FF9900']
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/role/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })

      this.request.get("/menu/ids").then(res => {
        this.ids = res.data
      })

    },
    evaluate() {
      // 评价
      this.menuDialogVis = false
      // console.log(this.evaluateStr)
      // console.log(this.value)
    },
    confirmReceive(row) {
      // 确认收货
      this.$message.success('确认收货')
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
    selectMenu(role) {
      // 设置评价和评分
      this.menuDialogVis = true
    },
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
