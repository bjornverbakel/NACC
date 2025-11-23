import type { Database } from '~/types/database.types'

type Fish = Database['public']['Tables']['fish']['Row']
type UserFish = Database['public']['Tables']['user_fish']['Row']

export const useFish = () => {
  const { getAllWithStatus, toggle } = useTrackable(
    'fish',
    'user_fish',
    'fish_id'
  )

  return {
    getAllFishWithStatus: getAllWithStatus,
    toggleFish: toggle,
  }
}
