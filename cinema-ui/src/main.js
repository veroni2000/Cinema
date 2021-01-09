import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import * as axios from 'axios'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import { BTable, BPagination, NavbarPlugin, BCarousel, BCarouselSlide, FormInputPlugin, BButton } from 'bootstrap-vue'
Vue.component('b-pagination', BPagination)
Vue.component('b-table', BTable)
Vue.component('b-button', BButton)
Vue.use(NavbarPlugin)
Vue.use(FormInputPlugin)
Vue.component('b-carousel-slide', BCarouselSlide)
Vue.component('b-carousel', BCarousel)
Vue.prototype.$axios = axios
Vue.config.productionTip = false
Vue.use(require('vue-moment'))

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
