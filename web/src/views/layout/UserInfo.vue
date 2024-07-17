<template>
  <div class="main">
    <div class="baseInfo">
      <div class="avatar">
        <img src="/img/tx.png" class="avatar">
      </div>
      <div class="text">用户名：{{ userInfo.stuUsername }}</div>
      <el-button v-if="isAdminOrnot()" round icon="el-icon-user-solid" type="success">普通用户</el-button>
      <el-button v-else round icon="el-icon-star-on" type="primary">管理员</el-button>
      <div class="text">姓名：{{ userInfo.stuName }}</div>
      <div class="text">班级：{{ userInfo.stuClass }}</div>
      <div class="text">学号：{{ userInfo.stuNum }}</div>
      <div class="text">cf用户名：{{ userInfo.stuCfId }}</div>
      <div class="text">ac用户名：{{ userInfo.stuAcId }}</div>
      <div class="option">
        <el-button type="danger" @click="logout">退出登录</el-button>
      </div>
      <div class="option">
        <el-button type="warning" @click="change">切换用户</el-button>
      </div>
    </div>

    <div class="contestInfo">
      <div>
        <el-tabs v-model="activeName">
          <el-tab-pane label="codeforces比赛情况" name="first">
            <el-table :data="tableDataCFinal" style="width: 100%">
              <el-table-column prop="cfContest" label="比赛名称"></el-table-column>
              <el-table-column prop="cfContestId" label="比赛ID" width="100"></el-table-column>
              <el-table-column prop="cfDate" label="时间" width="200"></el-table-column>
              <el-table-column prop="cfRank" label="比赛排名" width="100"></el-table-column>
              <el-table-column prop="cfOldRating" label="赛前积分" width="180"></el-table-column>
              <el-table-column prop="cfNewRating" label="赛后积分" width="100"></el-table-column>
            </el-table>
          </el-tab-pane>
          <el-tab-pane label="atcoder比赛情况" name="second">
            <el-table :data="tableDataAFinal" style="width: 100%">
              <el-table-column prop="acContest" label="比赛名称"></el-table-column>
              <el-table-column prop="acDate" label="时间" width="200"></el-table-column>
              <el-table-column prop="acRank" label="排名" width="100"></el-table-column>
              <el-table-column prop="acPerformance" label="表现" width="100"></el-table-column>
              <el-table-column prop="acNewRating" label="新积分" width="100"></el-table-column>
              <el-table-column prop="acDiff" label="积分变化" width="100"></el-table-column>
              <el-table-column prop="acMaxRating" label="最高积分" width="100"></el-table-column>
            </el-table>
          </el-tab-pane>
        </el-tabs>
      </div>
    </div>

    <el-dialog
      title="警告"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose">
      <span>切换用户将会退出当前用户！</span>
      <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>
      <el-button type="warning" @click="login">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'UserInfo',
  data () {
    return {
      userInfo: {
        stuUsername: '',
        stuNum: '',
        stuCfId: '',
        stuAcId: ''
      },
      activeName: 'first',
      tableDataAFinal: [],
      tableDataCFinal: [],
      tableDataC: [],
      tableDataA: [],
      dialogVisible: false
    }
  },
  methods: {
    async getUserInfo () {
      this.stuNum = this.$store.getters['user/getUserInfo'].stuNum
      // console.log(this.stuNum)
      this.$axios.post(this.$httpUrl + '/student/listP', {
        stuNum: this.stuNum
      }).then(res => res.data).then(res => {
        // console.log(res)
        if (res.code === 200) {
          this.userInfo = res.data[0]
          // console.log('userInfo:' + this.userInfo.stuNum)
        } else {
          alert('获取数据失败')
        }
      })
      // 获取codeforces参与过的比赛数据
      await this.$axios.post(this.$httpUrl + '/codeforces/listPage', {
        pageNum: 1,
        pageSize: 100
      }).then(res => res.data).then(res => {
        if (res.code === 200) {
          this.tableDataC = res.data
          // console.log(this.tableDataC)
          this.tableDataCFinal = this.tableDataC.filter(obj => obj.cfId === this.userInfo.stuCfId)
          console.log(this.tableDataCFinal)
        } else {
          alert('获取数据失败')
        }
      })
      // 获取atcoder参与过的比赛数据
      await this.$axios.post(this.$httpUrl + '/atCoder/listPage', {
        pageNum: 1,
        pageSize: 100
      }).then(res => res.data).then(res => {
        if (res.code === 200) {
          this.tableDataA = res.data
          // console.log(this.tableDataA)
          this.tableDataAFinal = this.tableDataA.filter(obj => obj.acId === this.userInfo.stuAcId)
          // console.log(this.tableDataAFinal)
        } else {
          alert('获取数据失败')
        }
      })
    },
    logout () {
      this.$store.commit('user/removeUserInfo')
      this.$store.commit('setting/logout')
      this.$router.replace('/OjHome')
    },
    login () {
      this.logout()
      this.$router.replace('/LoginIndex')
    },
    change () {
      this.dialogVisible = true
    },
    isAdminOrnot () {
      return this.userInfo.stuMan === '0'
    }
  },
  mounted () {
    this.getUserInfo()
  }
  // beforeUpdate () {
  //   this.getUserInfo()
  // }
}
</script>

<style scoped>
.main {
  margin: 10px 10%;
  display: flex;
}
.baseInfo {
  display: flex;
  flex-direction: column;   /*设置主轴方向是水平方向*/
  align-items: center;  /*设置侧轴上，子元素的排列方式为居中对齐*/
  justify-content: center;
  height: 600px;
  width: 300px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  margin: 0px 30px 10px 10px;
  padding: 10px 0px;
}

.avatar {
  width: 200px; /* 根据需要调整头像大小 */
  height: 200px;
  border-radius: 50%; /* 圆形头像 */
  vertical-align: middle; /* 垂直居中 */
}

.text {
  margin: 10px 5px;
}

.option {
  margin: 10px 5px;
}

.contestInfo {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  width: 70%;
  margin: 0px 10px;
  padding: 15px;
}

</style>
