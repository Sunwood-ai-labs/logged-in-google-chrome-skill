# Troubleshooting

## Google says the browser may not be secure

- Launch normal Chrome with a dedicated `--user-data-dir`.
- Let the user log in manually.
- Attach Playwright only after login by using `chromium.connectOverCDP(...)`.
- Do not use `launchPersistentContext()` for the login step against Google pages.

## CDP port does not open

- Make sure Chrome was launched with `--remote-debugging-port=<port>`.
- Make sure the dedicated profile folder is not already owned by a different Chrome process.
- Run [scripts/close_logged_in_chrome.ps1](../scripts/close_logged_in_chrome.ps1), then relaunch.
- Run [scripts/check_cdp_port.ps1](../scripts/check_cdp_port.ps1) to confirm the CDP endpoint.
- If the launch script returns but no `chrome.exe` process is using the dedicated profile, do not continue to Playwright attach. Relaunch and verify the process appears first.
- If a profile-specific Chrome process exists but the CDP endpoint never opens, close that profile with [scripts/close_logged_in_chrome.ps1](../scripts/close_logged_in_chrome.ps1) and relaunch.

## Browser launches but Playwright cannot attach

- Confirm the port matches the launch script.
- Confirm a local workspace has `playwright` or `playwright-core` available.
- Reconnect with `chromium.connectOverCDP("http://127.0.0.1:9222")`.

## Launch script hangs or behaves inconsistently

- Prefer the updated `scripts/launch_logged_in_chrome.ps1`, which now waits for the dedicated-profile Chrome process plus the CDP endpoint before reporting success.
- If the script fails, inspect whether any `chrome.exe` process is using the dedicated `UserDataDir` before retrying.
- Treat "command returned" and "Chrome is ready" as different checks. A successful workflow requires both the dedicated profile process and the CDP endpoint.

## Main Chrome profile gets involved by mistake

- Stop and switch back to the dedicated profile folder.
- Do not use `%LOCALAPPDATA%\Google\Chrome\User Data` for this workflow.
