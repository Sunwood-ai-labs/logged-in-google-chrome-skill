import { defineConfig } from "vitepress";

const siteTitle = "Logged In Google Chrome Skill";
const siteDescription =
  "Launch a dedicated Google Chrome profile, sign in manually, and attach Playwright over CDP.";
const siteOrigin = "https://sunwood-ai-labs.github.io";
const siteBase = "/logged-in-google-chrome-skill/";
const siteUrl = new URL(siteBase, siteOrigin).toString();
const ogImageUrl = new URL("ogp.svg", siteUrl).toString();

const socialLinks = [
  {
    icon: "github",
    link: "https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill",
  },
];

const footer = {
  message: "Built for practical logged-in Chrome + Playwright workflows.",
  copyright: "Copyright (c) 2026 Sunwood AI Labs",
};

function toPagePath(page: string): string {
  if (page === "index.md") return "/";
  if (page.endsWith("/index.md")) return `/${page.replace(/\/index\.md$/, "")}/`;
  return `/${page.replace(/\.md$/, "")}`;
}

function toAbsoluteUrl(path: string): string {
  return new URL(path.replace(/^\/+/, ""), siteUrl).toString();
}

export default defineConfig({
  title: siteTitle,
  description: siteDescription,
  base: siteBase,
  lang: "en-US",
  head: [
    ["link", { rel: "icon", type: "image/svg+xml", href: `${siteBase}favicon.svg` }],
    ["meta", { name: "theme-color", content: "#4285f4" }],
  ],
  sitemap: {
    hostname: siteUrl,
  },
  transformHead({ page, title, description }) {
    const pageUrl = toAbsoluteUrl(toPagePath(page));
    const locale = page.startsWith("ja/") ? "ja_JP" : "en_US";

    return [
      ["link", { rel: "canonical", href: pageUrl }],
      ["meta", { property: "og:type", content: "website" }],
      ["meta", { property: "og:site_name", content: siteTitle }],
      ["meta", { property: "og:locale", content: locale }],
      ["meta", { property: "og:title", content: title }],
      ["meta", { property: "og:description", content: description }],
      ["meta", { property: "og:url", content: pageUrl }],
      ["meta", { property: "og:image", content: ogImageUrl }],
      ["meta", { property: "og:image:type", content: "image/svg+xml" }],
      ["meta", { property: "og:image:alt", content: "Logged In Google Chrome Skill social card" }],
      ["meta", { name: "twitter:card", content: "summary_large_image" }],
      ["meta", { name: "twitter:title", content: title }],
      ["meta", { name: "twitter:description", content: description }],
      ["meta", { name: "twitter:image", content: ogImageUrl }],
    ];
  },
  locales: {
    root: {
      label: "English",
      lang: "en-US",
      title: siteTitle,
      description: siteDescription,
      themeConfig: {
        logo: "/favicon.svg",
        nav: [
          { text: "Home", link: "/" },
          { text: "Guide", link: "/guide/getting-started" },
          { text: "GitHub", link: "https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill" },
        ],
        sidebar: [
          {
            text: "Guide",
            items: [
              { text: "Getting Started", link: "/guide/getting-started" },
              { text: "Usage", link: "/guide/usage" },
              { text: "Architecture", link: "/guide/architecture" },
              { text: "Troubleshooting", link: "/guide/troubleshooting" },
            ],
          },
        ],
        socialLinks,
        footer,
      },
    },
    ja: {
      label: "\u65e5\u672c\u8a9e",
      lang: "ja-JP",
      title: siteTitle,
      description:
        "\u5c02\u7528 Chrome \u30d7\u30ed\u30d5\u30a1\u30a4\u30eb\u3092\u901a\u5e38\u8d77\u52d5\u3057\u3001\u624b\u52d5\u30ed\u30b0\u30a4\u30f3\u5f8c\u306b Playwright \u3092 CDP \u63a5\u7d9a\u3067\u6271\u3046\u305f\u3081\u306e\u30ac\u30a4\u30c9\u3002",
      themeConfig: {
        logo: "/favicon.svg",
        nav: [
          { text: "\u30db\u30fc\u30e0", link: "/ja/" },
          { text: "\u30ac\u30a4\u30c9", link: "/ja/guide/getting-started" },
          { text: "GitHub", link: "https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill" },
        ],
        sidebar: [
          {
            text: "\u30ac\u30a4\u30c9",
            items: [
              { text: "\u306f\u3058\u3081\u306b", link: "/ja/guide/getting-started" },
              { text: "\u4f7f\u3044\u65b9", link: "/ja/guide/usage" },
              { text: "\u69cb\u6210", link: "/ja/guide/architecture" },
              { text: "\u30c8\u30e9\u30d6\u30eb\u30b7\u30e5\u30fc\u30c8", link: "/ja/guide/troubleshooting" },
            ],
          },
        ],
        socialLinks,
        footer,
      },
    },
  },
  themeConfig: {
    socialLinks,
    footer,
  },
});
