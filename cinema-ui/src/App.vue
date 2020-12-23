<template>
  <div id="app">
    <div id="nav">
      <div>
        <b-navbar type="light" variant="light">
          <b-navbar-nav>
            <router-link class="mr-sm-2" to="/">Home</router-link>
            <router-link class="mr-sm-2" to="/about">About</router-link>
            <router-link class="mr-sm-2" to="/movies">Movies</router-link>
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
  color: #85bb65;
}
</style>
