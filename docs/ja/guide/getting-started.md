# はじめに

## 📋 前提

- Windows
- Google Chrome
- Node.js 20 以上
- `playwright` または `playwright-core` が使えるワークスペース

## 🚀 専用ブラウザを起動

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1
```

この起動ステップは、次の 2 条件がそろって初めて完了です。

- 専用 `UserDataDir` を使う `chrome.exe` プロセスが見えていること
- `http://127.0.0.1:<port>/json/version` に到達できること

デフォルト設定:

- `D:\Prj\onizuka-playwright-profile`
- ポート `9222`
- `https://accounts.google.com/`

## 🔐 手動でログイン

開いた Chrome で Google に自分でログインします。

## 🔎 CDP ポート確認

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_cdp_port.ps1
```

この確認に失敗した場合は、そのまま Playwright 接続へ進まず、Chrome を閉じて再起動してください。

## 🎭 Playwright を接続

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
