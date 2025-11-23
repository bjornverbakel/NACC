import type { Database } from '~/types/database.types'

type Weapon = Database['public']['Tables']['pod_programs']['Row']
type UserWeapon = Database['public']['Tables']['user_novels']['Row']

export const useNovels = () => {
  const { getAllWithStatus, toggle } = useTrackable(
    'novels',
    'user_novels',
    'novel_id'
  )

  return {
    getAllNovelsWithStatus: getAllWithStatus,
    toggleNovel: toggle,
  }
}
