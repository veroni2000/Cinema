<template>
<div>
  {{Screening.seats}}
</div>
  <div class="mycontainer">

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
<style>
.mycontainer{
  width: 33%;
  height: 33%;
  background-color: #42b983;
  position: center;
}
</style>
