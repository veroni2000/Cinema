<template>
  <div>
    <b-table
      id = "screeningsTable"
      striped
      hover
      :items="screenings"
      :fields="fields"
      :current-page=1
      :per-page="0"
    >

      <template v-slot:cell(movie.title)="data">
        <div v-if="data.item.movie.title">
          <router-link :to="{name: 'MovieTab', params:{ id: data.item.movie.movie_Id }}">
            {{data.item.movie.title}}
          </router-link>
        </div>
      </template>
    </b-table>
    <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      aria-controls="screeningsTable"
    ></b-pagination>
  </div>
</template>

<script>
// import ScreeningsService from '../services/screenings-service'
export default {
  name: 'Screenings',
  data () {
    return {
      currentPage: '',
      rows: '',
      perPage: 5,
      screenings: [{
        id: '',
        movie: '',
        time: ''
      }],
      fields: [
        { key: 'movie', label: 'Филм' },
        { key: 'time', label: 'Час' }
      ],
      filters: {
        movie: ''
      }
    }
  },
  methods: {

  }
}
</script>

<style scoped>
</style>
