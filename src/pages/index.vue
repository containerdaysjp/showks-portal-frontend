<template>
  <div>
    <section class="section">
      <div class="container">
        <div class="columns is-centered">
          <test-card
            v-for="(instance, index) in cardLeft"
            :key="index"
            :link-url="instance.linkUrl"
            :thumbnail-url="instance.thumbnailUrl"
            :user-name="instance.author.userName"
            :git-hub-id="instance.author.gitHubId"
            :twitter-id="instance.author.twitterId"
            :comment="instance.author.comment"
            :created-at="instance.createdAt"/>
          <test-card 
            v-for="(instance, index) in cardCenter"
            v-if="instance.index"
            :key="index"
            :link-url="instance.linkUrl"
            :thumbnail-url="instance.thumbnailUrl"
            :user-name="instance.author.userName"
            :git-hub-id="instance.author.gitHubId"
            :twitter-id="instance.author.twitterId"
            :comment="instance.author.comment"
            :created-at="instance.createdAt"/>
          <test-card
            v-for="(instance, index) in cardRight"
            :key="index"
            :link-url="instance.linkUrl"
            :thumbnail-url="instance.thumbnailUrl"
            :user-name="instance.author.userName"
            :git-hub-id="instance.author.gitHubId"
            :twitter-id="instance.author.twitterId"
            :comment="instance.author.comment"
            :created-at="instance.createdAt"/>
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
    const response = await fetch('PLACEHOLDERURL' + '/instances')
    let instances = await response.json()
    for (var k in instances[0]) {
      if (k % 3 === 0) {
        let cardLeft = instances[0][k]
      } else if (k % 3 === 1) {
        let cardCenter = instances[0][k]
      } else {
        let cardRight = instances[0][k]
      }
    }
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
