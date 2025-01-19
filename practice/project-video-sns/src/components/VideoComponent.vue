<template>
  <div class="video-container">
    <video width="1280" height="720" controls autoplay>
      <source :src="videoPath" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
  </div>
</template>

<script setup lang="ts">
import { defineProps, computed } from 'vue'

// Define props to accept video source URL
const props = defineProps<{ videoSrc: string }>()

// Compute the full path to the video
const videoPath = computed(() => new URL(`../assets/${props.videoSrc}`, import.meta.url).href)
</script>

<style scoped>
.video-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 20px 0;
}
</style>
