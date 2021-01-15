import axios from 'axios'

const API_URL = 'http://localhost:8080/'

class TicketsService {
  createTicket (idScreenings, email) {
    return axios.post(API_URL + 'tickets/save',
      {
        params:
          {
            screening_id: idScreenings,
            email: email
          }
      })
  }
}
export default new TicketsService()
