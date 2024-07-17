import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './utils/element-ui.js'
import axios from 'axios'

Vue.prototype.$axios = axios
Vue.prototype.$store = store
// Vue.prototype.$httpUrl = 'http://localhost:9090'
Vue.prototype.$httpUrl = 'http://8.130.11.95:9090'
Vue.config.productionTip = false
axios.defaults.withCredentials = true

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
