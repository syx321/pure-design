<template>
  <div>
    <div style="margin: 10px 0">
      <el-carousel height="450px" :interval="5000">
        <el-carousel-item v-for="item in imgs" :key="item">
          <img :src="item" alt="" style="width: 100%">
        </el-carousel-item>
      </el-carousel>
    </div>

    <div style="margin: 10px 0">
      <el-input style="width:360px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
      <el-button class="ml-5" @click="search">搜索</el-button>
      <el-button class="ml-5" @click="reset">重置</el-button>
      <span style="padding-left: 285px;padding-right: 20px;font-size: 18px"></span>
      <el-button class="ml-5" type="primary" @click="sortByPrice">价格</el-button>
      <el-button class="ml-5" type="primary" @click="sortByGoodRate">好评度</el-button>
      <el-button class="ml-5" type="primary" @click="sortBySalesVolume">销量</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-row :gutter="10">
        <el-col :span="6" v-for="item in tableData" :key="item.productId" style="margin-bottom: 10px">

          <div style="border: 1px solid #ccc; padding-bottom: 10px">
            <img :src="item.img" alt="" style="width: 100%">
            <div style="color: #666; padding: 10px">
              <span style="padding-right: 15px">{{ item.name }}</span>
              <el-tag type="primary">{{ item.sort }}</el-tag>
            </div>
            <div style="color: #666; padding: 10px">
              <span>尺寸: {{ item.size }}</span>
              <span style="padding-left: 15px">价格: ¥ {{ item.price }}</span>
            </div>
            <div style="color: #666; padding: 10px">
              <span>评分: {{ item.score }}</span>
              <span style="padding-left: 15px">购买人数: {{ item.purchaseNum }}</span>
            </div>
            <div style="padding: 10px">
              <el-button type="success" @click="purchase(item)">购买</el-button>
              <el-button type="info">加入购物车</el-button>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
export default {
  name: "FrontHome",
  data() {
    return {
      tableData: [],
      total:0,
      imgs: [
          'https://img30.360buyimg.com/babel/s1580x830_jfs/t1/109361/24/22897/74054/621ede58E099d37e3/f12730c81df6046a.jpg!cc_1580x830.webp',
          'https://img13.360buyimg.com/babel/s1580x830_jfs/t1/96398/30/23715/70228/6221e9d0Ec1b9fe65/f66e2ad76314d6cd.jpg!cc_1580x830.webp'
      ],
      product:{
        productId:0,
        name:"",
        price:0,
        img:"",
        size:0,
        sort:"",
        purchaseNum:0,
        score:0,
        favorableRate:0,
      },
      name:""
    }
  },
  created() {
    this.load();
  },
  methods: {
    load(){
      this.request.get("/product").then(res => {
        this.tableData = res.data
      })
    },
    purchase(product){
      this.request.get("/person/" + localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).userId : 1).then(res => {
        if (res.code === '200') {
          this.$confirm(res.data.shoppingPoints + '积分将优惠' + parseInt(res.data.shoppingPoints / 100) + '元', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            this.request.get("/product/purchase", {
              params: {
                productId: product.productId,
                userId: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).userId : 1,
                count: 1
              }
            }).then(res => {
              if (res.code === '200') {
                this.$message.success('购买成功')
                this.load();
              } else {
                this.$message.error("余额不足，购买失败")
              }
            })
          }).catch(() => {
            //取消什么都不做
          });
        }
      })
    },
    search() {
      console.log(name)
      this.request.get("/product/search", {
        params: {
          name: this.name
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.data.data
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    sortByPrice() {
      this.tableData.sort(function (a, b){
        return b.price - a.price
      })
    },
    sortByGoodRate() {
      this.tableData.sort(function (a, b){
        return b.favorableRate - a.favorableRate
      })
    },
    sortBySalesVolume() {
      this.tableData.sort(function (a, b){
        return b.purchaseNum - a.purchaseNum
      })
      console.log(this.tableData)
    }

  }
}
</script>

<style>

</style>
