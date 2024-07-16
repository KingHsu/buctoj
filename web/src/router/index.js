import Vue from 'vue'
import VueRouter from 'vue-router'
import LayoutIndex from '../views/layout/Layout.vue'
import OjHome from '@/views/layout/Home.vue'
import UserList from '@/views/layout/UserList.vue'
import CodeforcesList from '@/views/Codeforces/CodeforcesList.vue'
import CodeforcesRank from '@/views/Codeforces/CodeforcesRank.vue'
import AtcoderList from '@/views/Atcoder/AtcoderList.vue'
import AtcoderRank from '@/views/Atcoder/AtcoderRank.vue'
import LoginIndex from '@/views/layout/Login.vue'
import RegisterIndex from '@/views/layout/Register.vue'
import CodeforcesChart from '@/views/Echarts/CodeforcesChart.vue'
import AtcoderChart from '@/views/Echarts/AtcoderChart.vue'
import StuChart from '@/views/Echarts/StuChart.vue'
import ClassChart from '@/views/Echarts/ClassChart.vue'
import UserInfo from '@/views/layout/UserInfo.vue'
import NotFound from '@/views/layout/NotFound.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    component: LayoutIndex,
    redirect: '/OjHome',
    children: [
      {
        path: 'OjHome',
        component: OjHome
      },
      {
        path: 'UserList',
        component: UserList
      },
      {
        path: 'CodeforcesList',
        component: CodeforcesList
      },
      {
        path: 'CodeforcesRank',
        component: CodeforcesRank
      },
      {
        path: 'AtcoderList',
        component: AtcoderList
      },
      {
        path: 'AtcoderRank',
        component: AtcoderRank
      },
      {
        path: 'CodeforcesChart',
        component: CodeforcesChart
      },
      {
        path: 'AtcoderChart',
        component: AtcoderChart
      },
      {
        path: 'StuChart',
        component: StuChart
      },
      {
        path: 'ClassChart',
        component: ClassChart
      },
      {
        path: '/LoginIndex',
        component: LoginIndex,
        meta: {
          showNav: true
        }
      },
      {
        path: '/RegisterIndex',
        component: RegisterIndex,
        meta: {
          showNav: true
        }
      },
      {
        path: '/UserInfo',
        component: UserInfo
      }
    ]
  },
  {
    path: '*',
    component: NotFound
  }
]

const router = new VueRouter({
  routes
})

export default router
