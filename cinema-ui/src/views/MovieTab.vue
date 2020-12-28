<template>
  <div>
    {{Movie}}
  </div>
</template>

<script>
import MoviesService from '../services/movies-service'
export default {
  name: 'MovieTab',
  data () {
    return {
      Movie: {
        id: '',
        title: '',
        data: '',
        description: ''
      }
    }
  },
  beforeRouterEnter (to, from, next) {
    MoviesService.getMovieById(to.params.id).then(
      response => {
        next(vm =>
          vm.setData(response)
        )
      }
    )
    console.log(to.params.id)
  },
  methods: {
    setData (response) {
      this.Movie = response.data
    }
  }
}
</script>
