<template>
  <div class="loginBody">
      <div class="loginDiv">
          <div class="login-content">
              <h1 class="login-title">用户登录</h1>
              <el-form :model="loginForm"
                       :rules="rules" ref="loginForm"
                       label-width="50px">
                  <el-form-item prop="no">
                      <el-input
                        style="width: 300px"
                        type="text"
                        v-model="loginForm.stuUsername"
                        autocomplete="off"
                        size="small"
                        prefix-icon="el-icon-user">
                      </el-input>
                  </el-form-item>
                  <el-form-item prop="password">
                    <el-input
                    style="width: 300px"
                    type="password"
                    v-model="loginForm.stuPassword"
                    show-password
                    autocomplete="off"
                    size="small"
                    @keyup.enter.native="confirm"
                    prefix-icon="el-icon-lock">
                    </el-input>
                  </el-form-item>
                  <el-form-item prop="captcha" style="display:inline-flex">
                    <el-input
                      style="width: 150px;"
                      type="text"
                      v-model="loginForm.captcha"
                      autocomplete="off"
                      size="small"
                      prefix-icon="el-icon-key">
                    </el-input>
                    <img :src="captchaImage" @click="refreshCaptcha" alt="Captcha"
                      style="cursor: pointer; margin-left: 10px;height: 40px;width:125px;">
                  </el-form-item>
                  <el-form-item>
                      <el-button style="margin-left: 115px"
                        type="primary"
                        @click="confirm"
                        :disabled="confirm_disabled">
                        登 录
                      </el-button>
                      <!-- <el-button @click="goIndex">返回首页</el-button> -->
                  </el-form-item>
              </el-form>
              <div>
                <el-button round @click="goRegister" class="linkButton">没有账户？点击注册</el-button>
              </div>
          </div>
      </div>
  </div>
</template>

<script>
// import request from '@/utils/request'
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
          { required: true, message: '请输密码', trigger: 'blur' }
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
        if (valid) { // valid成功为true，失败为false
          // 去后台验证用户名密码
          this.$axios.post(this.$httpUrl + '/student/login', this.loginForm).then(res => res.data).then(res => {
            console.log(res)
            if (res.code === 200) {
              // 登录成功，更新状态
              // 触发事件，通知 LayoutIndex 组件更新状态
              this.$store.commit('setting/login')// 更新登录状态
              this.$store.commit('setting/setAdmin', res.data)// 更新身份信息
              this.$store.commit('user/setUserInfo', res.data)// 保存用户信息
              Message({
                message: '登录成功',
                type: 'success'
              })
              this.$emit('login-success')// 触发父组件Layout，改变其isLoggedIn
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
          return false
        }
      })
    },
    goIndex () {
      this.$router.replace('/OjHome')
    },
    goRegister () {
      this.$router.replace('RegisterIndex')
    }
  }
}
</script>

<style scoped>
  .loginBody {
    width: 100%;
    height: 100%;
    position: fixed;
    background-size: 100% 100%;
    background-image: url("../../assets/background.png");
    background-position: center center;
    /* 背景图不平铺 */
    background-repeat: no-repeat;
    /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
    background-attachment: fixed;
    /* 让背景图基于容器大小伸缩 */
    background-size: cover;
  }
  .loginDiv {
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -200px;
      margin-left: -250px;
      width: 450px;
      height: 400px;
      background-color: #fff;
      border-radius: 5%;
      opacity: 0.80;
  }
  .login-title {
      margin: 20px 0;
      text-align: center;
  }
  .login-content {
    font-family: "YouYuan";
    width: 400px;
    height: 250px;
    position: absolute;
    top: 25px;
    left: 25px;
  }
  .linkButton {
    margin: 0px 0px 0px 250px;
    line-height: 5px;
    font-size: 12px;
    vertical-align: middle;
  }
</style>
