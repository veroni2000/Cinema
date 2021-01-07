<template>
<div>
  {{Screening}}
</div>
</template>

<script>
import ScreeningService from '../services/screenings-service'
export default {
  name: "ScreeningTab",
  data () {
    return {
      Screening: {
      }
    }
  },
  beforeRouteEnter (to,from,next) {
    ScreeningService.getScreeningById(to.params.id).then(
      response => {
        next(vm =>
        vm.setData(response))
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

<style scoped>

</style>
