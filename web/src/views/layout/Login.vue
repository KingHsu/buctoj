<template>
  <div class="loginBody">
    <div class="loginDiv">
      <div class="login-content">
        <h1 class="login-title">用户登录</h1>
        <el-form :model="loginForm" label-width="100px" :rules="rules" ref="loginForm">
          <el-form-item label="账号" prop="stuUsername">
            <el-input style="width: 200px" type="text" v-model="loginForm.stuUsername" autocomplete="off" size="small"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="stuPassword">
            <el-input style="width: 200px" type="password" v-model="loginForm.stuPassword" show-password autocomplete="off" size="small" @keyup.enter.native="confirm"></el-input>
          </el-form-item>
          <el-form-item label="验证码" prop="captcha">
            <el-input style="width: 100px" type="text" v-model="loginForm.captcha" autocomplete="off" size="small"></el-input>
            <img :src="captchaImage" @click="refreshCaptcha" alt="Captcha" style="cursor: pointer; margin-left: 10px;">
          </el-form-item>
          <el-form-item>
            <el-button style="margin-left: 50px" type="primary" @click="confirm" :disabled="confirm_disabled">确定</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import { Message } from 'element-ui'

export default {
  name: 'LoginIndex',
  data () {
    return {
      confirm_disabled: false,
      captchaImage: '',
      loginForm: {
        stuUsername: '',
        stuPassword: '',
        captcha: ''
      },
      rules: {
        stuUsername: [
          { required: true, message: '请输入账号', trigger: 'blur' }
        ],
        stuPassword: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ],
        captcha: [
          { required: true, message: '请输入验证码', trigger: 'blur' }
        ]
      }
    }
  },
  mounted () {
    this.refreshCaptcha()
  },
  methods: {
    refreshCaptcha () {
      this.$axios.get(this.$httpUrl + '/student/captcha', {
        Headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
      }).then(response => {
        if (response.data.code === 200) {
          this.captchaImage = response.data.data.captchaImage
        } else {
          Message.error('获取验证码失败')
        }
      })
    },
    confirm () {
      this.confirm_disabled = true
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          // 去后台验证用户名密码
          this.$axios.post(this.$httpUrl + '/student/login', this.loginForm).then(res => {
            if (res.data.code === 200) {
              // 登录成功，更新状态
              Message({
                message: '登录成功',
                type: 'success'
              })
              this.$emit('login-success')
              this.$router.replace('/OjHome')
            } else {
              this.confirm_disabled = false
              Message.error('校验失败，用户名或密码错误或验证码错误！')
              this.refreshCaptcha() // 重新刷新验证码
            }
          }).catch(() => {
            this.confirm_disabled = false
            Message.error('登录失败')
            this.refreshCaptcha() // 重新刷新验证码
          })
        } else {
          this.confirm_disabled = false
          console.log('校验失败')
        }
      })
    }
  }
}
</script>

<style scoped>
  .loginBody {
    position: absolute;
    width: 100%;
    height: 100%;
    background-color: #c5d7ef;
  }
  .loginDiv {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -200px;
    margin-left: -250px;
    width: 450px;
    height: 330px;
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
