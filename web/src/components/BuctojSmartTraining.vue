<template>
    <div class="main">
      <div class="title">
        <div class="titleText">智能训练 : 2024ACM队员周训练-26</div>
      </div> 
      <div class="timeDisplay">
        <div class="beginTime">
          <div>开始时间</div>
          <div>2024/7/1</div>
          <div>08:00:00</div>
        </div>
        <div class="overTime">
          <div>结束时间</div>
          <div>2024/7/7</div>
          <div>22:00:00</div>
        </div>
      </div>
      <div class="trainingData">
        <div class="peopleNum">
          <div>总参加人数</div>
          <div>23</div>
        </div>
        <div class="acNum">
          <div>累计解题数量</div>
          <div>71</div>
        </div>
        <div class="score">
          <div>累计解题分数</div>
          <div>64700</div>
        </div>
      </div>
      <div class="buttonList">
        <div class="button">榜单</div>
        <div class="button">记录</div>
        <div class="button">加入</div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
  
  }
  </script>
  
  <style scoped>
    .main {
      display: flex;
      background-color: rgb(255, 255, 255);
      margin: 5%;
      border: 0.25px #ffffff;
      border-radius: 2.5px;
      box-shadow: 0 0 2.5px 0 #000;
    }
    .title {
      display: flex
    }
    .timeDisplay {
      display: flex;
    }
    .beginTime {
      display: block;
    }
    .overTime {
      display: block;
    }
    .trainingData {
      display: flex;
    }
    .peopleNum {
      display: block;
    }
    .acNum {
      display: block;
    }
    .score {
      display: block;
    }
    .buttonList {
      display: flex;
    }
  </style>