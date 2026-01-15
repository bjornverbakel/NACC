import { vuetifyConfig } from './vuetify.config'

const isGitHubActions = process.env.GITHUB_ACTIONS === 'true'
// Build-time rendering (Nitro prerender, zero-runtime sitemap, OG image generation)
// can fail in CI when runtime secrets are intentionally not available.
// Keep it enabled everywhere except GitHub Actions.
const enableBuildTimeArtifacts = !isGitHubActions

export default defineNuxtConfig({
  // Framework
  compatibilityDate: '2025-02-19',
  future: {
    compatibilityVersion: 4,
  },
  experimental: {
    checkOutdatedBuildInterval: 5 * 60 * 1000, // 5 minutes
  },

  // Modules
  modules: [
    '@nuxt/fonts',
    '@nuxtjs/seo',
    'nuxt-og-image', // Should be added by nuxt-seo, but its causing errors if not added separately
    '@nuxtjs/supabase',
    '@nuxtjs/turnstile',
    'vuetify-nuxt-module',
  ],

  // Styling
  css: ['~/assets/styles/main.scss'],

  // Auto-imports
  components: [
    {
      path: '~/components/',
      pathPrefix: false,
    },
  ],
  imports: {
    dirs: ['composables/**'],
  },

  // SEO
  sitemap: {
    zeroRuntime: enableBuildTimeArtifacts,
  },
  ogImage: {
    enabled: enableBuildTimeArtifacts,
  },

  // Runtime config (env)
  runtimeConfig: {
    turnstile: {
      secretKey: process.env.TURNSTILE_SECRET_KEY,
    },
    public: {
      turnstile: {
        siteKey: process.env.TURNSTILE_SITEKEY,
      },
    },
  },

  // Module config
  supabase: {
    redirectOptions: {
      login: '/login',
      callback: '/confirm',
      include: ['/settings', '/new-password'],
    },
    types: '~/types/database.types.ts',
  },
  vuetify: {
    moduleOptions: {
      /* module specific options */
    },
    vuetifyOptions: vuetifyConfig,
  },

  // Site metadata
  site: {
    url: 'https://poddata.net',
    name: 'Pod Data',
  },

  // App metadata
  app: {
    head: {
      charset: 'utf-16',
      viewport: 'width=device-width, initial-scale=1, maximum-scale=1',
      htmlAttrs: {
        lang: 'en',
      },
      bodyAttrs: {
        class: 'font-base',
      },
      link: [
        {
          rel: 'icon',
          type: 'image/svg+xml',
          href: '/img/robot-primary.svg',
          media: '(prefers-color-scheme: light)',
        },
        {
          rel: 'icon',
          type: 'image/svg+xml',
          href: '/img/robot-secondary.svg',
          media: '(prefers-color-scheme: dark)',
        },
      ],
    },
  },

  // Routing & caching
  routeRules: {
    '/': { swr: true },
    ...(enableBuildTimeArtifacts
      ? {
          '/about': { prerender: true },
          '/disclaimer': { prerender: true },
        }
      : {}),
  },

  // Server
  nitro: {
    preset: 'vercel',
    future: {
      nativeSWR: true,
    },
  },
})
