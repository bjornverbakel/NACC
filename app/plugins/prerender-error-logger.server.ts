export default defineNuxtPlugin(nuxtApp => {
  nuxtApp.hook('app:error', error => {
    const event = nuxtApp.ssrContext?.event
    const path = event?.path
    const isPrerenderRequest = !!event?.node?.req?.headers?.['x-nitro-prerender']

    // Avoid noisy logs in normal runtime unless needed.
    if (isPrerenderRequest || process.env.CI) {
      const safeError = {
        name: (error as any)?.name,
        message: (error as any)?.message,
        stack: (error as any)?.stack,
      }

      // eslint-disable-next-line no-console
      console.error('[prerender] SSR error', { path, ...safeError })
    }
  })
})
