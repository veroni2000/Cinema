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

  getScreeningsByDate (Date1, Date2) {
    return axios.get(API_URL + '/search/date',
      {
        params:
          {
            date1: Date1,
            date2: Date2
          }
      }
    )
  }
}

export default new ScreeningsService()
