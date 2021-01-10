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
