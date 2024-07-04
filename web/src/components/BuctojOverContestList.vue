<template>
    <div class="main">
      <div class="title">
        <div class="titleText">已结束的比赛</div>
      </div>
      <div class="contestList">
        <div class="listHeader">
          <div class=""></div>
          <div class=""></div>
          <div class=""></div>
        </div>
        <div class="listData" v-for="(item) in contestList" :key="item.id">
          <div class="listItems">
            <div>{{ item.name }}</div>
            <div>{{ item.beginTime }}</div>
            <div>{{ item.num }}</div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data(){
      return {
        contestList:[
          {
            id: 1,
            name: 'EPIC Institute of Technology Round Summer 2024 (Div. 1 + Div. 2)',
            beginTime: '2024/6/30 22:35:00',
            num: 3
          },
          {
            id: 2,
            name: 'AtCoder Beginner Contest 360',
            beginTime: '2024/6/30 20:00:00',
            num: 1
          },
          {
            id: 3,
            name: 1,
            beginTime: 1,
            num: 1
          }
        ]
      }
    }
  }
  </script>
  
  <style scoped>
    .main {
        background-color: rgb(255, 255, 255);
        margin: 5%;
        border: 0.25px #ffffff;
        border-radius: 2.5px;
        box-shadow: 0 0 2.5px 0 #000;
    }
  </style>