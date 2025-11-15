<template>
  <main>
    <section style="padding-top: 5rem; padding-bottom: 7rem; min-height: 100vh; display: flex; flex-direction: column; justify-content: center;">
      <div style="padding: 0 1.5rem; width: 100%; margin: 0 auto; max-width: 72rem;">
        <slot />
        <div style="position: absolute; inset: 0;">
          <div class="background-gradient">
            <div class="background-gradient-pattern"></div>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>
