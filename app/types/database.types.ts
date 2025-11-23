export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          extensions?: Json
          operationName?: string
          query?: string
          variables?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      achievements: {
        Row: {
          created_at: string | null
          description: string
          guide_url: string | null
          icon_url: string
          id: string
          name: string
          sort_order: number
        }
        Insert: {
          created_at?: string | null
          description: string
          guide_url?: string | null
          icon_url: string
          id?: string
          name: string
          sort_order: number
        }
        Update: {
          created_at?: string | null
          description?: string
          guide_url?: string | null
          icon_url?: string
          id?: string
          name?: string
          sort_order?: number
        }
        Relationships: []
      }
      archives: {
        Row: {
          created_at: string | null
          guide_url: string | null
          id: string
          name: string
          sort_order: number
          type: string
        }
        Insert: {
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name: string
          sort_order: number
          type: string
        }
        Update: {
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name?: string
          sort_order?: number
          type?: string
        }
        Relationships: []
      }
      endings: {
        Row: {
          chapter: string
          created_at: string | null
          guide_url: string | null
          id: string
          letter: string
          name: string
          sort_order: number
          type: string
        }
        Insert: {
          chapter: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          letter: string
          name: string
          sort_order: number
          type: string
        }
        Update: {
          chapter?: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          letter?: string
          name?: string
          sort_order?: number
          type?: string
        }
        Relationships: []
      }
      enemies: {
        Row: {
          acquisition: string | null
          created_at: string | null
          guide_url: string | null
          id: string
          name: string
          sort_order: number
          type: string
          variant: string | null
        }
        Insert: {
          acquisition?: string | null
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name: string
          sort_order: number
          type: string
          variant?: string | null
        }
        Update: {
          acquisition?: string | null
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name?: string
          sort_order?: number
          type?: string
          variant?: string | null
        }
        Relationships: []
      }
      fish: {
        Row: {
          created_at: string | null
          guide_url: string | null
          id: string
          location: string[]
          name: string
          sort_order: number
        }
        Insert: {
          created_at?: string | null
          guide_url?: string | null
          id?: string
          location: string[]
          name: string
          sort_order: number
        }
        Update: {
          created_at?: string | null
          guide_url?: string | null
          id?: string
          location?: string[]
          name?: string
          sort_order?: number
        }
        Relationships: []
      }
      novels: {
        Row: {
          acquisition: string
          created_at: string | null
          guide_url: string | null
          id: string
          name: string
          sort_order: number
        }
        Insert: {
          acquisition: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name: string
          sort_order: number
        }
        Update: {
          acquisition?: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name?: string
          sort_order?: number
        }
        Relationships: []
      }
      pod_programs: {
        Row: {
          acquisition: string
          created_at: string | null
          guide_url: string | null
          id: string
          name: string
          sort_order: number
        }
        Insert: {
          acquisition: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name: string
          sort_order: number
        }
        Update: {
          acquisition?: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name?: string
          sort_order?: number
        }
        Relationships: []
      }
      profiles: {
        Row: {
          created_at: string | null
          id: string
          updated_at: string | null
          username: string | null
        }
        Insert: {
          created_at?: string | null
          id: string
          updated_at?: string | null
          username?: string | null
        }
        Update: {
          created_at?: string | null
          id?: string
          updated_at?: string | null
          username?: string | null
        }
        Relationships: []
      }
      sidequests: {
        Row: {
          chapter: string | null
          clearable_by: string[]
          client: string
          created_at: string | null
          guide_url: string | null
          id: string
          location: string
          name: string
          sort_order: number
        }
        Insert: {
          chapter?: string | null
          clearable_by: string[]
          client: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          location: string
          name: string
          sort_order: number
        }
        Update: {
          chapter?: string | null
          clearable_by?: string[]
          client?: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          location?: string
          name?: string
          sort_order?: number
        }
        Relationships: []
      }
      user_achievements: {
        Row: {
          achievement_id: string
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          achievement_id: string
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          achievement_id?: string
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_achievements_achievement_id_fkey"
            columns: ["achievement_id"]
            isOneToOne: false
            referencedRelation: "achievements"
            referencedColumns: ["id"]
          },
        ]
      }
      user_archives: {
        Row: {
          archive_id: string
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          archive_id: string
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          archive_id?: string
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_archives_archive_id_fkey"
            columns: ["archive_id"]
            isOneToOne: false
            referencedRelation: "archives"
            referencedColumns: ["id"]
          },
        ]
      }
      user_endings: {
        Row: {
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          ending_id: string
          id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          ending_id: string
          id?: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          ending_id?: string
          id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_endings_ending_id_fkey"
            columns: ["ending_id"]
            isOneToOne: false
            referencedRelation: "endings"
            referencedColumns: ["id"]
          },
        ]
      }
      user_enemies: {
        Row: {
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          enemy_id: string
          id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          enemy_id: string
          id?: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          enemy_id?: string
          id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_enemies_weapon_id_fkey1"
            columns: ["enemy_id"]
            isOneToOne: false
            referencedRelation: "enemies"
            referencedColumns: ["id"]
          },
        ]
      }
      user_fish: {
        Row: {
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          fish_id: string
          id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          fish_id: string
          id?: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          fish_id?: string
          id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_fish_fish_id_fkey"
            columns: ["fish_id"]
            isOneToOne: false
            referencedRelation: "fish"
            referencedColumns: ["id"]
          },
        ]
      }
      user_novels: {
        Row: {
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          id: string
          novel_id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          novel_id: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          novel_id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_novels_novel_id_fkey"
            columns: ["novel_id"]
            isOneToOne: false
            referencedRelation: "novels"
            referencedColumns: ["id"]
          },
        ]
      }
      user_pod_programs: {
        Row: {
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          id: string
          pod_program_id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          pod_program_id: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          pod_program_id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_pod_programs_pod_program_id_fkey"
            columns: ["pod_program_id"]
            isOneToOne: false
            referencedRelation: "pod_programs"
            referencedColumns: ["id"]
          },
        ]
      }
      user_sidequests: {
        Row: {
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          id: string
          sidequest_id: string
          updated_at: string | null
          user_id: string
        }
        Insert: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          sidequest_id: string
          updated_at?: string | null
          user_id: string
        }
        Update: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          sidequest_id?: string
          updated_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_sidequests_sidequest_id_fkey"
            columns: ["sidequest_id"]
            isOneToOne: false
            referencedRelation: "sidequests"
            referencedColumns: ["id"]
          },
        ]
      }
      user_weapons: {
        Row: {
          completed: boolean | null
          completed_at: string | null
          created_at: string | null
          id: string
          updated_at: string | null
          user_id: string
          weapon_id: string
        }
        Insert: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          updated_at?: string | null
          user_id: string
          weapon_id: string
        }
        Update: {
          completed?: boolean | null
          completed_at?: string | null
          created_at?: string | null
          id?: string
          updated_at?: string | null
          user_id?: string
          weapon_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_weapons_weapon_id_fkey"
            columns: ["weapon_id"]
            isOneToOne: false
            referencedRelation: "weapons"
            referencedColumns: ["id"]
          },
        ]
      }
      weapons: {
        Row: {
          acquisition: string
          created_at: string | null
          guide_url: string | null
          id: string
          name: string
          sort_order: number
          type: string
        }
        Insert: {
          acquisition: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name: string
          sort_order: number
          type: string
        }
        Update: {
          acquisition?: string
          created_at?: string | null
          guide_url?: string | null
          id?: string
          name?: string
          sort_order?: number
          type?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      get_user_id: { Args: never; Returns: string }
      set_search_path_public: { Args: never; Returns: undefined }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {},
  },
} as const

