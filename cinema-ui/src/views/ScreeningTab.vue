<template>
<div>
  {{Screening}}
</div>
</template>

<script>
import ScreeningsService from '../services/screenings-service'
export default {
  name: 'ScreeningTab',
  data () {
    return {
      Screening: {
      }
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
