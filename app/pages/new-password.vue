<template>
  <div class="d-flex justify-center auth-main-content h-screen-content align-center">
    <v-card class="d-flex flex-column justify-center" width="600">
      <div class="section-spacing pa-4 pa-sm-16">
        <v-card-title class="text-h4 pa-0 text-truncate-wrap">
          {{ route.query.type === 'recovery' ? 'Reset Password' : 'Change Password' }}
        </v-card-title>

        <UpdatePasswordForm :redirect-to-login="true" button-text="Reset Password" />
      </div>
    </v-card>
  </div>
</template>

<script setup lang="ts">
import UpdatePasswordForm from '~/components/auth/UpdatePasswordForm.vue'

const route = useRoute()

useHead({
  title: computed(() => (route.query.type === 'recovery' ? 'Reset Password' : 'Change Password')),
})

definePageMeta({ authLayout: true })

const user = useSupabaseUser()

// Watch for user state changes to handle the race condition where
// the session is established slightly after the page mounts.
watch(
  user,
  newUser => {
    if (newUser) {
      // If user becomes authenticated, clear any "session missing" errors
      // This logic might need to be moved to the form or handled globally if needed
    }
  },
  { immediate: true }
)

onMounted(() => {
  // Check for error in URL (Supabase redirects here with error params if link is invalid)
  const errorDescription = route.query.error_description as string

  if (errorDescription) {
    // We can't easily pass this to the form component without a prop or store
    // For now, let's just rely on the form's internal validation or add a global alert if needed
    // Or we can pass it as a prop if we update the component
  }
})
</script>
