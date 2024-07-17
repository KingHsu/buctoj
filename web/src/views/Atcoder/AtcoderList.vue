<template>
  <div>
    <div style=" display: flex; justify-content:space-between; margin: 0 15px">
      <h3>Atcoder 比赛列表</h3>
      <div style="margin-bottom: 20px;">
      <el-input
        v-model="searchQuery"
        placeholder="输入比赛名称进行搜索"
        style="width: 300px;  margin-right: 10px;"
        @keyup.enter.native="loadInquire">
      </el-input>
      <el-button type="primary" @click="loadInquire">查询</el-button>
      <el-button type="success" @click="resetParam">重置</el-button>
      </div>
    </div>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="acContestId" label="比赛ID" width="100" align="center"></el-table-column>
      <el-table-column prop="acContest" label="比赛名称" align="center"></el-table-column>
      <el-table-column prop="acType" label="类型" width="100" align="center"></el-table-column>
      <el-table-column prop="acDate" label="日期" width="180" align="center"></el-table-column>
      <el-table-column prop="acTime" label="时间" width="100" align="center"></el-table-column>
      <el-table-column prop="acNum" label="参与人数" width="100" align="center"></el-table-column>
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
      tableData: [],
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
        param: {}
      }).then(res => res.data).then(res => {
        if (res.code === 200) {
          this.tableData = res.data
          this.total = res.total
        } else {
          alert('获取数据失败')
        }
      })
    },
    loadInquire () {
      this.$axios.post(this.$httpUrl + '/acContest/listPage', {
        pageSize: this.pageSize,
        pageNum: this.pageNum,
        param: {
          acContest: this.searchQuery
        }
      }).then(res => res.data).then(res => {
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
