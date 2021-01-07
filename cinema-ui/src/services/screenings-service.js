import axios from 'axios'

const API_URL = 'http://localhost:8080/screenings'

class ScreeningsService {
  getAllScreenings () {
    return axios.get(API_URL + '/all')
  }

  getFutureScreenings () {
    return axios.get(API_URL + '/allFuture')
  }

  getScreeningById (idScreening) {
    return axios.get(API_URL + '/search/id',
      {
        params:
          {
            id: idScreening
          }
      }
    )
  }
}

export default new ScreeningsService()
