<template>
  <div class="section-spacing">
    <h1 class="main-header">Settings</h1>

    <!-- Import Game Save -->
    <ImportGameSave />

    <!-- Manage Completion Data -->
    <ManageCompletionData />

    <!-- Account Settings -->
    <AccountSettings v-if="!isAnonymous && user" />

    <!-- Danger Zone -->
    <DangerZone v-if="user" />
  </div>
</template>

<script setup lang="ts">
useHead({
  title: 'Settings',
})

const { isAnonymous } = useAuth()
const user = useSupabaseUser()
</script>
