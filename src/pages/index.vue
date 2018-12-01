<template>
  <div>
    <section class="section">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-one-third">
            <test-card
              v-for="(instance) in instances"
              :key="instance.id"
              :link-url="instance.linkUrl"
              :thumbnail-url="instance.thumbnailUrl"
              :user-name="instance.author.userName"
              :git-hub-id="instance.author.gitHubId"
              :twitter-id="instance.author.twitterId"
              :comment="instance.author.comment"
              :created-at="instance.createdAt"/>
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
      'PLACEHOLDERURL' + '/instances'
    )
    let instances = await response.json()
    return { instances }
  },
  mounted() {
    setInterval(function() {
      asyncData()
    }, 5000)
  },
  beforeDestroy() {
    console.log('clearInterval')
    clearInterval(this.intervalId)
  }
}
</script>
