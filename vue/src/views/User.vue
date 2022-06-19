<template>
  <!--  用户后台管理页面-->
  <!--  用户后台管理页面-->
  <!--  用户后台管理页面-->
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="username"></el-input>
      <el-input style="width: 200px" placeholder="请输入邮箱" suffix-icon="el-icon-message" class="ml-5" v-model="email"></el-input>
      <el-input style="width: 200px" placeholder="请输入地址" suffix-icon="el-icon-position" class="ml-5" v-model="address"></el-input>
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
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="userId" label="ID" width="80"></el-table-column>
      <el-table-column prop="username" label="用户名" width="140"></el-table-column>
      <el-table-column prop="role" label="角色">
        <template slot-scope="scope">
          <el-tag type="danger" v-if="scope.row.role === 'ROLE_ADMIN'">管理员</el-tag>
          <el-tag type="primary" v-if="scope.row.role === 'ROLE_USER'">用户</el-tag>
          <el-tag type="success" v-if="scope.row.role === 'ROLE_BUSINESS'">商家</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="phone" label="电话"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column prop="address" label="收货地址"></el-table-column>
      <el-table-column prop="registerChecked" width="250px" label="审核状态">
        <template slot-scope="scope" >
          <el-tag type="danger" v-if="scope.row.registerChecked === false">未通过</el-tag>
          <el-tag type="primary" v-if="scope.row.registerChecked === true">已通过</el-tag>
          <span style="padding-left: 10px;padding-right: 10px">|</span>
          <el-button type="success" @click="handlePass(scope.row)">通过 <i class="el-icon-check"></i></el-button>
          <el-button type="danger" @click="handleFail(scope.row)">驳回 <i class="el-icon-close"></i></el-button>
        </template>
      </el-table-column>

      <el-table-column label="操作"  width="200" align="center">
        <template slot-scope="scope">
          <el-button type="primary" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='取消'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
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

    <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%" >
      <el-form label-width="80px" size="small">
        <el-form-item label="用户名">
          <el-input v-model="form.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址">
          <el-input v-model="form.address" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="课程信息" :visible.sync="vis" width="30%" >
      <el-table :data="courses" border stripe>
        <el-table-column prop="name" label="课程名称"></el-table-column>
        <el-table-column prop="score" label="学分"></el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog title="课程信息" :visible.sync="stuVis" width="30%" >
      <el-table :data="stuCourses" border stripe>
        <el-table-column prop="name" label="课程名称"></el-table-column>
        <el-table-column prop="score" label="学分"></el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
import {serverIp} from "../../public/config";

export default {
  name: "User",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      username: "",
      email: "",
      address: "",
      role:"",
      registerChecked:"",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      roles: ['ROLE_USER','ROLE_BUSINESS'],
      courses: [],
      vis: false,
      stuCourses: [],
      stuVis: false,
      pageType:"ALL"
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/person/pageUser", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          email: this.email,
          address: this.address,
        }
      }).then(res => {

        this.tableData = res.data.records
        this.total = res.data.total
      })

    },
    loadUncheck() {
      this.request.get("/person/pageUncheckUser", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          email: this.email,
          address: this.address,
        }
      }).then(res => {

        this.tableData = res.data.records
        this.total = res.data.total

      })

    },
    save() {
      this.request.post("/person", this.form).then(res => {
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
      this.username = ""
      this.email = ""
      this.address = ""
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
    del(id) {
      this.request.delete("/person/" + id).then(res => {
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
      this.registerChecked = true;
      this.request.get("/person/updateCheckPass/"+row.userId).then(res => {
        if (res.code === '200') {
          this.$message.success("已通过！")
          this.refresh()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleFail(row){
      this.registerChecked = false;
      this.request.get("/person/updateCheckFail/"+row.userId).then(res => {
        if (res.code === '200') {
          this.$message.success("已驳回！")
          this.refresh()
        } else {
          this.$message.error("驳回失败")
        }
      })
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.userId)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/person/del/batch", ids).then(res => {
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
    exp() {
      window.open(`http://${serverIp}:9090/user/export`)
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
