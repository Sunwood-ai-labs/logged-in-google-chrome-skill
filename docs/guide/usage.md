# Usage

## 🚀 Launch

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1
```

## 🧹 Close the dedicated browser

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\close_logged_in_chrome.ps1
```

## ⚙️ Use a custom profile directory or port

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1 `
  -UserDataDir "D:\Prj\my-google-agent-profile" `
  -Port 9333 `
  -Url "https://mail.google.com/"
```

## 🔄 Typical automation flow

1. Launch dedicated Chrome
2. Log into Google manually
3. Check the CDP port
4. Attach Playwright
5. Navigate to Gmail or another Google app
6. Keep reusing the attached browser for follow-up tasks

## ✉️ Example Gmail navigation

```javascript
await attachedPage.goto("https://mail.google.com/mail/u/0/#inbox", {
  waitUntil: "domcontentloaded",
});
```
