<style>
.mC2{
  width: 70%;
  margin-left: 15%;
  border: 3px solid #2c3e50;
  position: center;
  color: #2c3e50;
  overflow: auto;
  margin-bottom: 5%;
  padding-bottom: 5%;
}
</style>
<template>
  <div class="mC2">
    <h1>{{Movie.title}}</h1>
    <br>
    <div class="container">
      <p style = "font-size:120%;">
        <img class = "mImg" :src="'/pictures/' + Movie.picture.toString()">
        <ul class = "mDesc">
          <li><b>Режисьор:</b> {{Movie.director}}</li>
          <li><b>Актьори:</b> {{Movie.actors}}</li>
          <li><b>Дата:</b> {{Movie.date | moment('DD MMM YYYY')}}</li>
          <li><b>Държава:</b> {{Movie.country}}</li>
          <li><b>Описание:</b> {{Movie.description}}</li>
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
.mDesc{
  list-style-type:none;
  text-align:left;
}
.mImg{
  width: 300px;
  float:left;
  padding-right: 40px;
}
</style>
