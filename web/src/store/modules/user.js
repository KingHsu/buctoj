import { getInfo, setInfo, removeInfo } from '@/utils/storage'
export default {
  namespaced: true,
  state () {
    return {
      userInfo: getInfo()
    }
  },
  mutations: {
    setUserInfo (state, obj) {
      state.userInfo = obj
      setInfo(obj)
    },
    removeUserInfo (state) {
      state.userInfo = null
      removeInfo()
    }
  },
  actions: {},
  getters: {
    getUserInfo (state) {
      // console.log('state userInfo：' + state.userInfo)
      return state.userInfo
    }
  }
}
