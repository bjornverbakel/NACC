<template>
  <v-app>
    <Header />

    <v-main>
      <v-container fluid class="fill-height d-flex align-center justify-center">
        <slot />
      </v-container>
    </v-main>
  </v-app>
</template>
