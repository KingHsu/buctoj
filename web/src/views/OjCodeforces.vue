<template>
  <div>
    <h1>Codeforces 比赛列表</h1>
    <div>
      <label for="search">比赛名称：</label>
      <input type="text" v-model="searchQuery" @input="fetchContests" placeholder="输入比赛名称进行搜索">
    </div>
    <table>
      <thead>
      <tr>
        <th>比赛ID</th>
        <th>比赛名称</th>
        <th>类型</th>
        <th>日期</th>
        <th>时间</th>
        <th>参与人数</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="contest in contests" :key="contest.cfContestId">
        <td>{{ contest.cfContestId }}</td>
        <td>{{ contest.cfContest }}</td>
        <td>{{ contest.cfType }}</td>
        <td>{{ contest.cfDate }}</td>
        <td>{{ contest.cfTime }}</td>
        <td>{{ contest.cfNum }}</td>
      </tr>
      </tbody>
    </table>
    <div>
      <button @click="prevPage" :disabled="pageNum === 1">上一页</button>
      <button @click="nextPage" :disabled="contests.length < pageSize">下一页</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      contests: [],
      pageNum: 1,
      pageSize: 10,
      searchQuery: ''
    };
  },
  mounted() {
    this.fetchContests();
  },
  methods: {
    fetchContests() {
      axios.post('/cfcontest/listPage', {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        param: {
          cfContest: this.searchQuery
        }
      })
          .then(response => {
            this.contests = response.data.data;
          })
          .catch(error => {
            console.error("There was an error fetching the contests!", error);
          });
    },
    nextPage() {
      this.pageNum++;
      this.fetchContests();
    },
    prevPage() {
      if (this.pageNum > 1) {
        this.pageNum--;
        this.fetchContests();
      }
    }
  }
};
</script>

<style scoped>
/* 样式可以根据需要进行调整 */
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
}

th {
  background-color: #f2f2f2;
  text-align: left;
}

button {
  margin: 5px;
  padding: 5px 10px;
}
</style>
