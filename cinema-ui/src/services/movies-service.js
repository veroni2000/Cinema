import axios from 'axios'

const API_URL = 'http://localhost:8080/movies'

class MoviesService {
  getAllMovies () {
    return axios.get(API_URL + '/all')
  }

  getMoviesPage (currentPage, perPage, filters) {
    return axios.get(API_URL + '/search/page',
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

  getMovieById (idMovie) {
    return axios.get(API_URL + '/search/id',
      {
        params:
        {
          id: idMovie
        }
      }
    )
  }
}

export default new MoviesService()
