<template>
  <div>
    <button v-on:click = "searchUsers">Търси</button>
    <b-table
      id = "usersTable"
      striped
      hover
      :items="users"
      :fields="fields"
      :current-page="currentPage"
      :per-page="0"
    >

      <template slot="top-row" slot-scope="{fields}">
        <td v-for="(field, index) in fields" :key="field.id">
          <div v-if="index === fields.length-1">
          </div>
          <div v-else>
            <input v-model="filters[field.key]">
          </div>
        </td>
      </template>
      <template v-slot:cell(name)="data">
        <div v-if="data.item.name">
          {{data.item.name}}
        </div>
        <div v-else>
          Няма Потребител
        </div>
      </template>

      <template v-slot:cell(actions)="row">
        <router-link :to="{name: 'UserTab', params:{id, row,item,id}}">Отвори</router-link> |
        <button v-on:click="deleteUser(row.item.id)">Изтрий</button>
      </template>
    </b-table>
    <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      @input="searchUsers"
      aria-controls="usersTable"
    ></b-pagination>
  </div>
</template>

<script>
import UsersService from '../services/users-service'
export default {
  name: 'Users',
  data () {
    return {
      currentPage: '',
      rows: '',
      perPage: 5,
      users: [{
        id: '',
        name: '',
        email: ''
      }],
      fields: [
        { key: 'name', label: 'Име' },
        { key: 'email', label: 'Имейл' }
      ],
      filters: {
        name: '',
        email: ''
      }
    }
  },
  mounted () {
    this.searchUsers()
  },
  methods: {
    searchUsers () {
      UsersService.getUsersPage(this.currentPage, this.perPage, this.filters).then(
        response => {
          this.users = response.data.users
          this.rows = response.data.totalItems
        },
        error => {
          this.content =
            (error.response && error.response.data) ||
            error.message ||
            error.toString()
        }
      )
    },
    deleteUser (id) {
      UsersService.deleteUserById(id).then(
        response => {
          this.message = response.data
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
}
</script>

<style scoped>

</style>
