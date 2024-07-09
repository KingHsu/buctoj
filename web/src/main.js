import Vue from 'vue'
import App from './App.vue'
import './styles/base.css' // css 样式重置
import './styles/common.css' // 公共全局样式
import './assets/iconfont/iconfont.css' // 字体图标的样式
import echarts from 'echarts'
import ElementUI from 'element-ui';
import axios from 'axios'
import 'element-ui/lib/theme-chalk/index.css';
<<<<<<< HEAD
Vue.prototype.$axios=axios;
Vue.prototype.$httpUrl='http://localhost:9090'
=======
import axios from 'axios'
import router from './router'
>>>>>>> c621415194a1cef042deced04105367a642debac
Vue.prototype.$echarts = echarts
Vue.prototype.$axios = axios
Vue.prototype.$httpUrl = 'http://localhost:9090'

Vue.config.productionTip = false

Vue.use(ElementUI)

new Vue({
  render: h => h(App),
  router
}).$mount('#app')
