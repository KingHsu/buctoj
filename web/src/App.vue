<template>
  <div id="app">
    <div class="footer_wrap">
        <a href="#/OjIndex">首页</a>
        <a href="#/OjUserList">用户列表</a>
        <a href="#/OjCodeforces">Codeforces</a>
        <a href="#/OjAtcoder">Atcoder</a>
        <a href="#/OjCharts">图表</a>
        <a href="#/OjSign">登录</a>
        <a href="#/OjRegister">注册</a>
    </div>
    <div class="top">
      <router-view></router-view>
    </div>
  </div>
  
</template>

<script>



export default {
  name: 'App',
  
}
</script>

<style scoped>
  body {
    margin: 0;
    padding: 0;
  }
  .footer_wrap {
    position: relative;
    left: 0;
    top: 0;
    display: flex;
    width: 100%;
    text-align: center;
    background-color: #333;
    color: #ccc;
  }
  .footer_wrap a {
    flex: 1;
    text-decoration: none;
    padding: 20px 0;
    line-height: 20px;
    background-color: #333;
    color: #ccc;
    border: 1px solid black;
  }
  .footer_wrap a:hover {
    background-color: #555;
  }
</style>
