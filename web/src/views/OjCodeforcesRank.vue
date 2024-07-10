<template>
  <div>
    <h1>Codeforces 账户排名</h1>
    <el-input
      v-model="searchQuery"
      placeholder="输入账户名称进行搜索"
      @input="fetchRanks"
      style="margin-bottom: 20px;">
    </el-input>
    <el-table
      :data="filteredRanks"
      style="width: 100%"
      :default-sort="{prop: 'cf_sum_contest', order: 'descending'}"
      @sort-change="handleSortChange">
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
    <div style="text-align: center; margin-top: 20px;">
      <el-pagination
        @current-change="handlePageChange"
        :current-page="pageNum"
        :page-size="pageSize"
        layout="prev, pager, next"
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
          cf_num: 1,
          cf_id: 'user1',
          cf_contest: 'Contest 1',
          cf_contest_id: '12345',
          cf_rank: '3000',
          cf_old_rating: '2500',
          cf_new_rating: '2600',
          cf_sum_contest: 50,
          cf_date: '2024-01-01'
        },
        {
          cf_num: 2,
          cf_id: 'user2',
          cf_contest: 'Contest 2',
          cf_contest_id: '67890',
          cf_rank: '2000',
          cf_old_rating: '2400',
          cf_new_rating: '2450',
          cf_sum_contest: 45,
          cf_date: '2024-02-01'
        },
        {
          cf_num: 3,
          cf_id: 'user3',
          cf_contest: 'Contest 3',
          cf_contest_id: '11121',
          cf_rank: '4000',
          cf_old_rating: '1950',
          cf_new_rating: '2050',
          cf_sum_contest: 64,
          cf_date: '2024-03-01'
        }
        // 继续添加更多模拟数据...
      ],
      searchQuery: '',
      pageNum: 1,
      pageSize: 10,
      sort: {
        prop: 'cf_sum_contest',
        order: 'descending'
      }
    }
  },
  computed: {
    totalFilteredRanks () {
      return this.ranks.filter(rank =>
        rank.cf_id.toLowerCase().includes(this.searchQuery.toLowerCase())
      ).length
    },
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
      // 模拟数据，不需要实际请求
      console.log('Fetching ranks...')
    },
    handleSortChange ({ prop, order }) {
      this.sort.prop = prop
      this.sort.order = order
    },
    handlePageChange (page) {
      this.pageNum = page
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

.el-pagination {
  margin-top: 20px;
}

.el-button {
  margin: 0 5px;
}
</style>
