<template>
  <div class="section-spacing">
    <h1 class="main-header">Settings</h1>

    <v-card class="pa-6 pa-sm-8">
      <div class="section-spacing-sm">
        <v-card-title class="pa-0 text-truncate-wrap">Data</v-card-title>
        <v-card-text class="pa-0">
          Export your completion data to a JSON file, or import data from a previously exported
          file. This allows you to backup your progress or transfer it to another account.
        </v-card-text>

        <v-btn
          color="primary"
          prepend-icon="mdi-download"
          :loading="exporting"
          @click="handleExport"
          class="w-fit"
          variant="flat"
        >
          <span class="text-truncate-wrap">Export Data</span>
        </v-btn>

        <v-divider class="my-4" />

        <div class="d-flex align-start flex-column flex-sm-row ga-4">
          <v-file-input
            v-model="importFile"
            label="Import Data (JSON)"
            accept=".json"
            prepend-icon="mdi-upload"
            :loading="importing"
            :error-messages="error"
            class="w-100"
            show-size
            hide-details
          />

          <v-btn
            :disabled="!canImport"
            :loading="importing"
            @click="handleImport"
            :height="$vuetify.display.smAndUp ? '56' : undefined"
            variant="flat"
            color="primary"
          >
            Import
          </v-btn>
        </div>

        <AppAlert
          v-if="successMessage"
          type="success"
          :message="successMessage"
          @clear="successMessage = ''"
        />
        <AppAlert v-if="error" type="error" :message="error" @clear="error = ''" />

        <v-divider class="my-4" />

        <v-card-title class="pa-0 text-truncate-wrap">Import Game Save</v-card-title>
        <v-card-text class="pa-0">
          Import your NieR: Automata save file (SlotData_0.dat, etc.) to automatically mark items as
          completed.
          <br />
          <small class="text-medium-emphasis"
            >Note: Only items with known IDs will be imported.</small
          >
        </v-card-text>

        <div class="d-flex align-start flex-column flex-sm-row ga-4 mt-2">
          <v-file-input
            v-model="saveFile"
            label="Import Save File (.dat)"
            accept=".dat"
            prepend-icon="mdi-gamepad-round"
            :loading="saveImporting"
            :error-messages="saveError"
            class="w-100"
            show-size
            hide-details
          />

          <v-btn
            :disabled="!canImportSave"
            :loading="saveImporting"
            @click="handleSaveImport"
            :height="$vuetify.display.smAndUp ? '56' : undefined"
            variant="flat"
            color="primary"
          >
            Import Save
          </v-btn>

          <v-btn
            :disabled="!canImportSave"
            :loading="saveImporting"
            @click="handleSaveDebug"
            :height="$vuetify.display.smAndUp ? '56' : undefined"
            variant="outlined"
            color="secondary"
          >
            Debug JSON
          </v-btn>
        </div>

        <AppAlert
          v-if="saveSuccessMessage"
          type="success"
          :message="saveSuccessMessage"
          @clear="saveSuccessMessage = ''"
        />
        <AppAlert v-if="saveError" type="error" :message="saveError" @clear="saveError = ''" />
      </div>
    </v-card>
  </div>
  <v-card v-if="!isAnonymous && user" class="pa-6 pa-sm-8">
    <div class="section-spacing-sm">
      <v-card-title class="pa-0 text-truncate-wrap">Account</v-card-title>
      <v-card-text class="pa-0"> Update your profile information. </v-card-text>

      <UpdateProfileForm />

      <v-divider class="my-4" />

      <div class="text-h6">Change Password</div>
      <UpdatePasswordForm />
    </div>
  </v-card>
</template>

<script setup lang="ts">
import UpdatePasswordForm from '~/components/auth/UpdatePasswordForm.vue'
import UpdateProfileForm from '~/components/auth/UpdateProfileForm.vue'
import { useSaveImporter } from '~/composables/common/useSaveImporter'

useHead({
  title: 'Settings',
})

const { exportData, importData } = useDataManagement()
const { isAnonymous } = useAuth()
const user = useSupabaseUser()

const exporting = ref(false)
const importing = ref(false)
const importFile = ref<File[] | null>(null)
const error = ref('')
const successMessage = ref('')

const {
  importSaveFile: importGameSave,
  downloadParsedSave,
  importing: saveImporting,
  error: saveError,
  successMessage: saveSuccessMessage,
} = useSaveImporter()
const saveFile = ref<File[] | null>(null)

const canImportSave = computed(() => {
  if (!saveFile.value) return false
  if (Array.isArray(saveFile.value)) return saveFile.value.length > 0
  return !!saveFile.value
})

const handleSaveImport = async () => {
  const file = Array.isArray(saveFile.value) ? saveFile.value[0] : saveFile.value
  if (!file) return

  await importGameSave(file)
  if (!saveError.value) {
    saveFile.value = null
  }
}

const handleSaveDebug = async () => {
  const file = Array.isArray(saveFile.value) ? saveFile.value[0] : saveFile.value
  if (!file) return

  await downloadParsedSave(file)
}

const canImport = computed(() => {
  if (!importFile.value) return false
  if (Array.isArray(importFile.value)) return importFile.value.length > 0
  return !!importFile.value
})

const handleExport = async () => {
  exporting.value = true
  error.value = ''
  successMessage.value = ''
  try {
    await exportData()
    successMessage.value = 'Data exported successfully!'
  } catch (e: any) {
    error.value = e.message
  } finally {
    exporting.value = false
  }
}

const handleImport = async () => {
  const file = Array.isArray(importFile.value) ? importFile.value[0] : importFile.value
  if (!file) {
    error.value = 'Please select a file to import'
    return
  }

  importing.value = true
  error.value = ''
  successMessage.value = ''
  try {
    // v-file-input model is an array of files
    await importData(file)
    successMessage.value = 'Data imported successfully!'
    importFile.value = null
  } catch (e: any) {
    error.value = e.message
  } finally {
    importing.value = false
  }
}
</script>
