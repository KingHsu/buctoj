<template>
  <div>
    <h1>AtCoder 账户排名</h1>
    <el-table
      :data="filteredRanks"
      style="width: 100%"
      :default-sort="{ prop: 'ac_count', order: 'descending' }"
      @sort-change="handleSortChange">
      <el-table-column prop="ac_num" label="序号" width="100" sortable="custom"></el-table-column>
      <el-table-column prop="ac_id" label="用户名" width="200" sortable="custom"></el-table-column>
      <el-table-column prop="ac_date" label="日期" width="150"></el-table-column>
      <el-table-column prop="ac_contest" label="比赛名称" width="200"></el-table-column>
      <el-table-column prop="ac_rank" label="排名" width="100" sortable="custom"></el-table-column>
      <el-table-column prop="ac_performance" label="表现" width="150"></el-table-column>
      <el-table-column prop="ac_newRating" label="新积分" width="150"></el-table-column>
      <el-table-column prop="ac_diff" label="积分变化" width="150"></el-table-column>
      <el-table-column prop="ac_count" label="比赛次数" width="150" sortable="custom"></el-table-column>
      <el-table-column prop="ac_maxRating" label="最高积分" width="150"></el-table-column>
    </el-table>
    <div style="text-align: center; margin-top: 20px;">
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
  </div>
</template>

<script>
export default {
  data () {
    return {
      ranks: [
        {
          ac_num: 1,
          ac_id: 'user1',
          ac_date: '2024-01-01',
          ac_contest: 'Contest 1',
          ac_rank: '3000',
          ac_performance: 'Good',
          ac_newRating: '2546',
          ac_diff: '+100',
          ac_count: 50,
          ac_maxRating: '2700'
        },
        {
          ac_num: 2,
          ac_id: 'user2',
          ac_date: '2024-02-01',
          ac_contest: 'Contest 2',
          ac_rank: '2000',
          ac_performance: 'Average',
          ac_newRating: '2456',
          ac_diff: '-50',
          ac_count: 45,
          ac_maxRating: '2600'
        },
        {
          ac_num: 3,
          ac_id: 'user3',
          ac_date: '2024-03-01',
          ac_contest: 'Contest 3',
          ac_rank: '4000',
          ac_performance: 'Excellent',
          ac_newRating: '1975',
          ac_diff: '+200',
          ac_count: 64,
          ac_maxRating: '2900'
        }
      ],
      searchQuery: '',
      pageNum: 1,
      pageSize: 10,
      totalFilteredRanks: 0,
      filteredRanks: [],
      sort: {
        prop: 'ac_count',
        order: 'descending'
      }
    }
  },
  methods: {
    fetchRanks () {
      this.$axios.post(this.$httpUrl + '/student/listPage', {
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
      this.pageNum = 1
      this.fetchRanks()
    },
    filterAndSortRanks () {
      const filtered = this.ranks.filter(rank =>
        rank.ac_id.toLowerCase().includes(this.searchQuery.toLowerCase())
      )

      if (this.sort.prop && this.sort.order) {
        const order = this.sort.order === 'ascending' ? 1 : -1
        filtered.sort((a, b) => {
          if (a[this.sort.prop] < b[this.sort.prop]) return -1 * order
          if (a[this.sort.prop] > b[this.sort.prop]) return 1 * order
          return 0
        })
      }

      const start = (this.pageNum - 1) * this.pageSize
      const end = this.pageNum * this.pageSize
      this.filteredRanks = filtered.slice(start, end)
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

.el-pagination {
  margin-top: 20px;
}

.el-button {
  margin: 0 5px;
}
</style>
