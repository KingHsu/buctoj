<template>
  <div>
    <h1>Atcoder 比赛列表</h1>
    <el-input
      v-model="searchQuery"
      placeholder="输入比赛名称进行搜索"
      @input="fetchContests"
      style="margin-bottom: 20px;">
    </el-input>
    <el-table :data="filteredContests" style="width: 100%">
      <el-table-column prop="acContestId" label="比赛ID" width="100"></el-table-column>
      <el-table-column prop="acContest" label="比赛名称"></el-table-column>
      <el-table-column prop="acType" label="类型" width="100"></el-table-column>
      <el-table-column prop="acDate" label="日期" width="180"></el-table-column>
      <el-table-column prop="acTime" label="时间" width="100"></el-table-column>
      <el-table-column prop="acNum" label="参与人数" width="100"></el-table-column>
    </el-table>
    <div style="text-align: center; margin-top: 20px;">
      <el-button @click="prevPage" :disabled="pageNum === 1">上一页</el-button>
      <el-button @click="nextPage" :disabled="contests.length < pageSize">下一页</el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AtcoderList',
  data () {
    return {
      contests: [
        {
          acContestId: '1499',
          acContest: 'TOYOTA SYSTEMS Programming Contest 2023(AtCoder Beginner Contest 330)',
          acType: 'abc',
          acDate: '2023/11/25 20:00:00',
          acTime: '01:40:00',
          acNum: '2'
        },
        {
          acContestId: '1500',
          acContest: 'atcoder SYSTEMS Programming Contest 2023(AtCoder Beginner Contest 331)',
          acType: 'abc',
          acDate: '2023/11/26 20:00:00',
          acTime: '01:40:00',
          acNum: '3'
        },
        {
          acContestId: '1501',
          acContest: 'TOA SYSTEMS Programming Contest 2023(AtCoder Beginner Contest 332)',
          acType: 'abc',
          acDate: '2023/11/27 20:00:00',
          acTime: '01:40:00',
          acNum: '4'
        }
        // 继续添加更多模拟数据...
      ],
      pageNum: 1,
      pageSize: 10,
      searchQuery: ''
    }
  },
  computed: {
    filteredContests () {
      // 模糊查询和分页过滤
      const filtered = this.contests.filter(contest =>
        contest.acContest.toLowerCase().includes(this.searchQuery.toLowerCase())
      )
      const start = (this.pageNum - 1) * this.pageSize
      const end = this.pageNum * this.pageSize
      return filtered.slice(start, end)
    }
  },
  methods: {
    fetchContests () {
      // 模拟数据，不需要实际请求
      console.log('Fetching contests...')
    },
    nextPage () {
      if ((this.pageNum * this.pageSize) < this.contests.length) {
        this.pageNum++
      }
    },
    prevPage () {
      if (this.pageNum > 1) {
        this.pageNum--
      }
    }
  }
}
</script>

<style scoped>
.el-table {
  margin-top: 20px;
}

.el-input {
  width: 300px;
}

.el-button {
  margin: 0 5px;
}
</style>
