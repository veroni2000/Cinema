<template>
  <div id="app">
    <div id="nav">
      <div>
        <b-navbar type="light" variant="light">
          <ul class="nav navbar-nav navbar-right">
            <li style="font-size:120%;"><router-link class="mr-sm-2" to="/">Home</router-link></li>
            <li style="font-size:120%;"><router-link class="mr-sm-2" to="/about">About</router-link></li>
            <li style="font-size:120%;"><router-link class="mr-sm-2" to="/movies">Movies</router-link></li>
          </ul>
          <b-navbar-nav class="ml-auto">
            <form class="form-inline">
              <b-form-input class="form-control mr-sm-2" type="search" placeholder="Search"></b-form-input>
              <b-button v-on:click = "searchMovies">Търси</b-button>
            </form>
            <h1>GEEEEEEyyy</h1>
          </b-navbar-nav>
        </b-navbar>
      </div>
    </div>
    <router-view/>
  </div>
</template>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding: 30px;
}
#nav a {
  font-weight: bold;
  color: #2c3e50;
}
#nav a.router-link-exact-active {
  color: #9dc0eb;
}
</style>
