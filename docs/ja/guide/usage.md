# 使い方

## 🚀 起動

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1
```

## 🧹 専用ブラウザを閉じる

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\close_logged_in_chrome.ps1
```

## ⚙️ プロファイルやポートを変える

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1 `
  -UserDataDir "D:\Prj\my-google-agent-profile" `
  -Port 9333 `
  -Url "https://mail.google.com/"
```

## 🔄 基本フロー

1. 専用 Chrome を起動
2. Google に手動ログイン
3. CDP ポートを確認
4. Playwright を接続
5. Gmail や Google アプリへ移動
6. 同じ接続を継続利用

## ✉️ Gmail に移動する例

```javascript
await attachedPage.goto("https://mail.google.com/mail/u/0/#inbox", {
  waitUntil: "domcontentloaded",
});
```
