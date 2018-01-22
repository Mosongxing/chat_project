<template>
  <div class="login-wrapper" transition="loginslide">
    <div class="header">
      
    </div>
    <div class="body">
      <div class="-title">
        PHP研发群
      </div>
      <div class="-name">
        <label>用户名：</label>
        <input type="text" v-model="name" placeholder="请输入用户名">
      </div>
      <div class="-pwd">
        <label>密码：</label>
        <input type="text" v-model="pwd" placeholder="请输入密码">
      </div>
      <div class="-login">
        <span class="-btn" @click="login()">登录</span>
      </div>
    </div>
    <div class="foot">
      <span>战五渣交流群</span>
    </div>
  </div>
</template>

<script>
import CHAT from '../api/client'
export default {
  data () {
    return {
      name:'',
      pwd:'',
      socket:''
    }
  },
  ready(){
      if (CHAT.socket == null) {
        CHAT.init(this.$router)
      }
      if (localStorage.getItem('access_token') != null) {
        this.$router.go('/')
      }
  },
  methods:{
    login(){
      if (!this.name.trim()) {
        alert("昵称不能为空！")
        return
      }

      if (!this.pwd.trim()) {
        alert("密码不能为空！")
        return
      }

      CHAT.name = this.name
      CHAT.pwd = this.pwd
      CHAT.login()
      // this.$router.go('/')
    }
  },

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang='less'>

.login-wrapper{
  background-color: #f5f7f9;
  position: absolute;
  top: 0;
  left: -100%;
  right: 100%;
  bottom: 0;
  .header{
    width: 100%;
    height: 30%;
    max-height: 300px;
    background-color: #3091f2;
    background-size: contain;
  }
  .body{
    display: flex;
    flex-direction: column;
    padding: 20px;
    .-title{
      height: 80px;
      font-size: 22px;
      display: flex;
      justify-content: center;
      align-items: center;
      font-weight: bolder;
      color: #999;
    }
    .-name,.-pwd{
      /*background-color: #eee;*/
      display: flex;
      height: 60px;
      justify-content: center;
      align-items: center;
      font-size: 18px;
      color: #999;
      border-top: solid 1px rgba(0,0,0,0.05);
      label{
        color: #999;
        width: 80px; /*加长label标签*/
        text-align: right;/*然后文字居右，就可以实现用户名和密码右对齐*/
      }
      input{
        font-size: 16px;
        box-sizing: border-box;
        height: 100%;
        border: none;
        outline: none;
        padding: 5px;
        color: #666;
        background-color: rgba(0,0,0,0);
      }
      

    }
    .-login{
      display: flex;
      height: 120px;
      align-items: center;
      font-size: 16px;
      color: #999;
      .-btn{
        background-color: #3091f2;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;
        height: 40px;
        margin: 10px auto;
        color: #fff;
        font-weight: bolder;
      }
    }
  }
  .foot{
    /*position: absolute;
    bottom: 0;*/
    /*background-color: #098;*/
    height: 80px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    font-size: 13px;
    color: #999;
    span{
      display: inline-block;
    }
    span:first-child{
      font-size: 15px;
    }
  }
  a{
    color: #999;
  }
}
/* 必需 */
.loginslide-transition {
  transition: all .3s ease;
  transform: translate(100%,0);
}

/* .loginslide-enter 定义进入的开始状态 */
/* .loginslide-leave 定义离开的结束状态 */
.loginslide-leave, .loginslide-enter {
  transform: translate(0%,0);
}
</style>