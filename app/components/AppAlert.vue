<template>
  <v-alert
    v-if="props.message"
    :type="props.type"
    :variant="props.variant"
    :closable="props.closable"
    @click:close="$emit('clear')"
  >
    {{ props.message }}
  </v-alert>
</template>

<script setup lang="ts">
const props = withDefaults(
  defineProps<{
    message?: string
    type?: 'success' | 'error' | 'info' | 'warning'
    closable?: boolean
    variant?: 'text' | 'outlined' | 'tonal' | 'plain' | 'elevated' | 'flat'
  }>(),
  {
    type: 'info',
    closable: true,
    variant: 'tonal',
  }
)

defineEmits(['clear'])
</script>

<style scoped>
.v-alert {
  min-height: fit-content;
}
</style>
