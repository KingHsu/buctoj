<template>
  <el-container>
    <el-main>
      <div id="main" style="width: 100%; height: 1000px;"></div>
    </el-main>
  </el-container>
</template>

<script>
import * as echarts from 'echarts'

export default {
  name: 'EchartStudentScore',
  mounted () {
    this.initChart()
  },
  methods: {
    initChart () {
      const chartDom = document.getElementById('main')
      const myChart = echarts.init(chartDom)

      const option = {
        title: {
          text: '学生新旧积分对比条形图'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        legend: {
          data: ['旧积分', '新积分']
        },
        grid: {
          left: '4%',
          right: '5%',
          bottom: '5%',
          containLabel: true
        },
        xAxis: {
          type: 'value',
          boundaryGap: [0, 0.01]
        },
        yAxis: {
          type: 'category',
          data: [
            '张占文', '李佩峰', '曾梓勋', '闫阳旭', '陈柯舟', '巴同学', '郭力玮', '范露曦',
            '李腾飞', '梁凯星', '洪枢适', '黄东琦', '邱若昕', '常泽星', '刘祥睿', '曾朴凡'
          ],
          axisLabel: {
            fontSize: 20 // 调大学生名字的字号
          }
        },
        series: [
          {
            name: '旧积分',
            type: 'bar',
            data: [1561, 1524, 1830, 1693, 1404, 1731, 1247, 1389, 1602, 1947, 1834, 1753, 1674, 1421, 1732, 1578],
            barCategoryGap: '30%' // 调整纵向间距
          },
          {
            name: '新积分',
            type: 'bar',
            data: [1551, 1692, 1969, 1721, 1406, 1848, 1308, 1331, 1566, 1936, 1866, 1976, 1709, 1392, 1734, 1691],
            barCategoryGap: '30%' // 调整纵向间距
          }
        ]
      }

      myChart.setOption(option)
    }
  }
}
</script>

<style scoped>
#main {
  width: 100%;
  height: 1000px;
}
</style>
