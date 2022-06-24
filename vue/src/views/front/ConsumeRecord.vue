<template>
  <div>
    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'">
      <el-table-column type="index" label="记录"></el-table-column>
      <el-table-column prop="consumeRecord" label="消费金额"></el-table-column>
      <el-table-column prop="time" label="时间" :formatter="formatterTime"></el-table-column>
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

  </div>
</template>

<script>
export default {
  name: "AccountRecord",
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
      colors: ['#99A9BF', '#F7BA2A', '#FF9900'],
      record: {
        userId:0,
        rechargeRecord:"",
        consumeRecord:"",
        incomeRecord:"",
        time:0
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/account-change/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          userId: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).userId : 1,
        }
      }).then(res => {
        this.tableData = res.data.records.filter(function(item){
          return item.consumeRecord != null;
        });
        this.total = res.data.total
      })
    },
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
    formatterTime(row, column) {
      var date = new Date(row.time); // 初始化日期
      var year = date.getFullYear(); //获取年份
      var month = date.getMonth() + 1; // 获取月份
      var day = date.getDate(); // 获取具体日
      var hour = date.getHours(); // 获取时
      var minutes = date.getMinutes(); // 获取分
      var seconds = date.getSeconds(); // 获取秒
      return year + '年' + month + '月' + day + '日 ' +  hour + ':' + minutes + ':' + seconds
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
