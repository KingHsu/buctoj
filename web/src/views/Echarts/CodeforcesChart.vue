<template>
  <div class="main">
    <div ref="chart" style="width: 1500px; height: 700px; align-self: center"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts'
export default {
  data () {
    return {
      tableData: [],
      chartData: [],
      chartDataFinal: [],
      pageNum: 1,
      pageSize: 100,
      order: 'dsc'
    }
  },
  methods: {
    InitCharts () {
      this.myChart = echarts.init(this.$refs.chart)
      const option = {
        title: {
          text: '用户参加比赛数占比图',
          subtext: 'codeforces'
        },
        tooltip: {
          trigger: 'item',
          formatter: '{b} : {c} ({d}%)'
        },
        toolbox: {
          show: true,
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            restore: { show: true },
            saveAsImage: { show: true }
          }
        },
        series: [
          {
            name: 'Area Mode',
            type: 'pie',
            radius: [75, 300],
            center: ['50%', '50%'],
            roseType: 'radius',
            itemStyle: {
              borderRadius: 5
            },
            label: {
              show: true
            },
            emphasis: {
              label: {
                show: true
              }
            },
            data: this.chartDataFinal
          }
        ]
      }
      option && this.myChart.setOption(option)
    },
    sortBy (attr, rev) {
      if (rev === undefined) { rev = 1 } else {
        if (rev > 0) rev = 1
        else rev = -1
      }
      return function (a, b) {
        a = a[attr]
        b = b[attr]
        if (a < b) { return rev * -1 }
        if (a > b) { return rev * 1 }
        return 0
      }
    },
    getData () {
      this.$axios.get(this.$httpUrl + '/codeforces/order', {
        params: {
          page: this.pageNum,
          size: this.pageSize,
          orderBy: this.order
        },
        Headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
      }).then(res => res.data).then(res => {
        console.log(res.data)
        if (res.code === 200) {
          this.tableData = res.data.records
          this.chartData = this.tableData.map((item) => {
            return Object.assign({}, { name: item.cfId, value: item.cfSumContest })
          })
          console.log(this.chartData)
          this.chartDataFinal = Object.values(this.chartData.reduce((acc, cur) => {
            const key = cur.name
            if (acc[key]) {
              acc[key].value += cur.value
            } else {
              acc[key] = { name: key, value: cur.value }
            }
            return acc
          }, {}))
          this.chartDataFinal.sort(this.sortBy('value', -1))
          console.log(this.chartDataFinal)
        } else {
          alert('获取数据失败')
        }
      })
    }
  },
  mounted () {
    setTimeout(() => {
      this.InitCharts()
    }, 400)
  },
  created () {
    this.getData()
  }
}
</script>

<style>

</style>
