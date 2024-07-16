<template>
  <div>
    <h3>Atcoder 账户排名</h3>
    <el-table
      :data="ranks"
      style="width: 100%"
      @sort-change="handleSortChange">
      <el-table-column
        prop="acId"
        label="用户名"
        width="200"
        align="center">
      </el-table-column>
      <el-table-column
        prop="acCount"
        label="参与比赛总数"
        width="200"
        sortable="custom"
        align="center">
      </el-table-column>
      <el-table-column
        prop="acContest"
        label="比赛名称"
        align="center">
      </el-table-column>
      <el-table-column
        prop="acRank"
        label="排名"
        width="100"
        align="center">
      </el-table-column>
      <el-table-column
      prop="acPerformance"
      label="表现"
      width="100"
      align="center">
      </el-table-column>
      <el-table-column
        prop="acNewRating"
        label="新积分"
        width="100"
        align="center">
      </el-table-column>
      <el-table-column
        prop="acDiff"
        label="积分变化"
        width="100"
        align="center">
      </el-table-column>
      <el-table-column
        prop="acMaxRating"
        label="最高积分"
        width="100"
        align="center">
    </el-table-column>
    </el-table>

    <div style="text-align: center; margin: auto;">
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
      this.$axios.get(this.$httpUrl + '/atCoder/order', {
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
