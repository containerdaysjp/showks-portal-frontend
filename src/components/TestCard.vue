<template>
  <div class="card">
    <div class="card-content">
      <h2 class="title">&ldquo;{{ val.title }}&rdquo;</h2>
      <h3 class="subtitle">{{ val.subtitle }}</h3>
    </div>
    <div class="card-footer">
      <span class="card-footer-item">
        <a
          href="#"
          class="button is-primary">
          <i class="fa fa-thumbs-o-up"/>
        </a>
      </span>
      <span class="card-footer-item">
        <a
          href="#"
          class="button is-danger">
          <i class="fa fa-thumbs-o-down"/>
        </a>
      </span>
      <span class="card-footer-item">
        <a
          href="#"
          class="button is-info">
          <i class="fa fa-retweet"/>
        </a>
      </span>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    val: {
      type: Object,
      required: false,
      default() {
        return {
          title: 'test',
          subtitle: 'test'
        }
      }
    }
  }
}
</script>

<style scoped>
.card {
  margin-bottom: 8px;
}
</style>
