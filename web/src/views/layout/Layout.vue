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
      <el-menu-item route="/LoginIndex" index="6">登录</el-menu-item>
      <el-menu-item route="/RegisterIndex" index="7">注册</el-menu-item>
    </el-menu>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'LayoutIndex',
  data () {
    return {
      activeIndex: '1'
    }
  },
  methods: {
    handleSelect (key, keyPath) {
      console.log(key, keyPath)
    }
  }
}
</script>

<style scoped>

</style>
