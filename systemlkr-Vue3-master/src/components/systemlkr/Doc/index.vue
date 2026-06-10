<template>
  <div>
    <svg-icon icon-class="question" @click="goto" />
  </div>
</template>

<script setup>
const url = ref('http://doc.systemlkr.vip/systemlkr-vue');

function goto() {
  window.open(url.value)
}
</script>