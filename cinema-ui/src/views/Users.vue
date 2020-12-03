<template>
  <div>
    <header>
      <b-table
        striped
        hover
        :items="users"
        :fields="fields"
      >
        <template slot="top-row" slot-scope="{fields}">
          <td v-for="field in fields" :key="field.id">
            <input>
          </td>
        </template>
      </b-table>
    </header>
  </div>
</template>

<script>
import UsersService from '../services/users-service'
export default {
  name: 'Users',
  data () {
    return {
      users: [{
        id: '',
        name: '',
        email: ''
      }],
      fields: [
        {key: 'name', label: 'Име'},
        {key: 'email', label: 'Имейл'}
      ]
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
