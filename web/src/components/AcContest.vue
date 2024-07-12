<template>
  <div>
    <router-link to="/AtcoderList"><p class="title">Atcoder 比赛列表</p></router-link>
    <el-table :data="tableData" style="width: 100%" class="contest-table">
      <el-table-column prop="acContestId" label="比赛ID"></el-table-column>
      <el-table-column prop="acContest" label="比赛名称"></el-table-column>
      <el-table-column prop="acDate" label="日期"></el-table-column>
    </el-table>
    <!-- <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageNum"
      :page-sizes="[5, 10, 20, 30]"
      :page-size="pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total">
    </el-pagination> -->
  </div>
</template>

<script>
export default {
  data () {
    return {
      tableData: [
        { acContestId: '1', acContest: 'Contest 1', acDate: '2023-01-01' },
        { acContestId: '2', acContest: 'Contest 2', acDate: '2023-01-02' },
        { acContestId: '3', acContest: 'Contest 3', acDate: '2023-01-03' },
        { acContestId: '4', acContest: 'Contest 4', acDate: '2023-01-04' },
        { acContestId: '1', acContest: 'Contest 1', acDate: '2023-01-01' },
        { acContestId: '2', acContest: 'Contest 2', acDate: '2023-01-02' },
        { acContestId: '3', acContest: 'Contest 3', acDate: '2023-01-03' },
        { acContestId: '4', acContest: 'Contest 4', acDate: '2023-01-04' },
        { acContestId: '1', acContest: 'Contest 1', acDate: '2023-01-01' },
        { acContestId: '2', acContest: 'Contest 2', acDate: '2023-01-02' },
        { acContestId: '3', acContest: 'Contest 3', acDate: '2023-01-03' },
        { acContestId: '4', acContest: 'Contest 4', acDate: '2023-01-04' },
        { acContestId: '5', acContest: 'Contest 5', acDate: '2023-01-05' }

      ],
      pageSize: 10,
      pageNum: 1,
      total: 0,
      searchQuery: '',
      contests: []
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
    },
    loadPost () {
      this.$axios.post(this.$httpUrl + '/acContest/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
          acContest: this.acContest
        }
      }).then(res => res.data).then(res => {
        if (res.code === 200) {
          this.tableData = res.data
          this.total = res.total
        } else {
          alert('获取数据失败')
        }
      })
    },
    resetParam () {
      this.searchQuery = ''
      this.loadPost()
    },
    handleSizeChange (val) {
      this.pageNum = 1
      this.pageSize = val
      this.loadPost()
    },
    handleCurrentChange (val) {
      this.pageNum = val
      this.loadPost()
    }
  },
  beforeMount () {
    this.loadPost()
  }
}
</script>

<style scoped>
.title {
  font-size: 16px;
  margin: 1px 0;
  line-height: 1;
}

.el-table th, .el-table td {
  padding: 1px 0;
}

.el-input {
  width: 50px;
}

.el-button {
  margin: 0 5px;
}
</style>
