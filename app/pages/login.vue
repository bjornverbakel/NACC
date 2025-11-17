<template>
  <div class="d-flex justify-center">
    <v-card class="pa-12 d-flex flex-column ga-8" width="600" outlined>
      <v-card-title class="text-h4 py-0">Log in</v-card-title>

      <v-form class="d-flex flex-column ga-4" @submit.prevent="login">
        <ErrorAlert :error-msg="authError" @clearError="clearError" />

        <v-text-field
          v-model="email"
          prepend-inner-icon="mdi-email"
          label="Email address"
          type="email"
        />

        <div class="text-right">
          <v-text-field
            v-model="password"
            prepend-inner-icon="mdi-lock"
            label="Password"
            type="password"
            class="mb-1"
          />

          <NuxtLink to="/forgot-password" class="text-primary text-decoration-none text-body-2">
            Forgot password?
          </NuxtLink>
        </div>

        <v-btn type="submit" color="primary" block :loading="loading">Log in</v-btn>
      </v-form>

      <div class="d-flex align-center">
        <v-divider />
        <span class="mx-4">Or</span>
        <v-divider />
      </div>

      <v-btn @click="signInAnonymously" variant="tonal" block :loading="anonymousLoading">
        Continue as Guest
      </v-btn>

      <div class="text-center text-body-2 text-medium-emphasis">
        <p>
          Don't have an account?
          <NuxtLink to="/register" class="text-decoration-none text-primary">Sign up</NuxtLink>
        </p>
      </div>
    </v-card>
  </div>
</template>

<script setup lang="ts">
useHead({
  title: 'Login | supaAuth',
})

const user = useSupabaseUser()
const loading = ref(false)
const anonymousLoading = ref(false)
const authError = ref('')
const email = ref('')
const password = ref('')
const client = useSupabaseClient()

watchEffect(async () => {
  if (user.value) {
    await navigateTo('/')
  }
})

const login = async () => {
  loading.value = true
  const { error } = await client.auth.signInWithPassword({
    email: email.value,
    password: password.value,
  })
  if (error) {
    loading.value = false
    authError.value = error.message
    setTimeout(() => {
      authError.value = ''
    }, 5000)
  }
}

const clearError = () => {
  authError.value = ''
}

const signInAnonymously = async () => {
  anonymousLoading.value = true
  const { error } = await client.auth.signInAnonymously()
  if (error) {
    anonymousLoading.value = false
    authError.value = error.message
    setTimeout(() => {
      authError.value = ''
    }, 5000)
  } else {
    // Successfully signed in as anonymous - navigate to home
    await navigateTo('/')
  }
}
</script>

<style scoped lang="scss">
.main-content {
  justify-content: center;
  align-items: center;
}
</style>
