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
<!--        <div v-if="data.item.movie.title" v-bind:key="field">-->
          <div  v-bind:key="field" :v-if="(data.item.time | moment('ddd D.MM.YYYY')) === (field.key)">
              {{data.item.movie.title}}<p></p>
              {{data.item.time | moment('ddd D.MM.YYYY')}}
          </div>
<!--        </div>-->
      </template>
    </b-table>
  </div>
</template>

<script>
import moment from 'moment'
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
        { key: day1, label: day1.toString() },
        { key: day2, label: day2.toString() },
        { key: day3, label: day3.toString() },
        { key: day4, label: day4.toString() },
        { key: day5, label: day5.toString() },
        { key: day6, label: day6.toString() },
        { key: day7, label: day7.toString() }
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
    },
    isToday (date) {
      return moment(date).isSame(moment().clone().startOf('day'), 'd')
    }
  },
  formatter: (value, key, item) => {
    if (item.updated) {
      return moment(item.updated).format() // format(YOUR DATE FORMAT)
    }
  }
}
var day1 = moment().format('ddd D.MM.YYYY')
var day2 = moment().add(1, 'days').format('ddd D.MM.YYYY')
var day3 = moment().add(2, 'days').format('ddd D.MM.YYYY')
var day4 = moment().add(3, 'days').format('ddd D.MM.YYYY')
var day5 = moment().add(4, 'days').format('ddd D.MM.YYYY')
var day6 = moment().add(5, 'days').format('ddd D.MM.YYYY')
var day7 = moment().add(6, 'days').format('ddd D.MM.YYYY')
</script>

<style scoped>
</style>
