<template>
  <div>
    <h1>{{Movie.title}}</h1>
    <br>
    <div class="container">
      <p style = "font-size:120%;">
        <img :src="'/pictures/' + Movie.picture.toString()"  width="300" style="float:left; padding-right: 40px;">
        <ul style="list-style-type:none; text-align:left;">
          <li>Режисьор: {{Movie.director}}</li>
          <li>Актьори: {{Movie.actors}}</li>
          <li>Дата: {{Movie.date}}</li>
          <li>Държава: {{Movie.country}}</li>
          <li>Описание: {{Movie.description}}</li>
        </ul>
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
float{
  float: left;
  float: right;
}
</style>
