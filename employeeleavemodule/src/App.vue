<template>
  <div id="app">
    <router-view name="header"></router-view>
    <router-view name="main"></router-view>
    <router-view name="footer"></router-view>
  </div>
</template>

<script>
// import HelloWorld from "./components/HelloWorld.vue";

export default {
  name: "app",
  components: {
    // HelloWorld,
  },
};
</script>

<style>
#app {
  max-width: 1200px;
  margin: auto;
}
</style>
