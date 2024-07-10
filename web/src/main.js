import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './utils/element-ui.js'
import axios from 'axios'

Vue.prototype.$axios = axios
Vue.prototype.$httpUrl = 'http://localhost:9090'
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
