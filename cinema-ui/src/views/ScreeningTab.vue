<style>
.mC{
  width: 41%;
  height: 500px;
  margin-left: 28%;
  background-color: #42b983;
  border: 1px solid green;
  position: center;
}
.sImg{
  margin-top: -3%;
  position: fixed;
}
.sTittle{
  margin-top: 3%;
  text-align: left;
  font-size: 40px;
  margin-left: 2%;
  font-family: Arial;
}
.Ti{
  margin-top: 25%;
  font-family: Arial;
}
</style>
<template>
<div>
  <div class="mC">
    <div class="sTittle">
      {{Screening.movie.title}}
    </div>
    <img class="sImg" :src="'/pictures/' + Screening.movie.picture.toString()" width="200" >
    <p class="Ti">
      Закопуване на билет за фила {{Screening.movie.title}}, чиято прожекция ще бъде излъчена на {{Screening.time | moment('D.MM.YYYY')}} в {{Screening.time | moment('H:mm')}}
    </p>
    <b-form>
      <b-row>
      <b-col sm="9" style="margin-left: 13%">
      <b-form-input
        placeholder="Email"
        size="lg"
      >
      </b-form-input>
      </b-col><br>
        <b-col sm="2" style="margin-left: 20%">
          Брой билети
          <b-form-input
            size="lg"
          >
          </b-form-input>
        </b-col>
      </b-row>
    </b-form>

  </div>
</div>
</template>

<script>
import ScreeningsService from '../services/screenings-service'
export default {
  name: 'ScreeningTab',
  data () {
    return {
      Screening: [{
        screening_id: '',
        movie: [{
          movie_Id: '',
          title: '',
          date: '',
          picture: ''
        }],
        seats: '',
        time: ''
      }]
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
    }
  }
}
</script>
