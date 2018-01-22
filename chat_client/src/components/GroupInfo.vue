<template>
<div class="group-info-wrap" transition="slide">
	<group-info-head></group-info-head>
	<group-info-body></group-info-body>
</div>
</template>
<script>
import GroupInfoHead from './GroupInfoHead'
import GroupInfoBody from './GroupInfoBody'
import CHAT from '../api/client'
export default{
	data(){
		return {
			CHAT,
		}
	},
	ready(){
	    if (localStorage.getItem('access_token') == null) {
	      this.$router.go('/login')
	    }

	    // 页面刷新重连
	    if (CHAT.socket == null) {
	      CHAT.init(this.$router, 'relogin')
	    }
	},
	components: {
    GroupInfoHead,
    GroupInfoBody
  }
}
</script>
<style lang='less'>
	.group-info-wrap{
		height: 100%;
		background-color: #eee;
		/*position: relative;*/
	}
	/* 必需 */
	.slide-transition {
	  transition: all .3s ease;
	  transform: translate(0% , -100%);
	}

	/* .slide-enter 定义进入的开始状态 */
	/* .slide-leave 定义离开的结束状态 */
	.slide-enter, .slide-leave {
		transform: translate(100%,-100%);
	}
</style>