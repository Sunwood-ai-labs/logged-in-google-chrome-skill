# Troubleshooting

## 🚫 Google says the browser may not be secure

- Make sure login is happening in normal Chrome, not a Playwright-launched Chrome context
- Use `scripts/launch_logged_in_chrome.ps1`
- Log in manually before attaching Playwright

## 🔌 CDP port is not reachable

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_cdp_port.ps1
```

If it fails:

- close the dedicated browser
- relaunch it
- make sure the chosen port is not already taken
- make sure a `chrome.exe` process is actually using the dedicated profile before trying to attach
- treat "launch command returned" and "CDP is ready" as separate checks

## Launch script returned but Chrome is still not ready

- The updated launch script waits for both the dedicated-profile process and the CDP endpoint
- If it still fails, do not attach Playwright yet
- Close the dedicated-profile browser, relaunch it, and re-run the CDP check

## 🎭 Playwright cannot attach

- Confirm that `playwright-core` is available in the current workspace
- Confirm the correct port
- Reattach with `chromium.connectOverCDP("http://127.0.0.1:9222")`

## 🧭 The wrong Chrome profile opened

- Stop the browser
- relaunch using the dedicated `UserDataDir`
- do not reuse `%LOCALAPPDATA%\Google\Chrome\User Data`
