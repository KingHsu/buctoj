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
import EchartOne from '@/views/Echarts/EchartOne.vue'
import EchartTwo from '@/views/Echarts/EchartTwo.vue'
import EchartThree from '@/views/Echarts/EchartThree.vue'
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
        path: 'EchartOne',
        component: EchartOne
      },
      {
        path: 'EchartTwo',
        component: EchartTwo
      },
      {
        path: 'EchartThree',
        component: EchartThree
      },
      {
        path: 'LoginIndex',
        component: LoginIndex
      },
      {
        path: 'RegisterIndex',
        component: RegisterIndex
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
