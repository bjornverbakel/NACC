export const useAuth = () => {
  const user = useSupabaseUser()
  const client = useSupabaseClient()

  const isAnonymous = computed(() => {
    return user.value?.is_anonymous ?? false
  })

  const convertAnonymousToUser = async (email: string, password: string, username?: string) => {
    if (!isAnonymous.value) {
      return { error: new Error('User is not anonymous') }
    }

    const updateData: { email: string; password: string; data?: { username: string } } = {
      email,
      password,
    }

    if (username) {
      updateData.data = { username }
    }

    const { data, error } = await client.auth.updateUser(updateData)

    // Also update the profiles table if username is provided
    if (!error && username && user.value?.id) {
      console.log('Attempting to update profile for user:', user.value.id, 'with username:', username)
      
      const { data: profileData, error: profileError } = await client
        .from('profiles')
        .update({
          username: username,
          updated_at: new Date().toISOString(),
        })
        .eq('id', user.value.id)
        .select()
      
      console.log('Profile update result:', { profileData, profileError })
      
      if (profileError) {
        console.error('Profile update error:', profileError)
        return { data, error: profileError }
      }
    }

    return { data, error }
  }

  return {
    isAnonymous,
    convertAnonymousToUser,
  }
}
