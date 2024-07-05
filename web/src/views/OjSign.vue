<template>
  <div class="main">
    <div class="body">
      <div class="box">
        <div class="username">
          <div>username</div>
          <div class="inputBox">
            <input  type="text" v-model="username">
          </div>
        </div>
        <div class="password">
          <div>password</div>
          <div class="inputBox">
            <input  type="password" v-model="password">
          </div>
        </div>
        <div class="sign" @click="sign()">
          <div>登录</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      username: '',
      password: ''
    }
  },
  methods: {
    sign(){
      return;
    }
  }
}
</script>

<style scoped>
  .body { 
    width: 100%;
    height: 100%;
    display: flex;
  }
  .box {
    display: block;
    width: 400px;
    height: 200px;
    border: 0.25px solid;
    position:absolute; left:0; top:0; right:0; bottom:0; margin:auto;
  }
  .username {
    display: flex;
  }
  .password {
    display: flex;
  }
  .inputBox {
    border: 0.25px solid;
    border-radius: 5px;
  }
  .sign {
    display: flex;
  }
</style>