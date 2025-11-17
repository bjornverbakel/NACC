<template>
  <v-navigation-drawer v-model="drawer" class="border-0" id="navDrawer" app>
    <v-list density="comfortable" nav>
      <v-list-item prepend-icon="mdi-home" title="Home" to="/" />
      <v-list-item prepend-icon="mdi-book-open" title="Endings" to="/endings" />
      <v-list-item prepend-icon="mdi-map" title="Sidequests" to="/sidequests" />
      <v-list-item prepend-icon="mdi-trophy" title="Achievements" to="/achievements" />
      <v-list-item prepend-icon="mdi-sword" title="Weapons" to="/weapons" />
      <v-list-item prepend-icon="mdi-chip" title="Pod Programs" to="/pod-programs" />
      <v-list-item prepend-icon="mdi-robot-angry" title="Enemies" to="/enemies" />

      <!-- <v-list-item>
        <Button text="Home" icon="mdi-home" to="/" />
      </v-list-item>
      <v-list-item>
        <Button text="Endings" icon="mdi-book-open" to="/endings" />
      </v-list-item>
      <v-list-item>
        <Button text="Sidequests" icon="mdi-map" to="/sidequests" />
      </v-list-item>
      <v-list-item>
        <Button text="Achievements" icon="mdi-trophy" to="/achievements" />
      </v-list-item>
      <v-list-item>
        <Button text="Weapons" icon="mdi-sword" to="/weapons" />
      </v-list-item>
      <v-list-item>
        <Button text="Pod Programs" icon="mdi-chip" to="/pod-programs" />
      </v-list-item>
      <v-list-item>
        <Button text="Enemies" icon="mdi-robot-angry" to="/enemies" />
      </v-list-item>
      <v-list-item>
        <Button text="Profile" icon="mdi-account" to="/profile" />
      </v-list-item> -->
    </v-list>
  </v-navigation-drawer>
</template>

<script setup lang="ts">
// Access drawer state from layout
const drawer = inject<Ref<boolean>>('drawer')
</script>

<style scoped lang="scss">
#navDrawer {
  :deep(.v-list-item-title) {
    text-transform: uppercase;
  }
}
</style>
