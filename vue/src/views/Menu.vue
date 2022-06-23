<template>
  <!--  商品后台管理页面-->
  <!--  商品后台管理页面-->
  <!--  商品后台管理页面-->
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入商品名称" suffix-icon="el-icon-search" v-model="productName"></el-input>
      <el-button class="ml-5" type="primary" @click="search">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
      <el-button type="primary" @click="changePageType" class="ml-5"> 切换 <i class="el-icon-top"></i></el-button>

    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="45"></el-table-column>
      <el-table-column prop="productId" label="ID" width="40"></el-table-column>
      <el-table-column prop="name" label="商品名称" width="100"></el-table-column>
      <el-table-column prop="sort" label="商品类别" width="110"></el-table-column>
      <el-table-column prop="price" label="商品价格" width="110"></el-table-column>
      <el-table-column prop="dealStyle" label="交易方式" width="110"></el-table-column>
      <el-table-column prop="img" label="商品宣传图">
        <template slot-scope="scope">
          <el-image style="width: 100px;height: 100px"
              :src="scope.row.img"
              :preview-src-list="productImgUrl" @click="productImgPreview(scope.row)"></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="registerChecked" width="250px" label="审核状态">
        <template slot-scope="scope" >
          <el-tag type="danger" v-if="scope.row.checked == '0'">未通过</el-tag>
          <el-tag type="primary" v-if="scope.row.checked == '1'">已通过</el-tag>
          <span style="padding-left: 10px;padding-right: 10px">|</span>
          <el-button type="success" @click="handlePass(scope.row)">通过 <i class="el-icon-check"></i></el-button>
          <el-button type="danger" @click="handleFail(scope.row)">驳回 <i class="el-icon-close"></i></el-button>
        </template>
      </el-table-column>

      <el-table-column label="操作"  width="200" align="center">
        <template slot-scope="scope">
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='取消'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
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

  </div>
</template>

<script>
import {serverIp} from "../../public/config";

export default {
  name: "role",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      productName: "",
      checked:"",
      productImgUrl: ["https://s3.bmp.ovh/imgs/2022/06/13/4617f1003dbcddf1.jpeg"],
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      pageType: "ALL",

    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/product/pageProduct", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          productName:this.productName

        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })

    },
    loadUncheck() {
      this.request.get("/product/pageUncheckProduct", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          productName:this.productName

        }
      }).then(res => {

        this.tableData = res.data.records
        this.total = res.data.total

      })

    },
    save() {
      this.request.post("/product", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    search(){
      if(this.pageType === "ALL"){
        this.load()
      }else if(this.pageType === "Uncheck"){
        this.loadUncheck()
      }
    },
    reset() {
      this.productName = ""
      if(this.pageType === "ALL"){
        this.load()
      }else if(this.pageType === "Uncheck"){
        this.loadUncheck()
      }
    },
    refresh(){
      if(this.pageType === "ALL"){
        this.load()
      }else if(this.pageType === "Uncheck"){
        this.loadUncheck()
      }
    },
    changePageType(){
      if(this.pageType === "ALL"){
        this.pageType = "Uncheck"
        this.loadUncheck()
      }else if(this.pageType === "Uncheck"){
        this.pageType = "ALL"
        this.load()
      }
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    del(row) {
      this.request.delete("/product/" + row.productId).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.refresh()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    handlePass(row){
      this.checked = "1";
      this.request.get("/product/updateCheckPass/"+row.productId).then(res => {
        if (res.code === '200') {
          this.$message.success("已通过！")
          this.refresh()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleFail(row){
      this.checked = "0";
      this.request.get("/product/updateCheckFail/"+row.productId).then(res => {
        if (res.code === '200') {
          this.$message.success("已驳回！")
          this.refresh()
        } else {
          this.$message.error("驳回失败")
        }
      })
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.productId)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/product/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.refresh()
        } else {
          this.$message.error("批量删除失败")
        }
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
    productImgPreview(row){
      this.productImgUrl = []
      this.productImgUrl.push(row.img)
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
