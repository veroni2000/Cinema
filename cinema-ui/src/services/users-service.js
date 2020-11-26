import axios from 'axios'

const API_URL = 'http://localhost:8080/cinema'

class UsersService{
  getAllUsers(){
    return axios.get(API_URL + '/users/all')
  }
}

export default new UsersService()
