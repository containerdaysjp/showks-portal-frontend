<template>
  <nav
    class="navbar"
    role="navigation"
    aria-label="main navigation">
    <div class="navbar-brand">
      <span
        class="navbar-item">
        <a href="https://showks.containerdays.jp"><img
          src="/img/showKs-icon.png"
          alt="showKs icon"
          width="30"
          height="30"></a>
      </span>
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
