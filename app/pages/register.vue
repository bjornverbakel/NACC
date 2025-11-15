<template>
  <div>
    <v-card-title class="text-h4 mb-4">Create an account</v-card-title>

    <v-form @submit.prevent="signUp">
      <ErrorAlert :error-msg="authError" @clearError="clearError" />
      <SuccessAlert :success-msg="authSuccess" @clearSuccess="clearSuccess" />

      <v-text-field
        v-model="email"
        label="Email address"
        type="email"
        variant="outlined"
        class="mb-3"
      />

      <v-text-field
        v-model="password"
        label="Password"
        type="password"
        variant="outlined"
        class="mb-3"
      />

      <v-btn type="submit" color="primary" block :loading="loading" class="mb-3"> Sign up </v-btn>

      <v-card-text class="text-caption text-center">
        By signing up you agree to our
        <a href="https://policies.google.com/terms" target="_blank" rel="noopener noreferrer"
          >API Terms of Service</a
        >
        and
        <a href="https://policies.google.com/privacy" target="_blank" rel="noopener noreferrer"
          >Privacy Policy</a
        >.
      </v-card-text>
    </v-form>
  </div>
</template>

<script setup lang="ts">
useHead({
  title: 'Register | supaAuth',
})

const email = ref('')
const password = ref('')
const client = useSupabaseClient()
const user = useSupabaseUser()
const loading = ref(false)
const authError = ref('')
const authSuccess = ref('')

watchEffect(async () => {
  if (user.value) {
    await navigateTo('/')
  }
})

const signUp = async () => {
  loading.value = true
  const { data, error } = await client.auth.signUp({
    email: email.value,
    password: password.value,
  })

  loading.value = false

  if (error) {
    authError.value = error.message
  } else if (data?.user && !data.session) {
    // Email confirmation is required
    authSuccess.value = 'Account created! Please check your email to confirm your account.'
  }
}

const clearError = () => {
  authError.value = ''
}

const clearSuccess = () => {
  authSuccess.value = ''
}
</script>
