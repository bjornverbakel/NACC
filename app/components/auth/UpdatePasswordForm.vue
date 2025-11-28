<template>
  <v-form class="d-flex flex-column ga-4" @submit.prevent="handleUpdate">
    <AppAlert v-if="feedback.message" v-model:message="feedback.message" :type="feedback.type" />

    <v-text-field
      v-model="password"
      prepend-inner-icon="mdi-lock"
      label="New Password"
      type="password"
    />

    <v-text-field
      v-model="passwordConfirm"
      prepend-inner-icon="mdi-lock"
      label="Repeat Password"
      type="password"
    />

    <v-btn type="submit" color="primary" class="w-fit" :loading="loading">
      <span class="text-truncate-wrap">{{ buttonText }}</span>
    </v-btn>
  </v-form>
</template>

<script setup lang="ts">
const props = defineProps({
  redirectToLogin: {
    type: Boolean,
    default: false,
  },
  buttonText: {
    type: String,
    default: 'Update Password',
  },
})

const password = ref('')
const passwordConfirm = ref('')
const client = useSupabaseClient()
const user = useSupabaseUser()
const loading = ref(false)
const feedback = ref({ message: '', type: 'info' as 'success' | 'error' | 'info' | 'warning' })
const { validateRequired, validatePassword, validatePasswordMatch } = useAuthValidation()

const handleUpdate = async () => {
  if (!user.value) {
    feedback.value = {
      message: 'Session expired. Please log in again.',
      type: 'error',
    }
    return
  }

  const requiredError = validateRequired({
    password: password.value,
    passwordConfirm: passwordConfirm.value,
  })
  if (requiredError) {
    feedback.value = { message: requiredError, type: 'error' }
    return
  }

  const matchError = validatePasswordMatch(password.value, passwordConfirm.value)
  if (matchError) {
    feedback.value = { message: matchError, type: 'error' }
    return
  }

  const passwordError = validatePassword(password.value)
  if (passwordError) {
    feedback.value = { message: passwordError, type: 'error' }
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
    if (props.redirectToLogin) {
      await client.auth.signOut()
      loading.value = false
      feedback.value = { message: 'Password changed successfully', type: 'success' }
      setTimeout(() => {
        feedback.value.message = ''
        navigateTo('/login')
      }, 2000)
    } else {
      loading.value = false
      feedback.value = { message: 'Password updated successfully', type: 'success' }
      password.value = ''
      passwordConfirm.value = ''
    }
  }
}
</script>
