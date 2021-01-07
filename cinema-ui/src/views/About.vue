<template>
  <div>
    <b-table
      id = "screeningsTable"
      striped
      hover
      :items="screenings"
      :fields="fields"
    >

      <template v-slot:cell(movie.title)="data">
        <router-link :to="{name: 'MovieTab', params:{ id: data.item.movie.movie_Id }}">
          {{data.item.movie.title}}
        </router-link>
      </template>
      <template v-slot:cell(time)="data">
        <router-link :to="{name: 'ScreeningTab', params:{ id: data.item.screening_id }}">
          {{data.item.time}}
        </router-link>
      </template>
    </b-table>
  </div>
</template>

<script>
import ScreeningsService from '../services/screenings-service'
export default {
  name: 'Screenings',
  data () {
    return {
      screenings: [{
        screening_id: '',
        movie: [{
          movie_Id: '',
          title: '',
          date: ''
        }],
        time: ''
      }],
      fields: [
        { key: 'movie.title', label: 'Филм' },
        { key: 'time', label: 'Час' }
      ]
    }
  },
  mounted () {
    this.getFutureScreenings()
  },
  methods: {
    getFutureScreenings () {
      ScreeningsService.getFutureScreenings()
        .then(response => {
          this.screenings = response.data
        })
    }

  }
}
</script>

<style scoped>
</style>
