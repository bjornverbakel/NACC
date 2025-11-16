export default defineNuxtPlugin(() => {
  const client = useSupabaseClient()

  // Handle auth state changes and clear invalid sessions
  client.auth.onAuthStateChange((event, session) => {
    if (event === 'SIGNED_OUT' || event === 'TOKEN_REFRESHED') {
      // Session is valid or cleared
    }
  })

  // Catch any auth errors and clear the session
  const originalGetUser = client.auth.getUser.bind(client.auth)
  client.auth.getUser = async () => {
    try {
      return await originalGetUser()
    } catch (error: any) {
      // If we get a 403 or invalid session, clear it
      if (error?.status === 403 || error?.message?.includes('session')) {
        await client.auth.signOut()
      }
      return { data: { user: null }, error }
    }
  }
})
