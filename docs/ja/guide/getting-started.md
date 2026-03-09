# はじめに

## 前提

- Windows
- Google Chrome
- Node.js 20 以上
- `playwright` または `playwright-core` が使えるワークスペース

## 専用ブラウザを起動

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1
```

デフォルト設定:

- `D:\Prj\onizuka-playwright-profile`
- ポート `9222`
- `https://accounts.google.com/`

## 手動でログイン

開いた Chrome で Google に自分でログインします。

## CDP ポート確認

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_cdp_port.ps1
```

## Playwright を接続

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
