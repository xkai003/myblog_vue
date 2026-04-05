<template>
  <div class="box">
    <Navigation></Navigation>
    <!-- 条件判断：不在 noNavRoutes 里才显示导航 -->
    <!-- <Navigation v-if="!noNavRoutes.includes($route.path)" /> -->

    <!-- 路由页面出口 -->
    <!-- <router-view /> -->
    <!--  -->
    <!--  -->
    <!--  -->
    <!--  -->
    <!--  -->
    <!--  -->
    <!--  -->
    <!--  -->
  </div>
</template>

<script>
import Navigation from './components/Navigation.vue'
export default {
  components: {
    Navigation
  },
  computed: {
    // noNavRoutes() {
    //   // 在这里写 不需要导航栏 的路由
    //   return ['/']
    // }
  }
}
</script>

<style scoped>
</style>