<template>
  <div class="column is-one-third">
    <div class="card">
      <div class="card-image">
        <figure class="image is-4by3">
          <a :href="linkUrl"><img
            :src="'PLACEHOLDERURL' + thumbnailUrl"
            alt="Placeholder image"></a>
        </figure>
      </div>
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <a :href="'https://github.com/' + gitHubId"><img
                :src="'https://avatars.githubusercontent.com/' + gitHubId"
                alt="Placeholder image"></a>
            </figure>
          </div>
          <div class="media-content">
            <p class="title is-4">{{ userName }}</p>
            <p class="subtitle is-6">{{ twitterId }}</p>
          </div>
        </div>

        <div class="content">
          {{ comment }}
          <br>
          <time datetime="2016-1-1">{{ dateFormat(createdAt ) }}</time>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    linkUrl: {
      type: String,
      required: true,
      default: 'linkUrl'
    },
    thumbnailUrl: {
      type: String,
      required: true,
      default: 'thumbnailUrl'
    },
    userName: {
      type: String,
      required: true,
      default: 'userName'
    },
    gitHubId: {
      type: String,
      required: true,
      default: 'gitHubId'
    },
    twitterId: {
      type: String,
      required: true,
      default: 'twitterId'
    },
    comment: {
      type: String,
      required: true,
      default: 'comment'
    },
    createdAt: {
      type: Number,
      required: true,
      default: 1
    }
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

<style scoped>
.card {
  margin-bottom: 8px;
}
</style>
