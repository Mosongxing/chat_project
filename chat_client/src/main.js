import Vue from 'vue'
import VueRouter from 'vue-router'
import routerMap from './router/index'
import App from './App'
import Base64 from 'js-base64';

Vue.use(VueRouter)
// Vue.use(iView)

let router = new VueRouter({
	// history: 'true'
})
routerMap(router)
/* eslint-disable no-new */
let vm={
  components: { App }
}

router.start(vm, 'body')