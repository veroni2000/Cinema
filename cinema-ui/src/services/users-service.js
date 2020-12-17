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
  getUserById(id){
    return axios.get(API_URL + '/search/id',
      {
        params:
          {
            id: id
          }
      })
  }
  deleteUserById(id){
    return axios.delete(API_URL + '/delete',
      {
        params:
          {
            id: id
          }
      })
  }
}

export default new UsersService()
