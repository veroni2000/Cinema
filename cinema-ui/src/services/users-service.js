import axios from 'axios'

const API_URL = 'http://localhost:8080/users'

class UsersService {
  getAllUsers () {
    return axios.get(API_URL + '/all')
  }
  getUsersPage(filters, currentPage, perPage){
    return axios.get(API_URL + '/search/page',
      {
        params:
          {
            name: filters.name,
            currentPage: currentPage,
            perPage: perPage
          }
      }
    )
  }
}

export default new UsersService()
