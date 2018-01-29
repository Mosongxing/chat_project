const CHAT = {
	msgObj:document.getElementsByClassName("body-wrapper")[0],
	socket:null,
	name:null, // 登陆时的用户名
	pwd:null,
	onlineCount:0,
	onlineUsers:null,
	client_id:null,
	router:null,
	time:null, // 定时器，用于断开重连
	msgArr:[],
	//让浏览器滚动条保持在最低部
	scrollToBottom:function(){
		// window.scrollTo(0, 900000);
	},
	//提交聊天消息内容
	send:function(msg) {
		if(msg != ''){
			let access_token = localStorage.getItem('access_token')
			let user_id = localStorage.getItem('user_id')
			let nickname = localStorage.getItem('nickname')
			let image = localStorage.getItem('image')
			let d = new Date()
			let time = d.getFullYear() + "-" +(d.getMonth()+1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds()
			let obj = `{"type": "say", "image": "${image}", "nickname": "${nickname}", "time": "${time}", "user_id": ${user_id}, "room_id": 1, "to_client_id": 0, "content": "${msg}", "access_token": "${access_token}"}`;
			this.socket.send(obj);
		}else{
			alert('消息不能为空')
		}
		
	},
	// 更新系统消息，本例中在用户加入、退出的时候调用
	updateSysMsg:function(o) {
		// 当前在线用户列表
		this.onlineUsers = o.user_list;
		// 当前在线人数
		this.onlineCount = o.user_num;
	},
	changeInfo(){
		var access_token = localStorage.getItem('access_token');
		this.socket.send(`{"access_token": "${access_token}"`);
	},
	init:function(router, action = null){
	    this.socket = new WebSocket("ws://songsong.net.cn:7272")

	    this.router = router
	    // 设定定时器
	    var time = setInterval(() => {
	    	let access_token = localStorage.getItem('access_token');
	    	let nickname = localStorage.getItem('nickname');
	    	this.socket.send(`{"type": "ping", "room_id": 1, "access_token": "${access_token}", "nickname": "${nickname}"}`)
	    }, 30000)

	    // 接收消息事件
	    this.socket.onmessage = (e) => {
			var data = (JSON.parse(e.data))

			// 登陆成功，接收用户信息，保存到localStore
			if (data.status == 1 && data.data.msg_type == 'login_msg') {
				// console.log(data.data);
				CHAT.msgArr = [];
				localStorage.setItem('nickname', data.data.user_data.nickname)
				localStorage.setItem('username', data.data.user_data.username)
				localStorage.setItem('image', data.data.image)
				localStorage.setItem('access_token', data.data.access_token)
				localStorage.setItem('user_id', data.data.from_user_id)
				CHAT.client_id = data.data.from_user_id
				router.go('/')
			} else if(data.code == 10086) {
				alert(data.msg)
			}

			// 登陆成功，接收用户聊天记录并跳转到聊天页面
			if (data.status == 1 && data.msg_type == 'my_msg') {
				// console.log(data.data);
				for (var i = data.data.length - 1; i >= 0; i--) {
					CHAT.msgArr.push(data.data[i])
				}
				// console.log(CHAT.msgArr);
			}

			// 登陆成功，广播系统消息
			if (data.status == 1 && data.data.msg_type == 'sys_msg') {
				CHAT.msgArr.push(data.data)
				CHAT.updateSysMsg(data.data)
			}

			// 在群上发言
			if (data.status == 1 && data.data.msg_type == 'say') {
				console.log(data.data);
				CHAT.msgArr.push(data.data)
			}

			// 退出登陆，用户清除缓存
			if (data.status == 1 && data.data.msg_type == 'logout') {
				localStorage.clear();
				// console.log(router.app.$route.name);
				if (router.app.$route.name == 'register') {
					router.go('/register')
				} else {
					router.go('/login')
				}
			}

			// 退出登录，广播系统消息
			if (data.status == 1 && data.data.msg_type == 'logout_msg') {
				CHAT.msgArr.push(data.data)
				CHAT.updateSysMsg(data.data)
				console.log(data.data);
			}

			// 重连成功，接收用户信息
			if (data.status == 1 && data.data.msg_type == 'relogin_msg') {
				// console.log(data.data);
				CHAT.msgArr = [];
				CHAT.client_id = data.data.from_user_id
				CHAT.updateSysMsg(data.data)
			}

			// 检查用户是否存在
			if (data.status == 1 && data.data.msg_type == 'check_user') {
				// console.log(data.data);
				if (data.data.user_exist == 1) {
					alert('账户已存在')
				}
			}

			// 用户注册
			if (data.status == 1 && data.data.msg_type == 'register') {
				// console.log(data.data);
				alert('注册成功')
				router.go('/login')
			} else if(data.code == 10087) {
				alert('注册失败')
			}

	    }
	     
	    // 断开连接则清除定时器和重新连接
	    this.socket.onclose = () => {
			clearInterval(time);
			if (CHAT.time != null) {
				clearInterval(CHAT.time);
				CHAT.time = null;
			}
			console.log('关闭连接')
			console.log('试图重新连接')
			CHAT.time = setInterval(() => {
		    	CHAT.init(CHAT.router, 'relogin')
		    }, 5000)
	    }

	    // 连接成功绑定事件
	    this.socket.onopen = () => {
	    	// 普通重新连接成功则清除定时器
	    	if (CHAT.time != null) {
	    		clearInterval(CHAT.time);
	    		CHAT.time = null;
	    	}

	    	// 重新连接则执行重新登录操作
	    	if (action == 'relogin') {
				let access_token = localStorage.getItem('access_token')
				let nickname = localStorage.getItem('nickname')
				this.socket.send(`{"type": "relogin", "room_id": 1, "nickname": "${nickname}", "access_token": "${access_token}"}`)
	    	}
	    	console.log("websocket握手成功");
	    }

	    // 断开
	    this.socket.onerror = () => {  
	      console.log("websocket出错");
	    }
	},
	login:function(){

		try {
			var login_data = `{"type":"login","client_name":"${this.name}","password":"${this.pwd}","room_id":1, "access_token": "null"}`;
			// console.log("发送登录数据:"+login_data)
			this.socket.send(login_data)
		} catch(exception) {
			alert('发生错误')
		}
	},
	// 退出，本例只是一个简单的刷新
	logout:function(){
		let access_token = localStorage.getItem('access_token');
		let nickname = localStorage.getItem('nickname');
		var logout_data = `{"type":"logout", "nickname":"${nickname}", "access_token":"${access_token}","room_id":1}`;
		this.socket.send(logout_data)
	},
	// 检查账户
	checkUser:function(name){
		let username = Base64.encode(name)
		let data = `{"type":"check_user", "username":"${username}", "room_id":1}`;
		this.socket.send(data)
	},
	// 注册账户
	register:function(name, pwd){
		let username = Base64.encode(name)
		let sha1 = require('sha1')
		let password = sha1(pwd)
		// console.log(password)
		let data = `{"type":"register", "username":"${username}", "password":"${password}","room_id":1}`;
		this.socket.send(data)
	}
}
export default CHAT