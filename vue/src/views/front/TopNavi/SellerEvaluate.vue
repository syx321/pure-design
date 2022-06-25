<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
      <el-button class="ml-5" @click="load">搜索</el-button>
      <el-button class="ml-5" @click="reset">重置</el-button>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'">
      <el-table-column prop="orderId" label="订单号" width="60"></el-table-column>
      <el-table-column label="商品图片"  width="150" style="height: 150px" align="center">
        <template slot-scope="scope">
          <img :src="scope.row.img" alt="" style="width: 100%">
        </template>
      </el-table-column>
      <el-table-column prop="name" label="名称"></el-table-column>
      <el-table-column label="交易状态">
        <template slot-scope="scope">
          <el-tag type="success" v-if="scope.row.deliverState === 'FINISHED'">已完成</el-tag>
          <el-tag type="primary" v-else-if="scope.row.deliverState === 'RECEIVED'">已收货</el-tag>
          <el-tag type="warning" v-else>已发货</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="createTime" label="订单创建时间" width="135" :formatter="formatterTime"></el-table-column>
      <el-table-column prop="receivedTime" label="收货时间" width="135" :formatter="formatterTime"></el-table-column>
      <el-table-column prop="count" label="数量" width="45"></el-table-column>
      <el-table-column label="总价">
        <template slot-scope="scope">
          <span style="font-size: 16px">¥ {{scope.row.count * scope.row.price}}</span>
        </template>
      </el-table-column>
      <el-table-column prop="sellerEvaluate" label="商家评价" :formatter="displayEvaluateStr"></el-table-column>
      <el-table-column label="操作" width="150" align="center">
        <template slot-scope="scope">
          <el-button type="success" v-if="scope.row.sellerEvaluate" disabled>已评价</el-button>
          <el-button type="warning" v-else-if="scope.row.receivedTime == 0" disabled>用户收货后评价</el-button>
          <el-button type="primary" v-else @click="popUpMenu(scope.row)">评价<i class="el-icon-edit"></i></el-button>
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
              placeholder="请输入对顾客的评价"
              v-model="evaluateStr">
          </el-input>
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
  name: "SellerEvaluate",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      menuDialogVis: false,
      evaluateStr: "",
      colors: ['#99A9BF', '#F7BA2A', '#FF9900'],
      img:"",
      evaluateUserId:0,
      order: {
        orderId:0,
        img:"",
        name:"",
        count:0,
        price:0,
        deliverState: "",
        dealStyle:"",
        createTime:0,
        receivedTime:0,
        userEvaluate:"",
        score:0,
        sellerAttitude: "",
        sellerEvaluate:""
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/purchase-relationship/sellerPage", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          businessId: JSON.parse(localStorage.getItem("user")).id,
          name: this.name,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })

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
    popUpMenu(role) {
      this.evaluateUserId = role.orderId
      this.evaluateStr = "";
      this.menuDialogVis = true
    },
    evaluate() {
      // 设置评价和评分
      this.request.get("/purchase-relationship/sellerEvaluate", {
        params: {
          orderId: this.evaluateUserId,
          sellerEvaluate: this.evaluateStr,
        }
      }).then(res => {
        if (res.code === '200') {
          this.menuDialogVis = false
          this.$message.success('评价成功')
          this.load()
        } else {
          this.$message.error("评价失败")
        }
      })
    },
    formatterTime(row, column) {
      var date = new Date();  // 初始化日期
      if (column.property == "createTime") {
        date = new Date(row.createTime);
      } else if (column.property == "receivedTime") {
        if (row.receivedTime == 0) {
          return '未收货'
        }
        date = new Date(row.receivedTime);
      }
      var year = date.getFullYear(); //获取年份
      var month = date.getMonth() + 1; // 获取月份
      var day = date.getDate(); // 获取具体日
      var hour = date.getHours(); // 获取时
      var minutes = date.getMinutes(); // 获取分
      var seconds = date.getSeconds(); // 获取秒
      return year + '/' + month + '/' + day + ' ' + hour + ':' + minutes + ':' + seconds
    },
    displayEvaluateStr(row, column) {
      if (row.sellerEvaluate) {
        return row.sellerEvaluate
      } else {
        return '未评价'
      }
    }

  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
