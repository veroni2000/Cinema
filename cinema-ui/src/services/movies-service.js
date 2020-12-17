import axios from 'axios'

const API_URL = 'http://localhost:8080/cinema'

class MoviesService {
  getAllMovies () {
    return axios.get(API_URL + 'movies/all')
  }

  getMoviesPage (currentPage, perPage, filters) {
    return axios.get(API_URL + 'movies/search/page',
      {
        params:
          {
            currentPage: currentPage,
            perPage: perPage,
            title: filters.title
          }
      }
    )
  }
}

export default new MoviesService()
