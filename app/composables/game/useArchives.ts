import type { Database } from '~/types/database.types'

type Archive = Database['public']['Tables']['archives']['Row']
type UserArchive = Database['public']['Tables']['user_archives']['Row']

export const useArchives = () => {
  const { getAllWithStatus, toggle } = useTrackable(
    'archives',
    'user_archives',
    'archive_id'
  )

  return {
    getAllArchivesWithStatus: getAllWithStatus,
    toggleArchive: toggle,
  }
}
