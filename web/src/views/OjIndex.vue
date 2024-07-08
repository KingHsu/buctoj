<template>
    <div class="main">
        <!-- 顶部导航 -->
        <!-- <div class="top">
        <BuctojHeaderNav></BuctojHeaderNav>
        </div> -->
        <div class="under">
            <div class="left">
            <!-- 提交数图表 -->
            <BuctojChart></BuctojChart>
            <!-- 智能训练 -->
            <BuctojSmartTraining></BuctojSmartTraining>
            <!-- 已结束比赛列表 -->
            <BuctojOverContestList></BuctojOverContestList>
            <!-- 即将开始比赛列表 -->
            <BuctojComingContestList></BuctojComingContestList>
            </div>
            <div class="right">
            <!-- Codeforces排名 -->
            <BuctojCfRanking></BuctojCfRanking>
            <!-- Atcoder排名 -->
            <BuctojAcRanking></BuctojAcRanking>
            </div>
        </div>
    </div>
</template>

<script>
import BuctojAcRanking from '../components/BuctojAcRanking.vue'
import BuctojCfRanking from '../components/BuctojCfRanking.vue'
import BuctojChart from '../components/BuctojChart.vue'
import BuctojComingContestList from '../components/BuctojComingContestList.vue'
// import BuctojHeaderNav from '../components/BuctojHeaderNav.vue'
import BuctojOverContestList from '../components/BuctojOverContestList.vue'
import BuctojSmartTraining from '../components/BuctojSmartTraining.vue'
export default {
  name: 'OjIndex',
    components: {
    // BuctojHeaderNav,
    BuctojChart,
    BuctojSmartTraining,
    BuctojOverContestList,
    BuctojComingContestList,
    BuctojCfRanking,
    BuctojAcRanking
  }
}
</script>

<style scoped>
.main {
    display: block;
    
  }
  .top {
    display: flex;
  }
  .under {
    display:  flex;
  }
  .left {
    align-items: center;
    flex: 1;
    background-color: rgb(255, 255, 255);
    margin: 5% 5% 0 10%;
    border: 0.25px #ffffff;
    border-radius: 2.5px;
    box-shadow: 0 0 2.5px 0 #000;
    
  }
  .right{
    align-items: center;
    width: 300px;
    background-color: rgb(255, 255, 255);
    margin: 5% 5% 10% 30px;
    border:  0.25px #ffffff;
    border-radius: 2.5px;
    box-shadow: 0 0 2.5px 0 #000;
  }
</style>