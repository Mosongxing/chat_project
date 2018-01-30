<template>
  <div class="body-wrapper">
    <template v-for="msgObj in CHAT.msgArr">
      <!-- <p>{{msgObj.msg_type}}</p> -->
      <template v-if="msgObj.msg_type=='sys_msg'">
        <system-msg :msg="msgObj.nickname" :msg_type="msgObj.msg_type"></system-msg>
      </template>
      <template v-if="msgObj.msg_type=='logout_msg'">
        <system-msg :msg="msgObj.nickname" :msg_type="msgObj.msg_type"></system-msg>
      </template>
      <template v-if="!msgObj.login&&!msgObj.logout">
        <other-msg v-if="msgObj.from_user_id!=CHAT.client_id && msgObj.msg_type=='say'" :nickname="msgObj.from_client_name" :msg="msgObj.content" :image="msgObj.image"></other-msg>
        <self-msg v-if="msgObj.from_user_id==CHAT.client_id && msgObj.msg_type=='say'" :msg="msgObj.content" :image="msgObj.image"></self-msg>
      </template>
    </template>
    <!-- <other-msg></other-msg> -->
  </div>

</template>
<script>
import OtherMsg from './OtherMsg'
import SelfMsg from './SelfMsg'
import SystemMsg from './SystemMsg'

import CHAT from '../api/client'
export default {
  data () {
    return {
      CHAT,
    }
  },
  ready(){
    // console.log(13123123213)
    if (localStorage.getItem('access_token') == null) {
      this.$router.go('/login')
    }

    // 页面刷新重连
    if (CHAT.socket == null) {
      CHAT.init(this.$router, 'relogin')
    }
  },
  components:{
    OtherMsg,
    SelfMsg,
    SystemMsg
  },
  methods:{
    // visit(){
//       let xhr = new XMLHttpRequest();
//       xhr.open('POST', 'http://item.redream.cn/statistics/chat/chat_visit.php');
// 　　  xhr.send();
//       xhr.onreadystatechange = function(){
//   　　　　if ( xhr.readyState == 4 && xhr.status == 200 ) {
//   // 　　　　　　alert( xhr.responseText );
//   　　　　} else {
//   // 　　　　　　alert( xhr.statusText );
//   　　　　}
//   　　}
    // }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang='less'>
.body-wrapper{
  background-color: #f6f6f6;
  height: ~'calc(100% - 90px)';
  overflow-y: scroll;

}
::-webkit-scrollbar {/*隐藏滚轮*/
display: none;
}
</style>