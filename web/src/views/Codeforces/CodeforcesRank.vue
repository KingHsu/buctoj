<template>
  <div>
    <h1>Codeforces 账户排名</h1>

    <el-table :data="filteredRanks" style="width: 100%">
      <el-table-column prop="cf_num" label="序号" width="200" sortable="custom"></el-table-column>
      <el-table-column prop="cf_id" label="用户名" width="200" sortable="custom"></el-table-column>
      <el-table-column prop="cf_contest" label="比赛名称" width="300"></el-table-column>
      <el-table-column prop="cf_contest_id" label="比赛名称ID" width="200"></el-table-column>
      <el-table-column prop="cf_rank" label="比赛排名" width="200" sortable="custom"></el-table-column>
      <el-table-column prop="cf_old_rating" label="旧积分" width="200"></el-table-column>
      <el-table-column prop="cf_new_rating" label="最新积分" width="200"></el-table-column>
      <el-table-column prop="cf_sum_contest" label="参与比赛总数" width="200" sortable="custom"></el-table-column>
      <el-table-column prop="cf_date" label="日期" width="200"></el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handlePageChange"
      :current-page="pageNum"
      :page-sizes="[5, 10, 20, 30]"
      :page-size="pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="totalFilteredRanks">
    </el-pagination>
  </div>
</template>

<script>
export default {
  data () {
    return {
      ranks: [], // 数据源改为空，从后端获取
      searchQuery: '',
      pageNum: 1,
      pageSize: 10,
      totalFilteredRanks: 0,
      sort: {
        prop: 'cf_sum_contest',
        order: 'descending'
      }
    }
  },
  computed: {
    filteredRanks () {
      const filtered = this.ranks.filter(rank =>
        rank.cf_id.toLowerCase().includes(this.searchQuery.toLowerCase())
      )

      // 排序
      if (this.sort.prop && this.sort.order) {
        const order = this.sort.order === 'ascending' ? 1 : -1
        filtered.sort((a, b) => {
          if (a[this.sort.prop] < b[this.sort.prop]) return -1 * order
          if (a[this.sort.prop] > b[this.sort.prop]) return 1 * order
          return 0
        })
      }

      // 分页
      const start = (this.pageNum - 1) * this.pageSize
      const end = this.pageNum * this.pageSize
      return filtered.slice(start, end)
    }
  },
  methods: {
    fetchRanks () {
      this.$axios.post(this.$httpUrl + '/codeforces/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
          searchQuery: this.searchQuery
        }
      }).then(res => res.data).then(res => {
        if (res.code === 200) {
          this.ranks = res.data
          this.totalFilteredRanks = res.total
          this.filterAndSortRanks()
        } else {
          alert('获取数据失败')
        }
      })
    },
    resetParam () {
      this.searchQuery = ''
      this.fetchRanks()
    },
    handleSortChange ({ prop, order }) {
      this.sort.prop = prop
      this.sort.order = order
      this.filterAndSortRanks()
    },
    handlePageChange (page) {
      this.pageNum = page
      this.fetchRanks()
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.pageNum = 1 // 切换每页条数时重置到第一页
      this.fetchRanks()
    }
  },
  beforeMount () {
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
