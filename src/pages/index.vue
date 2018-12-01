<template>
  <div>
    <section class="section">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-one-third">
            <test-card
              v-for="item in items"
              :key="item.title"
              :val="item"/>
          </div>
          <div class="column is-one-third">
            <test-card
              v-for="item in items2"
              :key="item.title"
              :val="item"/>
          </div>
          <div class="column is-one-third">
            <test-card
              v-for="item in items3"
              :key="item.title"
              :val="item"/>
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
    const instances = await response.json()
    return { instances }
  },
  data: () => ({
    items: [
      { title: 'test 1', subtitle: 'Program-01' },
      { title: 'test 2', subtitle: 'Program-02' },
      { title: 'test 3', subtitle: 'Program-03' }
    ],
    items2: [{ title: 'test 4', subtitle: 'Program-1' }],
    items3: [{ title: 'test 5', subtitle: 'Program-1' }]
  }),
  mounted() {
    this.intervalId = setInterval(function() {
      console.log('hi')
      asyncData()
    }, 1000)
  },
  beforeDestroy() {
    console.log('clearInterval')
    clearInterval(this.intervalId)
  },
  methods: {
    dateFormat(createdAt) {
      const date = new Date(createdAt)
      const y = date.getFullYear()
      const m = date.getMonth() + 1
      const d = date.getDate()
      const h = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
      const i =
        date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()
      const s =
        date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds()

      if (m < 10) {
        m = '0' + m
      }
      if (d < 10) {
        d = '0' + d
      }

      // フォーマット整形済みの文字列を戻り値にする
      return y + '/' + m + '/' + d + ' ' + h + ':' + i + ':' + s
    }
  }
}
</script>

<style>
.container {
  min-height: 100vh;
  width: 80%;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}
.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}
.links {
  padding-top: 15px;
}
.time {
  font-size: 13px;
  color: #999;
}
.bottom {
  margin-top: 13px;
  line-height: 12px;
}
.image {
  width: 100%;
  display: block;
}
.card {
  margin: 5px;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: -moz-flex;
  display: flex;
  -webkit-box-lines: multiple;
  -moz-box-lines: multiple;
  -webkit-flex-wrap: wrap;
  -moz-flex-wrap: wrap;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: '';
}
.clearfix:after {
  clear: both;
}
</style>
