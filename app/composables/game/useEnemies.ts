import type { Database } from '~/types/database.types'

type Enemy = Database['public']['Tables']['enemies']['Row']
type UserEnemy = Database['public']['Tables']['user_enemies']['Row']

export const useEnemies = () => {
  const { getAllWithStatus, toggle } = useTrackable(
    'enemies',
    'user_enemies',
    'enemy_id'
  )

  return {
    getAllEnemiesWithStatus: getAllWithStatus,
    toggleEnemy: toggle,
  }
}
