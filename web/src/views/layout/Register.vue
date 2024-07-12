<template>
  <div class="loginBody">
      <div class="loginDiv">
          <div class="login-content">
              <h1 class="login-title">用户注册</h1>
              <el-form :model="loginForm" label-width="100px"
                       :rules="rules" ref="loginForm">
                  <el-form-item label="用户名" prop="stuUsername">
                      <el-input style="width: 200px" type="text" v-model="registerForm.stuUsername"
                                autocomplete="off" size="small"></el-input>
                  </el-form-item>
                  <el-form-item label="密码" prop="stuPassword">
                      <el-input style="width: 200px" type="password" v-model="registerForm.stuPassword"
                                show-password autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="确认密码" prop="confirmpw">
                    <el-input style="width: 200px" type="password" v-model="registerForm.confirmpw"
                              show-password autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="班级" prop="stuClass">
                    <el-input style="width: 200px" type="text" v-model="registerForm.stuClass"
                              placeholder="请输入4位数字" autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="学号" prop="stuNum">
                  <el-input style="width: 200px" type="text" v-model="registerForm.stuNum"
                             autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="姓名" prop="stuName">
                    <el-input style="width: 200px" type="text" v-model="registerForm.stuName"
                               autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-button style="margin-left: 50px" type="primary" @click="confirm()" :disabled="confirm_disabled">提交</el-button>
                  </el-form-item>
              </el-form>
          </div>
      </div>
  </div>
</template>

<script>
export default {
  name: 'RegisterIndex',
  data () {
    return {
      confirm_disabled: false,
      confirmpw: '',
      registerForm: {
        stuUsername: '',
        stuPassword: '',
        stuClass: '',
        stuName: '',
        stuNum: '',
        stuNo: ''
      },
      rules: {
        stuUsername: [
          { required: true, message: '请输入用户名', trigger: 'blur' }
        ],
        stuPassword: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ],
        confirmpw: [
          { required: true, message: '请确认密码', trigger: 'blur' }
        ],
        stuClass: [
          { required: true, message: '请输入班级', trigger: 'blur' }
        ],
        stuNum: [
          { required: true, message: '请输入学号', trigger: 'blur' }
        ],
        stuName: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    confirm () {
      this.confirm_disabled = true
      //   if(this.registerForm.stuPassword !== this.registerForm.confirmpw) {
      //     alert('两次输入密码不一致，请重新输入！'),
      //     this.registerForm.confirmpw = ''
      //   } else {
      this.$axios.post(this.$httpUrl + '/student/register', this.registerForm)
      setTimeout(() => {
        this.$router.replace({
          path: '/LoginIndex'
        })
      }, 1000)
      //   }
    }
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
