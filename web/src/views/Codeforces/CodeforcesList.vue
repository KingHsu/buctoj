<template>
  <div>
    <h1>Codeforces 比赛列表</h1>
    <el-input
      v-model="searchQuery"
      placeholder="输入比赛名称进行搜索"
      @input="fetchContests"
      style="margin-bottom: 20px;">
    </el-input>
    <el-table :data="filteredContests" style="width: 100%">
      <el-table-column prop="cfContestId" label="比赛ID" width="100"></el-table-column>
      <el-table-column prop="cfContest" label="比赛名称"></el-table-column>
      <el-table-column prop="cfType" label="类型" width="100"></el-table-column>
      <el-table-column prop="cfDate" label="日期" width="180"></el-table-column>
      <el-table-column prop="cfTime" label="时间" width="100"></el-table-column>
      <el-table-column prop="cfNum" label="参与人数" width="100"></el-table-column>
    </el-table>
    <div style="text-align: center; margin-top: 20px;">
      <el-button @click="prevPage" :disabled="pageNum === 1">上一页</el-button>
      <el-button @click="nextPage" :disabled="filteredContests.length < pageSize">下一页</el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CodeforcesList',
  data () {
    return {
      contests: [
        {
          cfContestId: '1499',
          cfContest: 'Codeforces Round #680',
          cfType: 'Div. 3',
          cfDate: '2023/11/25 20:00:00',
          cfTime: '01:40:00',
          cfNum: '2000'
        },
        {
          cfContestId: '1500',
          cfContest: 'Codeforces Round #681',
          cfType: 'Div. 2',
          cfDate: '2023/11/26 20:00:00',
          cfTime: '02:00:00',
          cfNum: '2500'
        },
        {
          cfContestId: '1501',
          cfContest: 'Codeforces Round #682',
          cfType: 'Div. 1',
          cfDate: '2023/11/27 20:00:00',
          cfTime: '02:30:00',
          cfNum: '1500'
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
        contest.cfContest.toLowerCase().includes(this.searchQuery.toLowerCase())
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
