import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import router from './router'
import './plugins/element.js'
// import echarts from 'echarts'
// Vue.prototype.$echarts = echarts

Vue.config.productionTip = false;
axios.defaults.baseURL = 'http://127.0.0.1:8888';

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
