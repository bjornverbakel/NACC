<template>
  <Header />
  <NavDrawer />

  <v-main>
    <v-container
      fluid
      class="main-content h-screen-content py-8 pa-sm-8 pa-md-16 d-flex flex-column ga-4 ga-md-6"
    >
      <slot />
    </v-container>
  </v-main>
</template>

<script setup lang="ts">
import { useDisplay } from 'vuetify'

const { lgAndUp } = useDisplay()
const drawer = ref(lgAndUp.value) // Open drawer by default on large screens

// Make drawer accessible globally via provide/inject
provide('drawer', drawer)
</script>

<style scoped lang="scss">
.main-content {
  margin: 0 auto;
  max-width: 1200px;
}
</style>
