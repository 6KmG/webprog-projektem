<template>
  <div id="app">
    <header>
      <h1>Welcome</h1>
    </header>

    <main>
      <!-- Use the VideoComponent and pass the video source as a prop -->
      <VideoComponent videoSrc="video.mp4" />
    </main>
  </div>
</template>

<script setup lang="ts">
import VideoComponent from './components/VideoComponent.vue'

//window.alert('Hi')
</script>

<style scoped>
/* Add any global styles if necessary */
</style>
