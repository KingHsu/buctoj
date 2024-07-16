import { getInfo } from '@/utils/storage'
export default {
  namespaced: true,
  state () {
    return {
      logState: getInfo().stuNo !== 0, // 用于跟踪用户登录状态
      isAdmin: getInfo().stuMan // 用于存储是否为管理员信息
    }
  },
  mutations: {
    login (state) {
      state.logState = true
    },
    logout (state) {
      state.logState = false
      state.isAdmin = '0'
    },
    setAdmin (state, obj) {
      state.isAdmin = obj.stuMan
    }
  },
  actions: {
    login (context) {
      context.commit('login')
    },
    logout (context) {
      context.commit('logout')
    },
    setAdmin (context, obj) {
      context.isAdmin = obj.stuMan
    }
  },
  getters: {
    getLogState (state) {
      return state.logState
    },
    getIsAdmin (state) {
      return state.isAdmin
    }
  }
}
