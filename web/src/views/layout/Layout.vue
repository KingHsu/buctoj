<template>
  <div class="main">
    <div v-if="!$route.meta.showNav">
      <el-menu
        class="menu"
        mode="horizontal"
        @select="handleSelect"
        router="true"
      >
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
          <el-menu-item route="/CodeforcesChart" index="5-1">用户参加比赛数占比图(codeforces)</el-menu-item>
          <el-menu-item route="/AtcoderChart" index="5-2">用户参加比赛数占比图(atcoder)</el-menu-item>
          <el-menu-item route="/StuChart" index="5-3">学生新旧积分对比条形图</el-menu-item>
          <el-menu-item route="/ClassChart" index="5-4">班级积分综合对比柱状图</el-menu-item>
        </el-submenu>
        <el-menu-item index="6" v-if="!getLogState" @click="login" style="float: right">登录</el-menu-item>
        <el-menu-item index="6" v-else route="/UserInfo" style="float: right">
          <div>
            <!-- 使用img标签插入默认头像，并设置点击事件 -->
            <img src="/img/tx.png" alt="User Avatar" class="avatar"/>
            {{ userName }}
          </div>
        </el-menu-item>
        <el-menu-item route="/RegisterIndex" index="7" v-if="!getLogState" style="float: right">注册</el-menu-item>
      </el-menu>
    </div>
    <router-view @login-success="setLoginStatus"></router-view>
  </div>
</template>

<script>
import { Message } from 'element-ui'
import { mapGetters } from 'vuex'
export default {
  name: 'LayoutIndex',
  data () {
    return {
      activeIndex: '1',
      isLoggedIn: false,
      userName: ''
    }
  },
  computed: {
    ...mapGetters('setting', ['getLogState'])
  },
  methods: {
    handleSelect (key, keyPath) {
      console.log(key, keyPath)
    },
    logout () {
      // 这里添加退出登录的逻辑
      // 例如清除本地存储的用户信息，跳转到登录页面等
      this.$store.dispatch('setting/logout')// 修改vuex里的登录状态
      this.isLoggedIn = this.$store.getters['setting/getLogState']
      console.log(this.isLoggedIn)
      Message({
        message: '已退出登录！',
        type: 'warning'
      })
      this.$router.replace('/OjHome')
    },
    login () {
      if (this.$store.getters['user/getUserInfo']) { this.userName = this.$store.getters['user/getUserInfo'].stuUsername }
      this.$router.replace('/LoginIndex')
    },
    setLoginStatus () {
      this.isLoggedIn = true
      this.id = 1
    },
    update () {
      this.isLoggedIn = this.$store.getters['setting/getLogState']
      this.userName = this.$store.getters['user/getUserInfo'].stuUsername
      // console.log('用户名：' + this.userName)
    }
  },
  mounted () {
    this.update()
  },
  updated () {
    this.update()
  }
}
</script>

<style scoped>
.el-menu-item, .el-submenu {
  font-size: 14px;
  font-weight: 700;
  font-family: "Microsoft YaHei";
}

.avatar {
  width: 40px; /* 根据需要调整头像大小 */
  height: 40px;
  border-radius: 50%; /* 圆形头像 */
  cursor: pointer; /* 鼠标悬停时显示手型图标 */
  vertical-align: middle; /* 垂直居中 */
  margin-right: 5px; /* 与文本保持一定间距 */
}
</style>
