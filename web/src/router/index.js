import VueRouter from 'vue-router'
import Layout from '@/views/Layout.vue'
import OjIndex from '@/views/OjIndex.vue'
import OjUserList from '@/views/OjUserList.vue'
import OjCodeforces from '@/views/OjCodeforces.vue'
import OjAtcoder from '@/views/OjAtcoder.vue'
import OjCharts from '@/views/OjCharts.vue'
import OjSign from '@/views/OjSign.vue'
import OjRegister from '@/views/OjRegister.vue'
import NotFound from '@/views/NotFound.vue'
import Vue from 'vue'
Vue.use(VueRouter)

const router = new VueRouter({
    mode: "history",
    routes: [
      {
        path: '/', 
        redirect:'/OjIndex',
        component: Layout,
        children: [
          {path: '/OjIndex', component: OjIndex},
          {path: '/OjUserList', component: OjUserList},
          {path: '/OjCodeforces', component: OjCodeforces},
          {path: '/OjAtcoder', component: OjAtcoder},
          {path: '/OjCharts', component: OjCharts},
          {path: '/OjSign', component: OjSign},
          {path: '/OjRegister', component: OjRegister},
        ]
      },
      {path: '*', component: NotFound}
    ]
  })

  export default router