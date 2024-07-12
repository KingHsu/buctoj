<template>
  <div>
    <p class="title">Atcoder 账户排名</p>
    <el-table
      :data="ranks"
      style="width: 100%"
      @sort-change="handleSortChange" class="contest-table">
      <el-table-column
        prop="acId"
        label="用户名"
       >
      </el-table-column>

      <el-table-column
        prop="acNewRating"
        label="最新积分"
        >
      </el-table-column>

    </el-table>

    <!-- <div style="text-align: center; margin-top: 20px;">
      <el-pagination
        @current-change="handlePageChange"
        @size-change="handleSizeChange"
        :current-page="pageNum"
        :page-size="pageSize"
        :page-sizes="[5, 10, 20, 30]"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div> -->
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

.el-pagination {
  margin-top: 20px;
}

.el-button {
  margin: 0 5px;
}
</style>
