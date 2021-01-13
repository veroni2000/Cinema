<style>
.screeningsTable {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  text-align: center;
}
.screeningsTable th{
  border: 1px solid #2c3e50;
  padding: 10px;
  width: 150px;
  background-color: #2c3e50;
  color: white;
}
.screeningsTable td{
  width: 150px;
  height: 150px;
  text-align: center;
  padding: 10px;
}
.screeningsTable .rl{
  color: #2c3e50;
  background-color: white;
  border: 2px solid #2c3e50;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin-bottom: 10px;
  padding-top: 8px;
}
.screeningsTable .rl:hover{
  background-color: #2c3e50;
  color: white;
  text-decoration: none;
}
</style>
<template>
  <div>
    <v-table striped hover class="screeningsTable">
      <template>
        <span v-bind:key="field" v-for="field in fields">
      <tr>
        <th v-bind:key="field">{{field.label}}</th>
       </tr>
        <td>
          <div v-bind:key="screening" v-for="screening in screenings">
          <tr v-bind:key="screening" v-if="( moment(screening.time).format('ddd D.MM.YYYY') === (field.key))">
           <router-link class="rl" :to="{name: 'ScreeningTab', params:{ id: screening.screening_id }}">
            <p> {{screening.movie.title}}
             {{screening.time | moment('H:mm')}}
            </p>
             </router-link>
          </tr>
          </div>
        </td>
        </span>
      </template>
    </v-table>

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
      date1: '',
      date2: '',
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
  // result: this.getScreeningsByDate(new Date(day1), new Date(day2))
  mounted () {
    this.getFutureScreenings()
    // this.getScreeningsByDate(this.date1, this.date2)
  },
  methods: {
    getFutureScreenings () {
      ScreeningsService.getFutureScreenings()
        .then(response => {
          this.screenings = response.data
        })
    },
    getScreeningsByDate (date1, date2) {
      ScreeningsService.getScreeningsByDate(date1, date2)
        .then(response => {
          this.screenings = response.data
        })
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
