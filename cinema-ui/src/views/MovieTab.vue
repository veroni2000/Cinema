<template>
  <div>
    {{movie}}
  </div>
</template>

<script>
import MoviesService from '../services/movies-service'
export default {
  name: 'MovieTab',
  data () {
    return {
      movie: {
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
  },
  methods: {
    setData (response) {
      this.movie = response.data
    }
  }
}
</script>
