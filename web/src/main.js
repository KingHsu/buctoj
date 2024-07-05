import Vue from 'vue'
import App from './App.vue'
import './styles/base.css' // css 样式重置
import './styles/common.css' // 公共全局样式
import './assets/iconfont/iconfont.css' // 字体图标的样式
import echarts from 'echarts'
import VueRouter from 'vue-router'
import OjIndex from './views/OjIndex.vue'
import OjUserList from './views/OjUserList.vue'
import OjCodeforces from './views/OjCodeforces.vue'
import OjAtcoder from './views/OjAtcoder.vue'
import OjCharts from './views/OjCharts.vue'
import OjSign from './views/OjSign.vue'
import OjRegister from './views/OjRegister.vue'
Vue.prototype.$echarts = echarts
Vue.config.productionTip = false
Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {path: '/OjIndex', component: OjIndex},
    {path: '/OjUserList', component: OjUserList},
    {path: '/OjCodeforces', component: OjCodeforces},
    {path: '/OjAtcoder', component: OjAtcoder},
    {path: '/OjCharts', component: OjCharts},
    {path: '/OjSign', component: OjSign},
    {path: '/OjRegister', component: OjRegister},
  ]

  

})

new Vue({
  render: h => h(App),
  router
}).$mount('#app')
