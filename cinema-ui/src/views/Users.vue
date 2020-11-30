<template>
  <div>
    <header>
      <h3>{{content}}</h3>
    </header>
  </div>
</template>

<script>
import UsersService from '../services/users-service'
export default {
  name: 'Users.vue',
  data () {
    return {
      content: ''
    }
  },
  mounted () {
    UsersService.getAllUsers().then(
      response => {
        this.content = response.data
      },
      error => {
        this.users =
          (error.response && error.response.data) ||
          error.message ||
          error.toString()
      }
    )
  }
}
</script>

<style scoped>

</style>
