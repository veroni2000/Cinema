import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Movies from '../views/Movies.vue'
import MovieTab from '../views/MovieTab.vue'
import ScreeningTab from '../views/ScreeningTab'
import Screenings from '../views/Screenings'
import Contacts from '../views/Contacts'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/movies',
    name: 'Movies',
    component: Movies
  },
  {
    path: '/contacts',
    name: 'Contacts',
    component: Contacts
  },
  {
    path: '/screenings',
    name: 'Screenings',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: Screenings
  },
  {
    path: '/movieTab',
    name: 'MovieTab',
    component: MovieTab
  },
  {
    path: '/screeningTab',
    name: 'ScreeningTab',
    component: ScreeningTab
  }
]

const router = new VueRouter({
  routes
})

export default router
