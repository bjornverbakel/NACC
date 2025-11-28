<template>
  <div class="d-flex justify-center auth-main-content h-screen-content align-center">
    <v-card class="d-flex flex-column justify-center" width="600">
      <div class="section-spacing pa-4 pa-sm-16">
        <v-card-title class="text-h4 pa-0 text-truncate-wrap">Forgot password</v-card-title>

        <v-form class="d-flex flex-column ga-4" @submit.prevent="handleResetPassword">
          <AppAlert
            v-if="feedback.message"
            v-model:message="feedback.message"
            :type="feedback.type"
          />

          <v-text-field
            v-model="email"
            prepend-inner-icon="mdi-email"
            label="Email address"
            type="email"
          />

          <NuxtTurnstile v-model="token" class="mt-2 mx-auto" />

          <v-btn type="submit" color="primary" block :loading="loading">
            <span class="text-truncate-wrap">Request reset link</span>
          </v-btn>
        </v-form>
      </div>
    </v-card>
  </div>
</template>

<script setup lang="ts">
useHead({
  title: 'Forgot Password',
})

definePageMeta({ authLayout: true })

const { resetPassword } = useAuth()
const { validateEmail, validateCaptcha } = useAuthValidation()
const email = ref('')
const token = ref('')
const loading = ref(false)
const feedback = ref({ message: '', type: 'info' as 'success' | 'error' | 'info' | 'warning' })

const handleResetPassword = async () => {
  const emailError = validateEmail(email.value.trim())
  if (emailError) {
    feedback.value = { message: emailError, type: 'error' }
    return
  }

  const captchaError = validateCaptcha(token.value)
  if (captchaError) {
    feedback.value = { message: captchaError, type: 'error' }
    return
  }

  loading.value = true
  const startTime = Date.now()

  const { error } = await resetPassword(
    email.value.trim(),
    token.value,
    `${window.location.origin}/confirm?redirect=${encodeURIComponent('/new-password?type=recovery')}`
  )

  // Ensure minimum loading time to prevent timing attacks
  const elapsedTime = Date.now() - startTime
  const minDelay = Math.random() * (2000 - 1000) + 1000 // Random delay between 1 and 2 seconds
  if (elapsedTime < minDelay) {
    await new Promise(resolve => setTimeout(resolve, minDelay - elapsedTime))
  }

  loading.value = false

  // Always show success message to prevent email enumeration via error messages (like rate limits)
  feedback.value = { message: 'Please check your email for the reset link.', type: 'success' }
}
</script>
