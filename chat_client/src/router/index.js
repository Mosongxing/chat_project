import GroupInfo from '../components/GroupInfo'
import Login from '../components/login'
import Register from '../components/register'
export default function (router) {
  router.map({
    /**
     * @param {String} from '/store/ab' or '/store/side'
     */
    '/groupinfo': {
      name: 'groupinfo',
      component: GroupInfo
    },
    '/login': {
      name: 'login',
      component: Login
    },
    '/register': {
      name: 'register',
      component: Register
    }
  })
}