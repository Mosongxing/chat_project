import Vue from 'vue'
import VueRouter from 'vue-router'
import routerMap from './router/index'
import App from './App'
import Base64 from 'js-base64';
// import iView from 'iview'
// import 'iview/dist/styles/iview.css'

Vue.use(VueRouter)
// Vue.use(iView)

let router = new VueRouter({
	mode: 'history'
})
routerMap(router)
/* eslint-disable no-new */
let vm={
  components: { App }
}

router.start(vm, 'body')