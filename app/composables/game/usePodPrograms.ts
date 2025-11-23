import type { Database } from '~/types/database.types'

type Weapon = Database['public']['Tables']['pod_programs']['Row']
type UserWeapon = Database['public']['Tables']['user_pod_programs']['Row']

export const usePodPrograms = () => {
  const { getAllWithStatus, toggle } = useTrackable(
    'pod_programs',
    'user_pod_programs',
    'pod_program_id'
  )

  return {
    getAllPodProgramsWithStatus: getAllWithStatus,
    togglePodProgram: toggle,
  }
}
