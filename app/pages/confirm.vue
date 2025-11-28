<template>
  <div class="ma-auto d-flex align-center">
    <v-progress-circular indeterminate color="primary" />
    <span class="ml-4">Verifying...</span>
  </div>
</template>

<script setup lang="ts">
useHead({
  title: 'Confirming...',
})

const user = useSupabaseUser()
const route = useRoute()

watch(
  user,
  () => {
    if (user.value) {
      const redirectPath = (route.query.redirect as string) || '/'
      navigateTo(redirectPath)
    }
  },
  { immediate: true }
)

onMounted(() => {
  // Check for error in URL (Supabase redirects here with error params if link is invalid)
  const errorDescription = route.query.error_description as string
  const error = route.query.error as string

  if (error || errorDescription) {
    // Redirect to login with the error message
    return navigateTo({
      path: '/login',
      query: {
        ...route.query,
        error_description: errorDescription || error || 'An error occurred during verification.',
      },
    })
  }

  // If user lands here without a code/hash and isn't logged in, redirect to login
  const hasCode = route.query.code || route.hash || route.query.token_hash

  if (!user.value && !hasCode) {
    navigateTo('/login')
  }
})
</script>
