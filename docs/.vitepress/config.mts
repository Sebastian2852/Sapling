import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Sapling Framework",
  description: "A VitePress Site",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Docs', link: '/intro' }
    ],

    sidebar: [
      {
        text: 'Intro',
        items: [
          { text: 'Sapling Framework', link: '/intro' },
          { text: 'Installing', link: '/learnMore' },
        ]
      },
      {
        text: "Sapling",
        items: [
          { text: "Sapling", link: "/sapling/intro" },
          { text: "Guide - Services", link: "/sapling/services" },
          { text: "Guide - Lifecycles", link: "/sapling/lifecycles" },
        ],
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/vuejs/vitepress' }
    ]
  }
})
