import type { Database } from '~/types/database.types'

type Ending = Database['public']['Tables']['endings']['Row']
type UserEnding = Database['public']['Tables']['user_endings']['Row']

export const useEndings = () => {
  const client = useSupabaseClient<Database>()
  const user = useSupabaseUser()

  // Get all endings with user completion status
  const getAllEndingsWithStatus = async () => {
    const userId = user.value?.id || user.value?.sub
    if (!userId) {
      // Not logged in - just return endings without status
      const { data, error } = await client
        .from('endings')
        .select('*')
        .order('letter')

      return { data, error }
    }

    // Logged in - join with user_endings
    const { data, error } = await client
      .from('endings')
      .select(`
        *,
        user_endings!left(completed, completed_at)
      `)
      .eq('user_endings.user_id', userId)
      .order('letter')

    return { data, error }
  }

  // Toggle ending completion
  const toggleEnding = async (endingId: string, completed: boolean) => {
    const userId = user.value?.id || user.value?.sub
    if (!userId) return { error: { message: 'Not authenticated' } }

    // Check if record exists
    const { data: existing } = await client
      .from('user_endings')
      .select('id')
      .eq('user_id', userId)
      .eq('ending_id', endingId)
      .single()

    if (existing) {
      // Update existing record
      const { error } = await client
        .from('user_endings')
        .update({
          completed,
          completed_at: completed ? new Date().toISOString() : null,
          updated_at: new Date().toISOString(),
        })
        .eq('user_id', userId)
        .eq('ending_id', endingId)

      return { error }
    } else {
      // Insert new record
      const { error } = await client.from('user_endings').insert({
        user_id: userId,
        ending_id: endingId,
        completed,
        completed_at: completed ? new Date().toISOString() : null,
      })

      return { error }
    }
  }

  return {
    getAllEndingsWithStatus,
    toggleEnding,
  }
}
