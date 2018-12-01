<template>
  <div class="site">
    <nav-bar/>
    <div class="siteContent">
      <nuxt class="has-text-centered"/>
    </div>
    <footer-bar/>
  </div>
</template>

<script>
import FooterBar from '~/components/FooterBar.vue'
import NavBar from '~/components/NavBar.vue'

export default {
  components: {
    FooterBar,
    NavBar
  }
}
</script>
