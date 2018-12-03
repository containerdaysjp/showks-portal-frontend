<template>
  <div
    :data-tooltip="comment"
    class="card tooltip is-tooltip-multiline is-tooltip-success"
  >
    <div class="card-image">
      <figure class="image is-square">
        <a
          :href="linkUrl"
          target="_blank"
        ><img
          :src="'PLACEHOLDERURL' + thumbnailUrl"
          alt="Placeholder image"
        ></a>
      </figure>
    </div>
    <div class="card-content">
      <div class="content is-size-7">
        <div
          :data-tooltip="userName"
          class="title is-7 tooltip"
        >{{ trim(userName, 12) }}</div>
      </div>
      <footer class="card-footer">
        <a
          :href="'https://github.com/' + gitHubId"
          :data-tooltip="gitHubId"
          class="card-footer-item tooltip is-tooltip-primary"
          target="_blank"
        ><img
          :src="'https://avatars.githubusercontent.com/' + gitHubId"
          class="image is-16x16"
          alt="Placeholder image"></a>
        <a
          v-if="twitterId !== undefined && twitterId !== ''"
          :href="'https://twitter.com/' + twitterId"
          :data-tooltip="twitterId"
          class="card-footer-item tooltip is-tooltip-info"
          target="_blank"
        ><i class="fa fa-twitter"/></a>
      </footer>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    id: {
      type: String,
      required: true,
      default: 'linkUrl'
    },
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
      required: false,
      default: 'twitterId'
    },
    comment: {
      type: String,
      required: false,
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
      let y = date.getFullYear()
      let m = date.getMonth() + 1
      let d = date.getDate()
      let h = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
      let i =
        date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()
      let s =
        date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds()

      /*
      if (m < 10) {
        m = '0' + m
      }
      if (d < 10) {
        d = '0' + d
      }
      */

      // フォーマット整形済みの文字列を戻り値にする
      //return y + '/' + m + '/' + d + ' ' + h + ':' + i + ':' + s
      return m + '/' + d + ' ' + h + ':' + i
    },
    trim(value, n) {
      if (value !== undefined && value !== '') {
        let result = value.toString().substr(0, n)
        if (result.length < value.length) {
          result += '…'
        }
        return result
      }
      return ''
    }
  }
}
</script>

<style>
.card {
  margin-bottom: 8px;
}
.card-content {
  padding: 0.5rem;
}
.block:not(:last-child),
.box:not(:last-child),
.breadcrumb:not(:last-child),
.content:not(:last-child),
.highlight:not(:last-child),
.level:not(:last-child),
.list:not(:last-child),
.message:not(:last-child),
.notification:not(:last-child),
.progress:not(:last-child),
.subtitle:not(:last-child),
.table-container:not(:last-child),
.table:not(:last-child),
.tabs:not(:last-child),
.title:not(:last-child) {
  margin-bottom: 0.5rem;
}
</style>
