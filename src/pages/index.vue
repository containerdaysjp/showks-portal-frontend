<template>
  <div>
    <section class="section">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-one-fifth">
            <test-card
              v-for="(instance) in cards0"
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
          <div class="column is-one-fifth">
            <test-card
              v-for="(instance) in cards1"
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
          <div class="column is-one-fifth">
            <test-card
              v-for="(instance) in cards2"
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
          <div class="column is-one-fifth">
            <test-card
              v-for="(instance) in cards3"
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
          <div class="column is-one-fifth">
            <test-card
              v-for="(instance) in cards4"
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
    // TODO: クソコードすぎるのでなんとかしたい
    let cards0 = instances.filter(function(item, index) {
      if (item.index % 5 == 0) return true
    })
    let cards1 = instances.filter(function(item, index) {
      if (item.index % 5 == 1) return true
    })
    let cards2 = instances.filter(function(item, index) {
      if (item.index % 5 == 2) return true
    })
    let cards3 = instances.filter(function(item, index) {
      if (item.index % 5 == 3) return true
    })
    let cards4 = instances.filter(function(item, index) {
      if (item.index % 5 == 4) return true
    })
    return { cards0, cards1, cards2, cards3, cards4 }
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
