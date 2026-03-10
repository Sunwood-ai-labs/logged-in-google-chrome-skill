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
      text: Case Studies
      link: /guide/case-studies
    - theme: alt
      text: Japanese Docs
      link: /ja/
    - theme: alt
      text: GitHub
      link: https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill

features:
  - title: Dedicated Chrome Profile
    details: Keep your everyday Chrome profile separate from automation by using a custom user-data-dir.
  - title: Manual Google Login
    details: Sign into Google in a regular Chrome window to avoid the automation security warning.
  - title: Playwright over CDP
    details: Attach Playwright after login with connectOverCDP() and reuse the authenticated browser session.
  - title: Real Case Studies
    details: Follow concrete examples that move from Google login to actual work products, not just browser setup.
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

## Featured Case Study

The [`logged-in-google-chrome-skill-test`](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test) report shows this skill being used to create and run a Google Apps Script project that generates a sample sales spreadsheet.

- It reuses a manually authenticated Chrome profile
- It attaches Playwright over CDP instead of logging in from an automated browser
- It creates a script project, pastes code, runs it, approves access, and verifies the resulting spreadsheet

- [Read the Apps Script case study](/guide/case-studies)

## Quick Links

- [Getting Started](/guide/getting-started)
- [Usage](/guide/usage)
- [Case Studies](/guide/case-studies)
- [Architecture](/guide/architecture)
- [Troubleshooting](/guide/troubleshooting)
- [Release Notes](/guide/release-notes)
