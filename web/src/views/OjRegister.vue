<template>
  <div class="loginBody">
      <div class="loginDiv">
          <div class="login-content">
              <h1 class="login-title">用户注册</h1>
              <el-form :model="loginForm" label-width="100px"
                       :rules="rules" ref="loginForm">
                  <el-form-item label="用户名" prop="no">
                      <el-input style="width: 200px" type="text" v-model="registerForm.no"
                                autocomplete="off" size="small"></el-input>
                  </el-form-item>
                  <el-form-item label="密码" prop="password">
                      <el-input style="width: 200px" type="password" v-model="registerForm.password"
                                show-password autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="确认密码" prop="confirmpw">
                    <el-input style="width: 200px" type="password" v-model="registerForm.confirmpw"
                              show-password autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="班级" prop="class">
                    <el-input style="width: 200px" type="text" v-model="registerForm.class"
                              placeholder="请输入4位数字" autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="学号" prop="stuno">
                  <el-input style="width: 200px" type="text" v-model="registerForm.stuno"
                             autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="姓名" prop="name">
                    <el-input style="width: 200px" type="text" v-model="registerForm.name"
                               autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-button type="primary" @click="confirm" :disabled="confirm_disabled">提交</el-button>
                  </el-form-item>
              </el-form>
          </div>
      </div>
  </div>
</template>


<script>
  export default {
      name: "OjSign",
      data(){
          return{
              confirm_disabled:false,
              registerForm:{
                  no:'',
                  password:'',
                  confirmpw:'',
                  class:'',
                  stuno:'',
                  name:''
              },
              rules:{
                  no: [
                      { required: true, message: '请输入用户名', trigger: 'blur' }
                  ],
                  password: [
                      { required: true, message: '请输入密码', trigger: 'blur' }
                  ],
                  confirmpw: [
                      { required: true, message: '请确认密码', trigger: 'blur' }
                  ],
                  class: [
                      { required: true, message: '请输入班级', trigger: 'blur' }
                  ],
                  stuno: [
                      { required: true, message: '请输入学号', trigger: 'blur' }
                  ],
                  name: [
                      { required: true, message: '请输入姓名', trigger: 'blur' }
                  ],
              }
          }
      },
      methods:{
          confirm(){
              this.confirm_disabled=true;
              if(this.registerForm.password !== this.registerForm.confirmpw) {
                alert('两次输入密码不一致，请重新输入！'),
                this.registerForm.confirmpw = ''
              } else {
                this.$axios.register('student/register', {
                  username: this.registForm.username,
                  password: this.registForm.password,
                  class: this.registerForm.class,
                  stuno: this.registerForm.stuno,
                  name: this.registerForm.name
                }),
                setTimeout(() => {
                  this.$router.replace({
                    path: '/OjSign'
                  });
                }, 3000);
              }
              
              
      },
    }

}
</script>

<style scoped>
  .loginBody {
      position: absolute;
      width: 100%;
      height: 100%;
      background-color: #B3C0D1;
  }
  .loginDiv {
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -200px;
      margin-left: -250px;
      width: 450px;
      height: 550px;
      background: #fff;
      border-radius: 5%;

  }
  .login-title {
      margin: 20px 0;
      text-align: center;
  }
  .login-content {
      width: 400px;
      height: 250px;
      position: absolute;
      top: 25px;
      left: 25px;
  }
</style>