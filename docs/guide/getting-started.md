# Getting Started

## 📋 Prerequisites

- Windows
- Google Chrome
- Node.js 20+
- A workspace with `playwright` or `playwright-core`

## 🚀 Launch the dedicated browser

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1
```

The launch step is only complete when both of these are true:

- a `chrome.exe` process is using the dedicated profile directory
- the CDP endpoint `http://127.0.0.1:<port>/json/version` is reachable

The default launch uses:

- `D:\Prj\onizuka-playwright-profile`
- port `9222`
- `https://accounts.google.com/`

## 🔐 Log in manually

Use the newly opened Chrome window and complete Google login yourself.

## 🔎 Verify the CDP port

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_cdp_port.ps1
```

If this check fails, stop and relaunch instead of attempting Playwright attach anyway.

## 🎭 Attach Playwright

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
