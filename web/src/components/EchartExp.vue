<template>
  <el-container>

    <el-main>
      <div id="main" style="width: 100%; height: 400px;"></div>
    </el-main>
  </el-container>
</template>

<script>
import * as echarts from 'echarts'

export default {
  name: 'EchartClassScore',
  mounted () {
    this.initChart()
  },
  methods: {
    initChart () {
      const chartDom = document.getElementById('main')
      const myChart = echarts.init(chartDom)

      const labelOption = {
        show: true,
        position: 'insideBottom',
        distance: 15,
        align: 'left',
        verticalAlign: 'middle',
        rotate: 90,
        formatter: '{c} 分',
        fontSize: 16,
        rich: {
          name: {}
        }
      }

      const option = {
        title: {
          text: '班级积分综合对比柱状图'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        legend: {
          data: ['ac积分总和', 'cf积分总和']
        },
        toolbox: {
          show: true,
          orient: 'vertical',
          left: 'right',
          top: 'center',
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            magicType: { show: true, type: ['line', 'bar'] },
            restore: { show: true },
            saveAsImage: { show: true }
          }
        },
        xAxis: [
          {
            type: 'category',
            axisTick: { show: false },
            data: ['1901', '1906', '2001', '2004', '2007', '2102', '2104', '2105', '2106', '2111']
          }
        ],
        yAxis: [
          {
            type: 'value'
          }
        ],
        series: [
          {
            name: 'ac积分总和',
            type: 'bar',
            barGap: 0,
            label: labelOption,
            emphasis: {
              focus: 'series'
            },
            data: [910, 1689, 1384, 2754, 16058, 14487, 1133, 699, 905, 1134]
          },
          {
            name: 'cf积分总和',
            type: 'bar',
            label: labelOption,
            emphasis: {
              focus: 'series'
            },
            data: [1721, 2972, 3383, 3784, 21659, 20611, 1734, 5582, 1709, 1866]
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
  height: 600px;
}
</style>
