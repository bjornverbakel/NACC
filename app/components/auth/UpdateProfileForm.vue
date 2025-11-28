<template>
  <v-form class="d-flex flex-column ga-4" @submit.prevent="handleUpdate">
    <AppAlert v-if="feedback.message" v-model:message="feedback.message" :type="feedback.type" />

    <v-text-field
      v-model="username"
      prepend-inner-icon="mdi-account"
      label="Username"
      type="text"
    />

    <v-btn type="submit" color="primary" class="w-fit" :loading="loading">
      <span class="text-truncate-wrap">Update Username</span>
    </v-btn>
  </v-form>
</template>

<script setup lang="ts">
const { profile, updateProfile } = useProfile()
const { validateRequired } = useAuthValidation()

const username = ref('')
const loading = ref(false)
const feedback = ref({ message: '', type: 'info' as 'success' | 'error' | 'info' | 'warning' })

// Initialize username from profile
watch(
  profile,
  newProfile => {
    if (newProfile?.username) {
      username.value = newProfile.username
    }
  },
  { immediate: true }
)

const handleUpdate = async () => {
  const trimmedUsername = username.value.trim()

  const requiredError = validateRequired({ username: trimmedUsername })
  if (requiredError) {
    feedback.value = { message: requiredError, type: 'error' }
    return
  }

  if (trimmedUsername === profile.value?.username) {
    feedback.value = { message: 'Username is unchanged', type: 'info' }
    return
  }

  loading.value = true
  const { error } = await updateProfile({ username: trimmedUsername })

  loading.value = false
  if (error) {
    feedback.value = { message: error.message, type: 'error' }
  } else {
    feedback.value = { message: 'Username updated successfully', type: 'success' }
  }
}
</script>
