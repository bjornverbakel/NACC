<template>
  <h1 class="main-header">About</h1>

  <p>
    This website is an unofficial checklist for tracking your completion progress in
    <em>NieR: Automata</em>. It allows you to mark various items, quests, and achievements as
    completed, helping you keep track of what you've done and what still needs to be accomplished.
  </p>

  <p class="mb-4">
    Pod Data is an open-source project, and the full source code is available on Github. It is a
    fan-site and unaffiliated with Square Enix or PlatinumGames.
  </p>

  <p class="mb-4">
    If you encounter any issues or have suggestions for improvements, you can contact me via
    Discord.
  </p>

  <v-card elevation="4" color="#5865F2" class="rounded-lg w-fit d-flex flex-row align-center">
    <div class="pa-3">
      <v-avatar color="white" class="mr-1">
        <v-img src="" alt="Avatar"></v-img>
      </v-avatar>
      bjqrnvv
    </div>
    <v-divider vertical></v-divider>
    <v-avatar class="ma-3 rounded-0" color="transparent">
      <v-img src="/img/discord-white.svg" alt="Discord Logo" :cover="false"></v-img>
    </v-avatar>
  </v-card>

  <v-card elevation="4" color="" class="rounded-lg w-fit d-flex flex-row align-center">
    <div class="pa-3">
      <v-avatar color="white" class="mr-1">
        <v-img src="" alt="Avatar"></v-img>
      </v-avatar>
      GitHub
    </div>
    <v-divider vertical></v-divider>
    <v-avatar class="ma-3 rounded-0" color="transparent">
      <v-icon size="40" icon="mdi-github" />
    </v-avatar>
  </v-card>

  <h1 class="sub-header">Resources</h1>
  <ul>
    <li>
      <a
        href="https://nierautomata.wiki.fextralife.com/Nier+Automata+Wiki"
        target="_blank"
        rel="noopener"
        class="custom-link"
      >
        Fextralife NieR: Automata Wiki
      </a>
      <span class="text-medium-emphasis">- Data & guides</span>
    </li>
    <li>
      <a
        href="https://nier.fandom.com/wiki/NieR:Automata"
        target="_blank"
        rel="noopener"
        class="custom-link"
      >
        Fandom NieR: Automata Wiki
      </a>
      <span class="text-medium-emphasis">- Data</span>
    </li>
    <li>
      <a
        href="https://steamcommunity.com/sharedfiles/filedetails/?id=1690393671"
        target="_blank"
        rel="noopener"
        class="custom-link"
      >
        Steam Community - 100% Guide to NieR:Automata™ by Nex
      </a>
      <span class="text-medium-emphasis">- Data</span>
    </li>
  </ul>
</template>

<script lang="ts" setup></script>

<style></style>
