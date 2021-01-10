<template>
  <div id="ivan">
      <b-table
        id = "moviesTable"
        striped
        hover
        :items="movies"
        :fields="fields"
        :current-page=1
        :per-page="0"
      >
        <template slot="top-row" slot-scope="{fields}">
            <td v-for="(field, index) in fields" :key="field.id">
              <div v-if="index === fields.length - 1">
              </div>
              <div v-else class="myDiv">
                <form class="form-inline">
                  <b-form-input v-model="filters[field.key]" class="form-control mr-sm-2" type="search" placeholder="Search"></b-form-input>
                  <b-button v-on:click = "searchMovies">Търси</b-button>
                </form>
              </div>
            </td>
        </template>
        <template v-slot:cell(title)="data">
          <div v-if="data.item.title" class="movies">
           <router-link class="rl" :to="{name: 'MovieTab', params:{ id: data.item.movie_Id }}">
            <p>{{data.item.title}}</p>
              <img style="border-radius: 7%" :src="'/pictures/' + data.item.picture.toString()" width="100" >
            </router-link>
          </div>
          <div v-else>
            Няма такъв филм
          </div>
        </template>
        <template v-slot:cell(date)="data">
          <div v-if="data.item.date" class="rl">
            {{data.item.date | moment('MMM YYYY')}}
          </div>
        </template>
      </b-table>
      <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      @input="searchMovies"
      aria-controls="moviesTable"
    ></b-pagination>
  </div>
</template>

<script>
import MoviesService from '../services/movies-service'
export default {
  name: 'Movies',
  data () {
    return {
      currentPage: '',
      rows: '',
      perPage: 5,
      movies: [{
        id: '',
        title: '',
        date: '',
        picture: ''
      }],
      fields: [
        { key: 'title', label: 'Заглавие' },
        { key: 'date', label: 'Дата' }
      ],
      filters: {
        title: ''
      }
    }
  },
  mounted () {
    this.searchMovies()
  },
  methods: {
    searchMovies () {
      MoviesService.getMoviesPage(this.currentPage, this.perPage, this.filters).then(
        response => {
          this.movies = response.data.movies
          this.rows = response.data.totalItems
        },
        error => {
          this.content =
           (error.response && error.response.data) ||
           error.message ||
           error.toString()
        }
      )
    }
  }
}
</script>

<style scoped>
.myDiv{
  margin-left: 38%;
}
.movies{
  font-size: medium;
  color: black;
}
.rl{
  color: #2c3e50;
  font-size: large;
}

</style>
