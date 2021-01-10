import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import * as axios from 'axios'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import {
  BTable, BPagination, NavbarPlugin, BCarousel, BCarouselSlide,
  FormInputPlugin, BButton, BImg, BContainer, BRow, BCol, ImagePlugin
} from 'bootstrap-vue'

Vue.component('b-pagination', BPagination)
Vue.component('b-table', BTable)
Vue.component('b-button', BButton)
Vue.use(NavbarPlugin)
Vue.use(FormInputPlugin)
Vue.component('b-carousel-slide', BCarouselSlide)
Vue.component('b-carousel', BCarousel)
Vue.component('b-img', BImg)
Vue.component('b-row', BRow)
Vue.component('b-col', BCol)
Vue.component('b-container', BContainer)
Vue.prototype.$axios = axios
Vue.config.productionTip = false
Vue.use(require('vue-moment'))
Vue.use(ImagePlugin)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
