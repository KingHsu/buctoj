import Vue from 'vue'
import App from './App.vue'
import './styles/base.css' // css 样式重置
import './styles/common.css' // 公共全局样式
import './assets/iconfont/iconfont.css' // 字体图标的样式
import echarts from 'echarts'
Vue.prototype.$echarts = echarts
Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
