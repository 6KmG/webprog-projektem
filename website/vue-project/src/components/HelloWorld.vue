<script setup lang="ts">
  function say(message: string) {
    window.alert(message);
  }
</script>

<template>
    <button id="button-hi" @click="say('hi')">hi</button>
</template>

<style scoped>
#button-hi{
  background-color: aqua;
  border-radius: 50%;
  font-size: 500%;
  border-color: brown;
}

#button-hi:hover{
  background-color: blue;
}

#button-hi:active{
  background-color: aliceblue;
}
</style>
