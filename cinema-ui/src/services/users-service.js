import axios from 'axios'

const API_URL = 'http://localhost:8080/'

class UsersService {
  getAllUsers () {
    return axios.get(API_URL + 'cinema/users/all')
  }

  getUsersPage (currentPage, perPage, filters) {
    return axios.get(API_URL + 'users/search/page',
      {
        params:
          {
            currentPage: currentPage,
            perPage: perPage,
            name: filters.name
          }
      }
    )
  }
}

export default new UsersService()
