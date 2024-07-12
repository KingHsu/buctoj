<template>
  <div>
    <p class="title">Codeforces 比赛列表</p>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="cfContestId" label="比赛ID"></el-table-column>
      <el-table-column prop="cfContest" label="比赛名称"></el-table-column>

      <el-table-column prop="cfDate" label="日期" ></el-table-column>

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
      contests: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
      searchQuery: '',
      tableData: []
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
      this.$axios.post(this.$httpUrl + '/cfContest/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
          cfContest: this.searchQuery
        }
      }).then(res => res.data).then(res => {
        console.log(res.data)
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
      this.fetchContests()
    },
    handleSizeChange (val) {
      this.pageSize = val
      this.pageNum = 1
      this.fetchContests()
    },
    handleCurrentChange (val) {
      this.pageNum = val
      this.fetchContests()
    }
  },
  beforeMount () {
    this.fetchContests()
  }
}
</script>

<style scoped>
.title {
  font-size: 16px;
  margin: 10px 0;
  line-height: 1;
}

.el-table th, .el-table td {
  padding: 4px 0;
}

.el-input {
  width: 300px;
}

.el-button {
  margin: 0 5px;
}
</style>
