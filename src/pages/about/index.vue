<template>
  <div>
    <section class="section">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-one-third">
            <h1 class="title">showKs Portal</h1>
            <h2 class="subtitle">Sample Application for Japan Container Days</h2>
            <p>Welcome to Japan Container Days!</p>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import TestCard from '~/components/TestCard.vue'
import fetch from 'isomorphic-fetch'
export default {
  components: {
    TestCard
  },
  async asyncData() {
    const response = await fetch(
      'http://aggregator.stg.showks.containerdays.jp' + '/instances'
    )
    let instances = await response.json()
    return { instances }
  },
  mounted() {
    setInterval(function() {
      axios
        .get('http://aggregator.stg.showks.containerdays.jp' + '/instances')
        .then(response => {
          instances = response.data
        })
        .catch(error => {
          console.log(error)
        })
    }, 5000)
  },
  beforeDestroy() {
    console.log('clearInterval')
    clearInterval(this.intervalId)
  }
}
</script>
