<template>
  <div>
    <el-menu class="el-menu-demo" mode="horizontal" @select="handleSelect" router="true">
      <el-menu-item route="/OjHome" index="1" >首页</el-menu-item>
      <el-menu-item route="/UserList" index="2" >用户列表</el-menu-item>
      <el-submenu index="3">
        <template slot="title">codeforces</template>
        <el-menu-item route="/CodeforcesList" index="3-1">比赛列表</el-menu-item>
        <el-menu-item route="/CodeforcesRank" index="3-2">账户排名</el-menu-item>
      </el-submenu>
      <el-submenu index="4">
        <template slot="title">atcoder</template>
        <el-menu-item route="/AtcoderList" index="4-1">比赛列表</el-menu-item>
        <el-menu-item route="/AtcoderRank" index="4-2">账户排名</el-menu-item>
      </el-submenu>
      <el-submenu index="5">
        <template slot="title">图表</template>
        <el-menu-item route="/EchartOne" index="5-1">图表1</el-menu-item>
        <el-menu-item route="/EchartTwo" index="5-2">图表2</el-menu-item>
        <el-menu-item route="/EchartThree" index="5-3">图表3</el-menu-item>
      </el-submenu>
      <el-menu-item index="6" v-if="!isLoggedIn" @click="login">登录</el-menu-item>
      <el-menu-item index="6" v-else @click="logout">
        <!-- 使用img标签插入默认头像，并设置点击事件 -->
        <img src="/img/tx.png" alt="User Avatar" @click.stop="logout" class="avatar">
        退出登录
      </el-menu-item>
      <el-menu-item route="/RegisterIndex" index="7" v-if="!isLoggedIn">注册</el-menu-item>
    </el-menu>
    <router-view @login-success="setLoginStatus"></router-view>
  </div>
</template>

<script>
export default {
  name: 'LayoutIndex',
  data () {
    return {
      activeIndex: '1',
      isLoggedIn: false // 用于跟踪用户登录状态
    }
  },
  methods: {
    handleSelect (key, keyPath) {
      console.log(key, keyPath)
    },
    logout () {
      // 这里添加退出登录的逻辑
      // 例如清除本地存储的用户信息，跳转到登录页面等
      this.isLoggedIn = false
      this.$router.replace('/OjHome')
    },
    login () {
      this.$router.replace('/LoginIndex')
    },
    setLoginStatus () {
      this.isLoggedIn = true
    }
  }
}
</script>

<style scoped>
.avatar {
  width: 40px; /* 根据需要调整头像大小 */
  height: 40px;
  border-radius: 50%; /* 圆形头像 */
  cursor: pointer; /* 鼠标悬停时显示手型图标 */
  vertical-align: middle; /* 垂直居中 */
  margin-right: 5px; /* 与文本保持一定间距 */
}
</style>
