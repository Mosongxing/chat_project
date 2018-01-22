<template>
<div class="group-info-body-wrap">
	<div class="-bar"></div>
	<div class="-members" >
		<div class="-member" v-for="userObj in CHAT.onlineUsers" @click="showInfo(userObj)">
			<img class="-header" :src="userObj.image">
			<span class="-name">
				{{userObj.nickname}}
			</span>
		</div>
		<!-- 占位 -->
		<div class="-member" v-for="i in 9">
		</div>
	</div>
	<div class="-bar"></div>
	<div class="-self">
		<div class="-title">
			我在本群的信息
		</div>
		<div class="-info">
			<img class="-header" :src="image">
			<span class="-name">{{nickname}}</span>
			<span class="-modify" @click="show()">修改</span>
		</div>
	</div>
	<div class="-bar"></div>
	<div class="-del" @click="del()">删除并退出</div>
	<div class="-bar"></div>
	<div class="-bar"></div>
</div>
<dialog v-if="isShow" :fast-close="false">
	<div class="modify-box">
		<div class="-header">
			<img class="-img" :src="image">
			<!-- <input type='file' class="-notice" value="点击更换头像" style="display: none"> -->
			<button type="button" class="-notice"  @click="changeImage()">点击更换头像</button>
		</div>
		<div class="-name">
			<label>群昵称：</label>
			<input type="text" v-model="nickname" placeholder="10字以内">
		</div>
		<div class="-save">
			<span class="-btn" @click="save()">保存</span>
		</div>
	</div>
</dialog>
<dialog v-if="isShowF">
	<div class="f-info">
		<div class="-name">
			<label>用户名：</label>
			<div>{{username}}</div>
		</div>
		<div class="-sign">
			<label>签名：</label>
			<div>{{sign}}</div>
		</div>
		<div class="-save">
			<span class="-btn" @click="closeF()">关闭</span>
		</div>
	</div>
</dialog>

</template>
<script>
import CHAT from '../api/client'
import dialog from './util/dialog'
export default{
	data(){
		return {
			CHAT:CHAT,
			nickname: localStorage.getItem('nickname'),
			username: localStorage.getItem('username'),
			image: localStorage.getItem('image'),
			isShow:false,
			isShowF:false,
			
		}
	},
	ready(){
		// console.log(CHAT.onlineUsers,99)
	},
	components:{
		dialog
	},
	methods:{
		changeImage(){
		},
		save(){
			if (localStorage) {
				localStorage.setItem('nickname',this.nickname)
				localStorage.setItem('image',this.image)
			}
			this.isShow=false
			// this.CHAT.changeInfo()
		},
		show(){
			this.isShow=true
		},
		del(){
			this.CHAT.logout()
			// this.$router.go('/login')
		},
		showInfo(userObj){
			console.log(userObj)
			this.username = userObj.username
			this.nickname = userObj.nickname
			this.sign = userObj.sign
			this.isShowF = true
		},
		closeF(){
			this.isShowF=false
		}
	}
}
</script>
<style lang='less'>
	.group-info-body-wrap{
		display: flex;
		flex-direction: column;
		.-bar{
			height: 20px;
			width: 100%;
			background-color: #eee;
		}
		.-members{
			display: flex;
			background-color: #fff;
			flex-wrap: wrap;
			justify-content: space-around;
			.-member{
				display: inline-flex;
				flex-direction: column;
				/*background-color: #798;*/
				box-sizing: border-box;
				padding: 10px 20px;
				width: 90px;
				min-width: 80px;
				.-header{
					display: flex;
					justify-content: center;
					align-items: center;
					height: 50px;
					width: 50px;
					/*background-color: #79f;*/
				}
				.-name{
					display: flex;
					justify-content: center;
					align-items: center;
					font-size: 14px;
				}
				&:nth-last-child(10) ~ .-member{
					height: 0;
					padding: 0;
				}
			}
		}
		.-self{
			display: flex;
			flex-direction: column;
			padding: 0 10px;
			background-color: #fff;
			.-title{
				display: flex;
				align-items: center;
				height: 50px;
				border-bottom: 1px solid rgba(0,0,0,0.05);
			}
			.-info{
				display: flex;
				align-items: center;
				height: 50px;
				position: relative;
				border-bottom: 1px solid rgba(0,0,0,0.05);
				.-header{
					height: 40px;
					width: 40px;
					background-color: #654;
					/*border-radius: 25%;*/
				}
				.-name{
					padding: 0 10px;
					font-size: 16px;
				}
				.-modify{
					position: absolute;
					right: 10px;
					top: 10px;
					background-color: #3091f2;
					display: flex;
					height: 30px;
					justify-content: center;
					align-items: center;
					padding: 0 20px;
					color: #fff;
				}

			}
			.-notice{
				display: flex;
				flex-direction: column;
				height: 60px;
			}
		}
		.-del{
			background-color: #e64340;
			margin: 0 10px;
			display: flex;
			height: 40px;
			color: #fff;
			justify-content: center;
			align-items: center;
			font-weight: bolder;
		}
		.-notice{
			display: flex;
			height: 40px;
			justify-content: center;
			align-items: center;
			font-size: 14px;
			color: #999;
		}
	}
	.modify-box{
		background-color: #fff;
		height: 200px;
		width: 80%;
		padding: 10px;
		.-header{
			height: 60px;
			/*background-color: #777;*/
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
			.-img{
				display: block;
				height: 40px;
				width: 40px;
				background-color: #090;
				border-radius: 50%;
			}
			.-notice{
				display: block;
				font-size: 14px;
				color: #999;
			}

		}
		.-name,.-sign,.-save{
			/*background-color: #eee;*/
			display: flex;
			height: 40px;
			align-items: center;
			font-size: 16px;
			label{
				box-sizing: border-box;
				height: 32px;
				border: none;
				outline: none;
				padding: 5px;
				color: #666;
				background-color: rgba(0,0,0,0.02);				
			}
			input {
				box-sizing: border-box;
				height: 25px;
				border: none;
				outline: none;
				padding: 5px;
				color: #666;
				background-color: rgba(0,0,0,0.02);				
				font-size: 16px;			
			}
			.-btn{
				background-color: #00AAFF;
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
	.f-info{
		background-color: #fff;
		height: 150px;
		width: 80%;
		padding: 10px;
		.-header{
			height: 60px;
			/*background-color: #777;*/
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
			.-img{
				display: block;
				height: 40px;
				width: 40px;
				background-color: #090;
				border-radius: 50%;
			}
			.-notice{
				display: block;
				font-size: 14px;
				color: #999;
			}

		}
		.-name,.-sign,.-save{
			/*background-color: #eee;*/
			display: flex;
			height: 50px;
			align-items: center;
			font-size: 16px;
			justify-content: left;
			label {
				width: 70px; /*加长label标签*/
        		text-align: right;/*然后文字居右，就可以实现用户名和密码右对齐*/
			}
			span {
				box-sizing: border-box;
				height: 25px;
				border: none;
				outline: none;
				padding: 5px;
				color: #666;
				background-color: rgba(0,0,0,0.02);
			}
			.-btn{
				background-color: #00AAFF;
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
</style>