<style>
body{
  font-family: Arial;
}
.mC{
  width: 50%;
  margin-left: 25%;
  border: 3px solid #2c3e50;
  position: center;
  color: #2c3e50;
  overflow: auto;
  margin-bottom: 5%;
}
.sImg{
  width: 40%;
  float: right;
  padding-left: 5%;
}
.sTittle{
  padding: 5%;
  text-align: left;
  font-size: 40px;
  width: 100%;
  overflow: auto;
}
.sTittle .rl{
  color: #2c3e50;
  text-decoration: none;
}
.sTittle .rl:hover{
  text-decoration: underline;
}
.sTittle p{
  font-size: 20px;
}
.myForm{
  padding-bottom: 20px;
}
.myButton{
  background-color: #2c3e50;
  height: 50px;
}
</style>
<template>
<div>
  <div class="mC">
    <div class="sTittle">
      <img class="sImg" :src="'/pictures/' + Screening.movie.picture">
      <router-link class="rl" :to="{name: 'MovieTab', params:{ id: Screening.movie.movie_Id }}">
      {{Screening.movie.title}}
      </router-link>
      <p>
        Резервация на билет за филма {{Screening.movie.title}}, чиято прожекция ще бъде излъчена на {{Screening.time | moment('D.MM.YYYY')}} в {{Screening.time | moment('H:mm')}}ч.
      </p>
      <p>Цена: 9.50лв.</p>
    </div>
    <b-form class="myForm" @submit.prevent="submit">
      <b-col style="margin-left: 10%; width: 80%">
      <b-form-input
        placeholder="Email"
        type="email"
        v-model="email"
        name="email"
        required
      >
      </b-form-input>
      </b-col>
      <b-row style="margin: 3% 10% 10%">
        <b-col style="width: 1%;">
          Брой билети:
          <b-form-input
            name="br"
            v-model="br"
            type="number"
            min="0"
            :max="Screening.seats"
          >
          </b-form-input>
        </b-col>
      <b-col style="width: 30%; margin-top: 2%; margin-left: 50%">
        <b-button class="myButton" type="submit" v-on:click="submit">Резервирай</b-button>
      </b-col>
      </b-row>
    </b-form>

  </div>
</div>
</template>

<script>
import ScreeningsService from '../services/screenings-service'
import axios from 'axios'
export default {
  name: 'ScreeningTab',
  data () {
    return {
      Screening: [{
        screening_id: parseInt(''),
        movie: [{
          movie_Id: '',
          title: '',
          date: '',
          picture: ''
        }],
        seats: '',
        time: ''
      }],
      types: [
        'text',
        'number',
        'email',
        'password',
        'search',
        'url',
        'tel',
        'date',
        'time',
        'range',
        'color'
      ]
    }
  },
  beforeRouteEnter (to, from, next) {
    ScreeningsService.getScreeningById(to.params.id).then(
      response => {
        next(vm =>
          vm.setData(response)
        )
      }
    )
  },
  methods: {
    setData (response) {
      this.Screening = response.data
    },
    submit: function (event) {
      if (event) {
        axios.post('http://localhost:8080/tickets/save', {
          screening_id: this.Screening.screening_id,
          email: this.email,
          seats: this.Screening.seats,
          ticketNumber: this.br
        })
          .then((res) => {
          })
          .catch((error) => {
            console.log(error)
          }).finally(() => {
          })
        window.location.href = 'http://localhost:8081/#/screenings'
      }
    }
  }
}
</script>
