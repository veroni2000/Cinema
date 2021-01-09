<template>
  <div>
    <b-table
      id = "screeningsTable"
      striped
      hover
      :items="screenings"
      :fields="fields"
    >
      <template v-for="field in fields" v-slot:[`cell(${field.key})`]="data">
        <div v-if="data.item.movie.title" v-bind:key="field">
          <router-link :to="{name: 'MovieTab', params:{ id: data.item.movie.movie_Id }}">
            {{data.item.movie.title}}
          </router-link>
        </div>
        <div v-if="data.item.time" v-bind:key="field">
          <router-link :to="{name: 'ScreeningTab', params:{ id: data.item.screening_id }}">
            {{data.item.time | moment("H:mm")}}
          </router-link>
        </div>
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
        { key: 'monday', label: 'Понеделник' },
        { key: 'tuesday', label: 'Вторник' },
        { key: 'wednesday', label: 'Сряда' },
        { key: 'thursday', label: 'Четвъртък' },
        { key: 'friday', label: 'Петък' }
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
