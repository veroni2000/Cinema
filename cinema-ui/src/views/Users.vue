<template>
  <div>
    <header>
      <b-table
        id="Users"
        striped
        hover
        :items="users"
        :fields="fields"
        :current-page="currentPage"
        :per-page=0
      >
        <template slot="top-row" slot-scope="{fields}">
          <td v-for="(field, index) in fields" :key="field.id">
            <div v-if="index === fields.len - 1"></div>
            <div v-else>
              <!--<input v-model="filters[field.key]">-->
            </div>
          </td>
        </template>
        <template>

        </template>
      </b-table>
      <b-pagination
        v-model="currentPage"
        :total-rows="rows"
        :per-page="perPage"
        aria-controls="Users"
      ></b-pagination>

    </header>
  </div>
</template>

<script>
import UsersService from '../services/users-service'
export default {
  name: 'Users',
  data () {
    return{
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
      ]
    }
  },
  mounted () {
    this.searchUsers()
  },
  methods:{
    searchUsers(){
      UsersService.getUsersPage(this.filters, this.currentPage,this.perPage).then(
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
    }
  }
}
</script>

<style scoped>

</style>
