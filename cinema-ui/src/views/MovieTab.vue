<template>
  <div>
    <h1>{{Movie.title}}</h1>
    <div class = "container">
      <p class = "float-right">{{Movie.description}}</p>
      <img class = "float-left" src="/public/pictures/baloni.jpg">
    </div>
  </div>
</template>

<script>
import MoviesService from '../services/movies-service'
export default {
  name: 'MovieTab',
  data () {
    return {
      Movie: {
      }
    }
  },
  beforeRouteEnter (to, from, next) {
    MoviesService.getMovieById(to.params.id).then(
      response => {
        next(vm =>
          vm.setData(response)
        )
      }
    )
  },
  methods: {
    setData (response) {
      this.Movie = response.data
    }
  }
}
</script>
