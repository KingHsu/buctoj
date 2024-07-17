<template>
  <div>
    <div style=" display: flex; justify-content:space-between; margin: 0 15px">
      <h3>Codeforces 比赛列表</h3>
      <div style="margin-bottom: 5px;">
      <el-input
        v-model="searchQuery"
        placeholder="输入比赛名称进行搜索"
        style="width: 300px; margin-right: 10px;"
        suffix-icon="el-icon-search"
        @keyup.enter.native="fetchContests">
      </el-input>
      <el-button type="primary" @click="fetchContests">查询</el-button>
      <el-button type="success" @click="resetParam">重置</el-button>
      </div>
    </div>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="cfContestId" label="比赛ID" width="100" align="center"></el-table-column>
      <el-table-column prop="cfContest" label="比赛名称" align="center"></el-table-column>
      <el-table-column prop="cfType" label="类型" width="100" align="center"></el-table-column>
      <el-table-column prop="cfDate" label="日期" width="180" align="center"></el-table-column>
      <el-table-column prop="cfTime" label="时间" width="100" align="center"></el-table-column>
      <el-table-column prop="cfNum" label="参与人数" width="100" align="center"></el-table-column>
    </el-table>
    <div style="text-align: center;margin:auto;">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[5, 10, 20, 30]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { Message } from 'element-ui'
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
    async fetchContests () {
      await this.$axios.post(this.$httpUrl + '/cfContest/listPage', {
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
          this.isShow = true
        } else {
          alert('获取数据失败')
        }
      })
    },
    async loadInquire () {
      await this.$axios.post(this.$httpUrl + '/cfContest/listPage', {
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
          Message({
            message: '查询成功！',
            type: 'success'
          })
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
