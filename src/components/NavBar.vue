<template>
  <nav
    class="navbar"
    role="navigation"
    aria-label="main navigation">
    <div class="navbar-brand">
      <span
        class="navbar-item">
        <img
          src="/img/showKs-icon.png"
          alt="showKs icon"
          width="30"
          height="30">
      </span>

      <div class="navbar-menu">
        <div class="navbar-start">
          <nuxt-link 
            class="navbar-item" 
            to="/">
            Home
          </nuxt-link>

          <nuxt-link 
            class="navbar-item" 
            to="/about">
            About
          </nuxt-link>
        </div>
      </div>
  </div></nav>
</template>

<script>
export default {
  data: () => ({
    showNav: false,
    items: [{ title: 'Home', icon: 'home', url: '/' }]
  })
}
</script>

<style>
.navbar {
  　　margin-bottom: 20px;
}
</style>
