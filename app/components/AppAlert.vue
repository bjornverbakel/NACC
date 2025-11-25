<template>
  <v-alert
    v-if="props.message"
    :type="props.type"
    :variant="props.variant"
    :closable="props.closable"
    border="start"
    :border-color="props.type"
    @click:close="onClose"
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

const emit = defineEmits(['clear', 'update:message'])

const onClose = () => {
  emit('clear')
  emit('update:message', '')
}
</script>

<style scoped>
.v-alert {
  min-height: fit-content;
  flex: 0 0 !important;
}
</style>
