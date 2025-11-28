<template>
  <v-btn
    :to="to"
    flat
    class="custom-btn rounded-0 text-h6 text-uppercase"
    variant="tonal"
    :class="{ 'active-btn': isActive }"
  >
    <div v-if="icon" class="btn-icon-wrapper" :class="{ 'active-icon': isActive }">
      <v-icon :icon="icon" start size="20" class="btn-icon" />
    </div>
    {{ text }}
  </v-btn>
</template>

<script setup lang="ts">
const props = defineProps({
  text: {
    type: String,
    default: 'Home',
  },
  icon: {
    type: String,
    default: 'mdi-home',
  },
  to: {
    type: [String, Object],
    default: '/',
  },
})
const route = useRoute()
const isActive = computed(() => {
  if (typeof props.to === 'string') {
    return route.path === props.to
  }
  if (typeof props.to === 'object' && props.to.path) {
    return route.path === props.to.path
  }
  return false
})
</script>

<style scoped lang="scss">
.custom-btn {
  height: fit-content;
  justify-content: start;
  padding: 8px;
  width: 100%;

  .btn-icon-wrapper {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    margin-right: 8px;
    background-color: rgb(var(--v-theme-primary));

    .btn-icon {
      color: rgb(var(--v-theme-on-primary));
      margin: 0;
    }
  }
}

.active-btn {
  background-color: rgb(var(--v-theme-primary)) !important;
  color: rgb(var(--v-theme-on-primary)) !important;

  :deep(.v-btn__underlay) {
    background: none !important;
  }
}
.active-btn .btn-icon-wrapper {
  background-color: rgb(var(--v-theme-on-primary)) !important;
}
.active-btn .btn-icon {
  color: rgb(var(--v-theme-primary)) !important;
}
</style>
