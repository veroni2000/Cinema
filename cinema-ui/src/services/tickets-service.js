import axios from 'axios'

const API_URL = 'http://localhost:8080/tickets'

class TicketsService {
  saveTicket (idScreenings, email) {
    console.log(idScreenings + ' ' + email)
    return axios.post(API_URL + '/save',
      {
        screening_id: idScreenings,
        email: email
      })
      .then((response) => {
        console.log(response)
      }, (error) => {
        console.log(error)
      })
  }
}
export default new TicketsService()
