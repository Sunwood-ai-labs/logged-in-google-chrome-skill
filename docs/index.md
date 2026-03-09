---
layout: home

hero:
  name: "Logged In Google Chrome"
  text: "Manual Google login first. Playwright attachment second."
  tagline: "A practical workflow for Gmail and other Google apps using a dedicated Chrome profile and CDP."
  image:
    src: /favicon.svg
    alt: Logged In Google Chrome
  actions:
    - theme: brand
      text: Getting Started
      link: /guide/getting-started
    - theme: alt
      text: Japanese Docs
      link: /ja/
    - theme: alt
      text: GitHub
      link: https://github.com/Sunwood-ai-labs/logged-in-google-chrome

features:
  - title: Dedicated Chrome Profile
    details: Keep your everyday Chrome profile separate from automation by using a custom user-data-dir.
  - title: Manual Google Login
    details: Sign into Google in a regular Chrome window to avoid the automation security warning.
  - title: Playwright over CDP
    details: Attach Playwright after login with connectOverCDP() and reuse the authenticated browser session.
---

## Overview

This project packages a reliable login workflow for Google web apps:

1. Launch normal Chrome with a dedicated profile directory
2. Let the user log in manually
3. Verify the CDP port
4. Attach Playwright and automate the logged-in session

## Who It Is For

- Codex users who want a reusable Google-authenticated browser profile
- Playwright users blocked by Google login warnings in automated browsers
- Agent workflows that need Gmail, Google Account, Drive, or Docs access

## Quick Links

- [Getting Started](/guide/getting-started)
- [Usage](/guide/usage)
- [Architecture](/guide/architecture)
- [Troubleshooting](/guide/troubleshooting)
