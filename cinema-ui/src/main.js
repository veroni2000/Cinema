import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import * as axios from 'axios'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
<<<<<<< HEAD
import { BTable, BPagination, NavbarPlugin, BCarousel, BCarouselSlide, BNavbar } from 'bootstrap-vue'
=======
import { BTable, BPagination, NavbarPlugin, BCarousel, BCarouselSlide, FormInputPlugin, BButton } from 'bootstrap-vue'
>>>>>>> f32b299ef13b3cc499ce20328d4d99e3a93e23e3

Vue.component('b-pagination', BPagination)
Vue.component('b-table', BTable)
Vue.component('b-button', BButton)
Vue.use(NavbarPlugin)
Vue.use(FormInputPlugin)
Vue.component('b-carousel-slide', BCarouselSlide)
Vue.component('b-carousel', BCarousel)
Vue.prototype.$axios = axios
Vue.config.productionTip = false
Vue.component('b-navbar', BNavbar)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
