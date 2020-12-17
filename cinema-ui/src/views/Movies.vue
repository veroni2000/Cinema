<template>
  <div>
    <button v-on:click = "searchMovies">Търси</button>
      <b-table
        id = "moviesTable"
        striped
        hover
        :items="movies"
        :fields="fields"
        :current-page="currentPage"
        :per-page="0"
      >

        <template slot="top-row" slot-scope="{fields}">
          <td v-for="field in fields" :key="field.id">
            <input v-model="filters[field.key]">
          </td>
        </template>
        <template v-slot:cell(title)="data">
          <div v-if="data.item.title">
            {{data.item.title}}
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
        title: '',
        date: ''
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
