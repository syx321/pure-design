<template >
  <div class="wrapper">
    <!--    用户注册页  -->
    <div v-if="registerType=='ROLE_USER'" style="margin: 25px auto; background-color: rgba(242,245,213,0.73); width: 450px; height: 650px; padding: 20px; border-radius: 10px">
      <el-button style="margin-left: 310px" type="success" size="small" round @click="regTypeChange">商家注册<i class="el-icon-arrow-right el-icon--right"></i></el-button>
      <div style="margin-top: 0px;text-align: center; font-size: 24px"><b>用 户 注 册</b></div>
      <el-form  label-width="80px" :model="user" :rules="rules" ref="userForm" style="margin-right: 20px" >
        <el-form-item  label="用户名" style="margin-bottom: 8px;margin-right: 0px;" prop="username" align="center">
          <el-input placeholder="请输入用户名" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.username"></el-input>
        </el-form-item >
        <el-form-item  label="密码" style="margin-bottom: 8px;margin-right: 5px" prop="password" align="center" >
          <el-input placeholder="请输入密码" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.password"></el-input>
        </el-form-item >
        <el-form-item  label="确认密码" style="margin-bottom: 8px;margin-right: 5px" prop="password" align="center" >
          <el-input placeholder="请输入确认密码" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.confirmPassword"></el-input>
        </el-form-item >
        <el-form-item  label="手机号" style="margin-bottom: 8px;margin-right: 5px" prop="phone" align="center" >
          <el-input placeholder="请输入手机号" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.phone"></el-input>
        </el-form-item >
        <el-form-item  label="邮箱" style="margin-bottom: 8px;margin-right: 5px" prop="email" align="center" >
          <el-input placeholder="请输入邮箱" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.email"></el-input>
        </el-form-item >
        <el-form-item  label="城市" style="margin-bottom: 8px;margin-right: 5px" prop="city" align="center" >
          <el-input placeholder="请输入城市" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.city"></el-input>
        </el-form-item >
        <el-form-item  label="银行卡" style="margin-bottom: 8px;margin-right: 5px" prop="bankcard" align="center" >
          <el-input placeholder="请输入银行账号" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.bankcard"></el-input>
        </el-form-item >
        <el-form-item  label="验证码" style="margin-bottom: 15px;margin-right: 5px;text-align: center;" prop="" align="center"  >
          <el-input placeholder="请输入正确的验证码" size="small" style="margin: 5px 0;width: 224px" prefix-icon="el-icon-user" v-model="verifyCode"></el-input>
          <el-image src="http://localhost:9090/verify/getcode" style="width: 80px;height: 30px"  @click=""></el-image>
        </el-form-item >
        <el-form-item label="性别">
          <div>
            <el-radio-group v-model="user.sex" size="medium" >
              <el-radio :label="1" border>男</el-radio>
              <el-radio :label="0" border>女</el-radio>
            </el-radio-group>
          </div>
        </el-form-item>
        <el-form-item style="margin-right: 100px; text-align: right;">
          <el-button type="primary" size="small"  autocomplete="off" @click="login">点击注册</el-button>
          <el-button type="warning" size="small"  autocomplete="off" @click="$router.push('/login')">返回登录</el-button>
          <el-button style="margin-left: 210px" type="success" size="small" round @click="checkVerifyCode">验证码检测<i class="el-icon-arrow-right el-icon--right"></i></el-button>
        </el-form-item>
      </el-form>
    </div>
    <!--    商家注册页  -->
    <div  v-if="this.registerType=='ROLE_BUSINESS'" style="margin: 25px auto; background-color: rgba(212,241,241,0.73); width: 450px; height: 730px; padding: 20px; border-radius: 10px">
      <el-button style="margin-left: 310px" type="success" size="small" round @click="regTypeChange"><i class="el-icon-arrow-left el-icon--left">用户注册</i></el-button>
      <div style="margin-top: 0px; text-align: center; font-size: 24px"><b>商 家 注 册</b></div>
      <el-form  label-width="80px" :model="user" :rules="rules" ref="userForm" style="margin-right: 20px" >
        <el-form-item  label="用户名" style="margin-bottom: 8px;margin-right: 0px;" prop="username" align="center">
          <el-input placeholder="请输入用户名" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.username"></el-input>
        </el-form-item >
        <el-form-item  label="密码" style="margin-bottom: 8px;margin-right: 5px" prop="password" align="center" >
          <el-input placeholder="请输入密码" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.password"></el-input>
        </el-form-item >
        <el-form-item  label="确认密码" style="margin-bottom: 8px;margin-right: 5px" prop="password" align="center" >
          <el-input placeholder="请输入确认密码" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.confirmPassword"></el-input>
        </el-form-item >
        <el-form-item  label="手机号" style="margin-bottom: 8px;margin-right: 5px" prop="phone" align="center" >
          <el-input placeholder="请输入手机号" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.phone"></el-input>
        </el-form-item >

        <el-form-item  label="银行卡" style="margin-bottom: 8px;margin-right: 5px" prop="bankcard" align="center" >
          <el-input placeholder="请输入银行账号" size="small" style="margin: 5px 0;width: 320px" prefix-icon="el-icon-user" v-model="user.bankcard"></el-input>
        </el-form-item >
        <el-form-item label="营业执照">
          <el-upload
              class="upload-demo"
              action="https://jsonplaceholder.typicode.com/posts/"
              :on-preview="handlePreview"
              :on-remove="handleRemove"
              :before-remove="beforeRemove"
              multiple
              :limit="3"
              :on-exceed="handleExceed"
              :file-list="fileList">
            <el-button size="small" type="primary">点击上传</el-button>
            <div slot="tip" class="el-upload__tip">营业执照，只能上传jpg/png文件，且不超过500kb</div>
          </el-upload>
        </el-form-item>
        <el-form-item label="身份证件">
          <el-upload
              class="upload-demo"
              action="https://jsonplaceholder.typicode.com/posts/"
              :on-preview="handlePreview"
              :on-remove="handleRemove"
              :before-remove="beforeRemove"
              multiple
              :limit="3"
              :on-exceed="handleExceed"
              :file-list="fileList">
            <el-button size="small" type="primary">点击上传</el-button>
            <div slot="tip" class="el-upload__tip">身份证正面照，只能上传jpg/png文件，且不超过500kb</div>
          </el-upload>
        </el-form-item>
        <el-form-item  label="验证码" style="margin-bottom: 5px;margin-right: 5px;text-align: center;" prop="" align="center"  >
          <el-input placeholder="请输入正确的验证码" size="small" style="margin: 5px 0;width: 220px" prefix-icon="el-icon-user" v-model="verifyCode"></el-input>
          <el-image src="http://localhost:9090/verify/getcode" style="width: 70px;height: 30px;margin-left: 10px; "  @click=""></el-image>
        </el-form-item >
        <el-form-item label="性别">
          <div>
            <el-radio-group v-model="user.sex" size="medium" >
              <el-radio :label="1" border>男</el-radio>
              <el-radio :label="0" border>女</el-radio>
            </el-radio-group>
          </div>
        </el-form-item>
        <el-form-item style="margin-right: 100px; text-align: right;">
          <el-button type="primary" size="small"  autocomplete="off" @click="login">点击注册</el-button>
          <el-button type="warning" size="small"  autocomplete="off" @click="$router.push('/login')">返回登录</el-button>
          <el-button style="margin-left: 210px" type="success" size="small" round @click="checkVerifyCode">验证码检测<i class="el-icon-arrow-right el-icon--right"></i></el-button>
        </el-form-item>
      </el-form>
    </div>

  </div>
</template>

<script>
import request from "@/utils/request";
import axios from "axios";

export default {
  name: "Login",
  data() {
    return {
      user: {
        username:"",
        password:"",
        confirmPassword:"",
        phone:"",
        email:"",
        city:"",
        sex:"",
        role:"",
        bankcard:"",
      },
      buss: {
        username:"",
        password:"",
        phone:"",
        email:"",
        city:"",
        sex:"",
        role:"",
        bankcard:"",
        idcard:"",
        license:"",
      },
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '请输入手机号', trigger: 'blur' },
          { min: 1, max: 11, message: '长度在 1 到 11 个字符', trigger: 'blur' }
        ],
        bankcard: [
          { required: true, message: '请输入手机号', trigger: 'blur' },
          { min: 1, max: 18, message: '长度在 1 到 18 个字符', trigger: 'blur' }
        ],
      },
      registerType:"ROLE_USER",
      verifyCode:"111",
      verifyCheck:"",
      verifyPicture:"http://localhost:9090/verify/getcode",

    }
  },
  methods: {
    login() {
      this.user.role = this.registerType
      this.$refs['userForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          if (this.user.password !== this.user.confirmPassword) {
            this.$message.error("两次输入的密码不一致")
            return false
          }

          this.request.post("/person/register",this.user).then(res => {
            if(res.code === '200') {
              this.$message.success("注册成功")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    },
    regTypeChange(){
      if(this.registerType == "ROLE_USER"){
        this.registerType = "ROLE_BUSINESS"
        this.user.role = this.registerType
      }else {
        this.registerType = "ROLE_USER"
        this.user.role = this.registerType
      }
    },
    getVerifyPicture(){
      axios.get("http://localhost:9090/verify/getcode").then(res =>{
        console.log(res.data)
      })
    },
    checkVerifyCode(){
      // request.get("http://localhost:9090/verify/checkcode?validateCode=hjz1").then(res =>{
      // })
      // request.get("http://localhost:9090/verify/checkcode?validateCode=hjz1")
      // this.getVerifyPicture()
      console.log(document.cookie.length )
      this.request.post("/verify/checkcode",this.verifyCode).then(res => {
            console.log(res)
          }
      )
      // axios.get("http://localhost:9090/verify/checkcode")
    }
  }
}
</script>

<style>
  .wrapper {
    height: 100vh;
    background-image: linear-gradient(to bottom right, #FC466B , #3F5EFB);
    overflow: hidden;
  }
</style>
