<template>
    <!-- 头部导航  -->
    <div class="header wrapper">
        <!-- logo -->
        <div class="logo">
          <h1>
            <a href="#">BuctOJ</a>
          </h1>
          <h1>BUCTOJ</h1>
        </div>
        <!-- 导航 -->
        <div class="nav">
          <ul>
            <li><a href="#">首页</a></li>
            <li><a href="#">用户列表</a></li>
            <li><a href="#">Codeforces</a></li>
            <li><a href="#">Accoder</a></li>
            <li><a href="#">图表</a></li>
            <li><a href="#">智能训练</a></li>
            <li><a href="#">更新信息</a></li>
            <li><a href="#">登录</a></li>
            <li><a href="#">注册</a></li>
          </ul>
        </div>
      </div>
  </template>
  
  <script>
  export default {
  
  }
  </script>
  
  <style scoped>
  .header {
    display: flex;
    margin: 22px auto;
    border-bottom: 0.25px solid rgb(0, 0, 0);
  }
  .header .logo {
    display: flex;
    margin-right: 40px;
    width: 200px;
    height: 88px;
    background-color: rgb(255, 255, 255);
  }
  .header .logo a {
    display: block;
    align-self: center;
    width: 88px;
    height: 88px;
    background-image: url(~@/assets/images/BuctLogo.jpg);
    font-size: 0;
  }
  .header .logo h1 {
    align-self: center;
  }
  .header .nav {
    margin-top: 33px;
    margin-right: 27px;
  }
  .header .nav ul {
    display: flex;
  }
  .header .nav li {
    margin-right: 48px;
  }
  .header .nav a {
    display: block;
    height: 34px;
  }
  .header .nav a:hover {
    border-bottom: 2px solid #5EB69C;
  }
  .header .search {
    display: flex;
    margin-right: 45px;
    margin-top: 33px;
    width: 170px;
    height: 34px;
    border-bottom: 2px solid #F4F4F4;
  }
  .header .search .icon-search {
    margin-right: 8px;
    font-size: 20px;
    color: #999;
  }
  .header .search input {
    flex: 1;
  }
  .header .search input::placeholder {
    color: #ccc;
  }
  .header .cart {
    position: relative;
    margin-top: 33px;
  }
  .header .cart .icon-cart-full {
    font-size: 24px;
  }
  .header .cart i {
    position: absolute;
    /* right: -5px; */
    left: 15px;
    top: 0;
    padding: 0 5px;
    height: 15px;
    background-color: #E26237;
    border-radius: 7px;
    font-size: 12px;
    color: #fffefe;
    line-height: 15px;
  }
  </style>