<template>
    <div class="main">
      <div ref="chart" style="width: 100%; height: 100%" ></div>
    </div>
</template>

<script>
import * as echarts from 'echarts'
export default {
  methods: {
    InitCharts () {
      this.myChart = echarts.init(this.$refs.chart)

      const option = {
        title: {
          show: true,
          text: '近七天提交数'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            // Use axis to trigger tooltip
            type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
          }
        },
        legend: {},
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: ['7.4', '7.3', '7.2', '7.1', '6.30', '6.29', '6.28']
        },
        yAxis: {
          type: 'value'

        },
        series: [
          {
            name: '赛时未提交数',
            type: 'bar',
            stack: 'total',
            // label: {
            //   show: false
            // },
            emphasis: {
              focus: 'series'
            },
            data: [320, 302, 301, 334, 390, 330, 320]
          },
          {
            name: '补题未通过数',
            type: 'bar',
            stack: 'total',
            // label: {
            //   show: true
            // },
            emphasis: {
              focus: 'series'
            },
            data: [120, 132, 101, 134, 90, 230, 210]
          },
          {
            name: '赛时AC数',
            type: 'bar',
            stack: 'total',
            // label: {
            //   show: true
            // },
            emphasis: {
              focus: 'series'
            },
            data: [220, 182, 191, 234, 290, 330, 310]
          },
          {
            name: '补题AC数',
            type: 'bar',
            stack: 'total',
            // label: {
            //   show: true
            // },
            emphasis: {
              focus: 'series'
            },
            data: [150, 212, 201, 154, 190, 330, 410]
          }
        ]
      }

      option && this.myChart.setOption(option)
    }
  },
  mounted () {
    setTimeout(() => {
      this.InitCharts()
    }, 20)
  }
}
</script>

<style scoped>
.main {
  width: 625px;
  height: 300px;
  margin: 0px;
}
</style>
