<template>
  <div>
      <b-navbar toggleable="lg" type="dark" variant="info">
    <b-navbar-brand href="#">NavBar</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
        <b-nav-form>
        <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
           </b-nav-form>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
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
          <td v-for="field in fields" :key="field.id">
            <input v-model="filters[field.key]">
          </td>
        </template>
        <template v-slot:cell(title)="data">
          <div v-if="data.item.title">
            <router-link :to="{name: 'MovieTab', params:{ id: data.item.movie_Id }}">
            {{data.item.title}}
            </router-link>
          </div>
          <div v-else>
            Няма такъв филм
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
        date: ''
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

</style>
