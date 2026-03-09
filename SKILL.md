---
name: logged-in-google-chrome
description: Launch and reuse a Google Chrome session that is logged into a Google account by using a dedicated user-data-dir and attaching Playwright over CDP after manual login. Use when Codex needs to work with Gmail, Google Account pages, or other Google web apps without triggering the "browser or app may not be secure" login block from a Playwright-launched browser.
---

# Logged In Google Chrome

Use a dedicated Chrome user-data-dir and attach Playwright only after Chrome is already running.

## Quick Start

1. Run [scripts/launch_logged_in_chrome.ps1](./scripts/launch_logged_in_chrome.ps1) to start normal Chrome with a dedicated profile folder and a CDP port.
2. Let the user log in manually if the profile is not logged in yet.
3. In `js_repl`, attach Playwright with `chromium.connectOverCDP("http://127.0.0.1:<port>")`.
4. Reuse the attached browser and page handles for the rest of the task.

## Defaults

- Default user-data-dir: `D:\Prj\onizuka-playwright-profile`
- Default CDP port: `9222`
- Default login URL: `https://accounts.google.com/`

## Rules

- Do not log into Google from a Playwright-launched Chrome window.
- Do not point Playwright at `%LOCALAPPDATA%\Google\Chrome\User Data`.
- Do use a dedicated user-data-dir that is separate from the user's everyday Chrome profile.
- Do launch Chrome first as a normal browser, then attach Playwright over CDP.
- Do keep the attached CDP browser alive across steps instead of reconnecting unless the process changed.

## Launch

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1
```

If a stale browser is already using the same profile folder, close it first:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\close_logged_in_chrome.ps1
```

## Attach From js_repl

Use a local workspace that already has `playwright` or `playwright-core` installed, then attach:

```javascript
var chromium;
var attachedBrowser;
var attachedContext;
var attachedPage;

{
  const nm = await import("node:module");
  const requireForPw = nm.createRequire("file:///D:/Prj/demo/package.json");
  ({ chromium } = requireForPw("playwright-core"));

  attachedBrowser = await chromium.connectOverCDP("http://127.0.0.1:9222");
  attachedContext = attachedBrowser.contexts()[0];
  attachedPage = attachedContext.pages()[0];
}
```

After attaching, navigate and automate normally.

## Verify Before Automating

- Confirm the browser window is the dedicated profile, not the user's main Chrome.
- Confirm the user has finished manual login if the task depends on Google auth.
- Confirm the CDP port is reachable by running [scripts/check_cdp_port.ps1](./scripts/check_cdp_port.ps1) if attachment fails.

## Troubleshooting

Read [references/troubleshooting.md](./references/troubleshooting.md) when:

- Google shows "This browser or app may not be secure"
- `connectOverCDP()` fails
- the CDP port is not reachable
- a stale profile lock prevents launch
