<template>
  <el-container class="main">
    <el-main class="left">
      <!-- 示例图表 -->
      <el-container class="item">
        <el-main><EchartExp></EchartExp></el-main>
      </el-container>
      <!-- codeforces比赛列表 -->
      <el-container class="item">
        <el-main><CfContest></CfContest></el-main>
      </el-container>
        <!-- atcoder比赛列表 -->
      <el-container class="item">
        <el-main><AcContest></AcContest></el-main>
      </el-container>
    </el-main>
    <el-main class="right">
      <!-- Codeforces账户排名 -->
      <el-container class="item">
        <el-main><CfRank></CfRank></el-main>
      </el-container >
      <!-- Atcoder账户排名 -->
      <el-container class="item">
        <el-main><AcRank></AcRank></el-main>
      </el-container>
    </el-main>
  </el-container>
</template>

<script>
import AcRank from '@/components/AcRank.vue'
import CfRank from '@/components/CfRank.vue'
import EchartExp from '@/components/EchartExp.vue'
import AcContest from '@/components/AcContest.vue'
import CfContest from '@/components/CfContest.vue'

export default {
  name: 'OjHome',
  components: {
    AcRank,
    CfRank,
    EchartExp,
    AcContest,
    CfContest
  }
}
</script>

<style scoped>
.main {
  margin: 0px 10%;
}

.el-main {
  color: #333;
  text-align: center;
  line-height: 160px;
  margin: 0;
}

.left {
  width: 85%;
  margin: 0px 5px;
}

.right {
  text-align: center;
  width: 30%;
  margin: 0px 5px;
}

.item {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)
}

</style>
