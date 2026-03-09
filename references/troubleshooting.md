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
- Run [scripts/check_cdp_port.ps1](../scripts/check_cdp_port.ps1) to confirm the port.

## Browser launches but Playwright cannot attach

- Confirm the port matches the launch script.
- Confirm a local workspace has `playwright` or `playwright-core` available.
- Reconnect with `chromium.connectOverCDP("http://127.0.0.1:9222")`.

## Main Chrome profile gets involved by mistake

- Stop and switch back to the dedicated profile folder.
- Do not use `%LOCALAPPDATA%\Google\Chrome\User Data` for this workflow.
