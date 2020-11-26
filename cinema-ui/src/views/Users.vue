<template>
  <div>
    <header class="jumbotron">
      <h1>{{content}}</h1>
    </header>
  </div>
</template>

<script>
import UsersSecvice from "../services/users-service"

export default {
  name: 'Users',
  data() {
    return{
      content: ''
    }
  },
  mounted() {
    UsersSecvice.getAllUsers().then(
      response => {
        this.content = response.data
      },
      error => {
        this.content =
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
