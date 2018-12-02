<template>
  <div>
    <section class="section">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-one-third">
            <test-card
              v-for="(instance) in leftCards"
              :key="instance.index"
              :id="instance.id"
              :link-url="instance.linkUrl"
              :thumbnail-url="instance.thumbnailUrl"
              :user-name="instance.author.userName"
              :git-hub-id="instance.author.gitHubId"
              :twitter-id="instance.author.twitterId"
              :comment="instance.author.comment"
              :created-at="instance.createdAt"/>
          </div>
          <div class="column is-one-third">
            <test-card
              v-for="(instance) in centerCards"
              :key="instance.index"
              :id="instance.id"
              :link-url="instance.linkUrl"
              :thumbnail-url="instance.thumbnailUrl"
              :user-name="instance.author.userName"
              :git-hub-id="instance.author.gitHubId"
              :twitter-id="instance.author.twitterId"
              :comment="instance.author.comment"
              :created-at="instance.createdAt"/>
          </div>
          <div class="column is-one-third">
            <test-card
              v-for="(instance) in rightCards"
              :key="instance.index"
              :id="instance.id"
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
    let response = await fetch('PLACEHOLDERURL' + '/instances')
    let instances = await response.json()
    for (var k in instances) {
      instances[k].index = k
    }
    let leftCards = instances.filter(function(item, index) {
      if (item.index % 3 == 0) return true
    })
    let centerCards = instances.filter(function(item, index) {
      if (item.index % 3 == 1) return true
    })
    let rightCards = instances.filter(function(item, index) {
      if (item.index % 3 == 2) return true
    })
    return { instances, leftCards, centerCards, rightCards }
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
