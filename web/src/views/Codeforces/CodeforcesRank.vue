<template>
  <div>
    <h3>Codeforces 账户排名</h3>
    <el-table
      :data="ranks"
      style="width: 100%"
      @sort-change="handleSortChange">
      <el-table-column
        prop="cfId"
        label="用户名"
        width="200">
      </el-table-column>
      <el-table-column
        prop="cfSumContest"
        label="参与比赛总数"
        width="200"
        sortable="custom"
        >
      </el-table-column>
      <el-table-column
        prop="cfContest"
        label="比赛名称"
        width="300">
      </el-table-column>
      <el-table-column
        prop="cfContestId"
        label="比赛名称ID"
        width="200">
      </el-table-column>
      <el-table-column
        prop="cfRank"
        label="比赛排名"
        width="200">
      </el-table-column>
      <el-table-column
        prop="cfOldRating"
        label="旧积分"
        width="200">
      </el-table-column>
      <el-table-column
        prop="cfNewRating"
        label="最新积分"
        width="200">
      </el-table-column>
      <el-table-column
        prop="cfDate"
        label="日期"
        width="200">
    </el-table-column>
    </el-table>

    <div style="text-align: center; margin:auto;">
      <el-pagination
        @current-change="handlePageChange"
        @size-change="handleSizeChange"
        :current-page="pageNum"
        :page-size="pageSize"
        :page-sizes="[5, 10, 20, 30]"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      ranks: [],
      pageNum: 1,
      pageSize: 10,
      pageSizes: [5, 10, 20, 30],
      total: 0,
      order: 'dsc'
    }
  },
  methods: {
    fetchRanks () {
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
          this.ranks = res.data.records
          this.total = res.data.total
        } else {
          alert('获取数据失败')
        }
      })
    },
    handleSortChange () {
      console.log(this.order)
      if (this.order === 'asc') { this.order = 'dsc' } else this.order = 'asc'
      this.fetchRanks()
    },
    handlePageChange (page) {
      this.pageNum = page
      this.fetchRanks()
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.pageNum = 1 // 切换每页条数时重置到第一页
      this.fetchRanks()
    },
    sortChange () {
      if (this.order === 'asc') this.order = 'dsc'
      else this.order = 'asc'
      console.log(this.order)
      this.fetchRanks()
    }
  },
  created () {
    this.fetchRanks()
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
