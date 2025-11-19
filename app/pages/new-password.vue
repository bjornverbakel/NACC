<template>
  <div class="d-flex justify-center">
    <v-card class="pa-12 d-flex flex-column ga-8" width="600" outlined>
      <v-card-title class="text-h4 py-0">New password</v-card-title>

      <v-form class="d-flex flex-column ga-4" @submit.prevent="updatepassword">
        <AppAlert
          v-if="feedback.message"
          :message="feedback.message"
          :type="feedback.type"
          @clear="clearFeedback"
        />

        <v-text-field
          v-model="password"
          label="Password"
          type="password"
          variant="outlined"
          class="mb-3"
        />

        <v-text-field
          v-model="passwordConfirm"
          label="Repeat password"
          type="password"
          variant="outlined"
          class="mb-3"
        />

        <v-btn type="submit" class="mt-4" color="primary" block :loading="loading">
          Reset Password
        </v-btn>
      </v-form>
    </v-card>
  </div>
</template>

<script setup lang="ts">
useHead({
  title: 'New Password | NACC',
})

const password = ref('')
const passwordConfirm = ref('')
const client = useSupabaseClient()
const user = useSupabaseUser()
const route = useRoute()
const loading = ref(false)
const feedback = ref({ message: '', type: 'info' as 'success' | 'error' | 'info' | 'warning' })

// Watch for user state changes to handle the race condition where
// the session is established slightly after the page mounts.
watch(
  user,
  newUser => {
    if (newUser) {
      // If user becomes authenticated, clear any "session missing" errors
      if (
        feedback.value.type === 'error' &&
        (feedback.value.message.includes('Invalid or expired') ||
          feedback.value.message.includes('Session expired'))
      ) {
        feedback.value = { message: '', type: 'info' }
      }
    }
  },
  { immediate: true }
)

onMounted(() => {
  // Check for error in URL (Supabase redirects here with error params if link is invalid)
  const errorDescription = route.query.error_description as string

  if (errorDescription) {
    feedback.value = {
      message: errorDescription,
      type: 'error',
    }
    return
  }

  // Redirect users who navigate here directly (no session, no recovery token)
  if (!user.value && !route.hash) {
    setTimeout(() => {
      if (!user.value) {
        navigateTo('/login')
      }
    }, 500)
  }
})

const updatepassword = async () => {
  if (!user.value) {
    feedback.value = {
      message: 'Session expired or invalid link. Please request a new one.',
      type: 'error',
    }
    return
  }

  if (password.value !== passwordConfirm.value) {
    feedback.value = { message: 'Password mismatch!', type: 'error' }
    return
  }

  loading.value = true
  const { error } = await client.auth.updateUser({
    password: password.value,
  })

  if (error) {
    loading.value = false
    feedback.value = { message: error.message, type: 'error' }
  } else {
    await client.auth.signOut()
    loading.value = false
    feedback.value = { message: 'Password changed successfully', type: 'success' }
    setTimeout(() => {
      feedback.value.message = ''
      navigateTo('/login')
    }, 2000)
  }
}

const clearFeedback = () => {
  feedback.value.message = ''
}
</script>
