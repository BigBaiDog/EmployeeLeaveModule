import Vue from 'vue'
import VueRouter from 'vue-router'
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'login',
    components: {
      main: () => import('../views/Login.vue'),
    }
  },
  {
    path: '/',
    components: {
      header: Header,
      main: Home,
      footer: Footer
    }
  },
  {
    path: '/apply',
    name: 'apply',
    components: {
      header: Header,
      main: () => import('../views/Apply.vue'),
      footer: Footer
    }
  },
  {
    path: '/myleaves',
    name: 'myleaves',
    components: {
      header: Header,
      main: () => import('../views/MyLeaves.vue'),
      footer: Footer
    }
  },
  {
    path: '/myleave/:lid',
    name: 'myleave',
    components: {
      header: Header,
      main: () => import('../views/MyLeave.vue'),
      footer: Footer
    }
  },
  {
    path: '/allleave',
    name: 'allleave',
    components: {
      header: Header,
      main: () => import('../views/AllLeave.vue'),
      footer: Footer
    }
  },
  {
    path: '/leave/:lid',
    name: 'leave',
    components: {
      header: Header,
      main: () => import('../views/Leave.vue'),
      footer: Footer
    }
  },
  {
    path: '/calendar',
    name: 'calendar',
    components: {
      header: Header,
      main: () => import('../views/Calendar.vue'),
      footer: Footer
    }
  },
  {
    path: '/statistics',
    name: 'statistics',
    components: {
      header: Header,
      main: () => import('../views/Statistics.vue'),
      footer: Footer
    }
  },
]

const router = new VueRouter({
  routes
})

//导航守卫，未登录状态跳转到登录页面
router.beforeEach((to, from, next) => {
  if (to.name == 'login' || sessionStorage.getItem("name")) {
    next();
  } else {
    next({
      path: '/login'
    })
  }
})

export default router