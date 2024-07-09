<template>
    <div>
      <div class="footer_wrap">
          <router-link to="/OjIndex">首页</router-link>
          <router-link to="/OjUserList">用户列表</router-link>
          <router-link to="/OjCodeforces">Codeforces</router-link>
          <router-link to="/OjAtcoder">Atcoder</router-link>
          <router-link to="/Ojcharts">图表</router-link>
          <router-link to="/OjSign">登录</router-link>
          <router-link to="/OjRegister">注册</router-link>
      </div>
      <div>
        <router-view></router-view>
      </div>
    </div>
    
</template>
  
<script>
  export default {
    name: 'LayoutPage',
    
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
.footer_wrap a.router-link-active {
    background-color: purple;
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
  