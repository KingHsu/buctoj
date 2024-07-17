<template>
  <div class="loginBody">
      <div class="loginDiv">
          <div class="login-content">
              <h1 class="login-title">用户注册</h1>
              <el-form :model="registerForm" label-width="100px"
                       :rules="rules" ref="loginForm">
                  <el-form-item label="用户名" prop="stuUsername">
                      <el-input
                        style="width: 200px"
                        type="text"
                        v-model="registerForm.stuUsername"
                        autocomplete="off"
                        size="small">
                      </el-input>
                  </el-form-item>
                  <el-form-item label="密码" prop="stuPassword">
                      <el-input
                        style="width: 200px"
                        type="password"
                        v-model="registerForm.stuPassword"
                        show-password
                        autocomplete="off"
                        size="small">
                      </el-input>
                  </el-form-item>
                  <el-form-item label="确认密码" prop="confirmpw">
                    <el-input style="width: 200px" type="password" v-model="registerForm.confirmpw"
                              show-password autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="班级" prop="stuClass">
                    <el-input style="width: 200px" type="text" v-model="registerForm.stuClass"
                              placeholder="请输入2位的专业名+4位数字的班级代号" autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item label="学号" prop="stuNum">
                  <el-input style="width: 200px" type="text" v-model="registerForm.stuNum"
                             autocomplete="off" size="small" placeholder="请输入10位数字的学号"></el-input>
                  </el-form-item>
                  <el-form-item label="姓名" prop="stuName">
                    <el-input style="width: 200px" type="text" v-model="registerForm.stuName"
                               autocomplete="off" size="small" ></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-button style="margin-left: 10px" type="primary" @click="confirm" :disabled="confirm_disabled">注册</el-button>
                      <el-button @click="goIndex">返回首页</el-button>
                  </el-form-item>
              </el-form>
          </div>
      </div>
  </div>
</template>

<script>
import { Message } from 'element-ui'
export default {
  name: 'RegisterIndex',
  data () {
    const checkPasswdRe = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.registerForm.stuPassword) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    // 正则校验主要是这部分：/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[._~!@#$^&*])[A-Za-z0-9._~!@#$^&*]{8,16}$
    // 其中特殊字符包括：._~!@#$^&*  （比较常见）
    const newValValidate = (rule, value, callback) => {
      if (/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[._~!@#$^&*])[A-Za-z0-9._~!@#$^&*]{8,16}$/g.test(value)) {
        callback()
      } else {
        callback(new Error('请输入包含英文字母大小写、数字和特殊符号的 8-16 位组合'))
      }
    }
    const classValidate = (rule, value, callback) => {
      if (/^\D{2}\d{4}$/.test(value)) {
        callback()
      } else {
        callback(new Error('请输入2位的专业名+4位数字的班级代号'))
      }
    }
    const stuNumValidate = (rule, value, callback) => {
      if (/^\d{10}$/.test(value)) {
        callback()
      } else {
        callback(new Error('请输入10位数字的学号'))
      }
    }
    return {
      confirm_disabled: false,
      confirmpw: '',
      registerForm: {
        stuUsername: '',
        stuPassword: '',
        stuClass: '',
        stuName: '',
        stuNum: '',
        stuNo: '',
        stuMan: '0'
      },
      rules: {
        stuUsername: [
          { required: true, message: '请输入用户名', trigger: 'blur' }
        ],
        stuPassword: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          {
            min: 8,
            max: 16,
            message: '长度应在 8 到 16 个字符',
            trigger: 'blur'
          },
          { validator: newValValidate, trigger: 'blur' }
        ],
        confirmpw: [
          { required: true, message: '请确认密码', trigger: 'blur' },
          { validator: checkPasswdRe, trigger: 'blur' }
        ],
        stuClass: [
          { required: true, message: '请输入班级', trigger: 'blur' },
          { validator: classValidate, trigger: 'blur' }
        ],
        stuNum: [
          { required: true, message: '请输入学号', trigger: 'blur' },
          { validator: stuNumValidate, trigger: 'blur' }
        ],
        stuName: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    confirm () {
      if (!this.registerForm.stuUsername &&
        !this.registerForm.stuPassword &&
        !this.registerForm.stuName &&
        !this.registerForm.stuNum &&
        !this.registerForm.stuClass &&
        !this.confirmpw
      ) {
        Message({
          message: '请输入完整信息后再尝试注册！',
          type: 'warning'
        })
        return
      }
      this.confirm_disabled = true
      this.$axios.post(this.$httpUrl + '/student/register', this.registerForm)
      Message({
        message: '注册成功！',
        type: 'success'
      })
      setTimeout(() => {
        this.$router.replace({
          path: '/LoginIndex'
        })
      }, 1000)
    },
    goIndex () {
      this.$router.replace('/OjHome')
    }
  }

}
</script>

<style scoped>
  .loginBody {
      position: absolute;
      width: 100%;
      height: 100%;
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
      top: 35%;
      left: 50%;
      margin-top: -200px;
      margin-left: -250px;
      width: 450px;
      height: 600px;
      background-color: #fff;
      border-radius: 5%;
      opacity: 0.80;
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
      font-family: "YouYuan";

  }
  .el-form-item {
    margin: 30px 0px;
  }
</style>
