<template>
  <div>
    <h1>{{Movie.title}}</h1>
    <div class = "container">
      <p style="font-size:120%;text-align:justify;">
        <img :src="'/pictures/' + Movie.picture.toString()"  width="300" style="float:left">
        {{Movie.description}}
      </p>
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
<style scoped>
  float-right {
   float : right;
  }
  float-left  {
   float : left;
  }
</style>
