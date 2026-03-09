# Architecture

## Core idea

The workflow intentionally separates login from automation.

## Sequence

1. Chrome starts as a regular user-facing browser
2. The browser uses a dedicated `--user-data-dir`
3. The user logs in manually
4. Chrome exposes a CDP port
5. Playwright attaches over CDP
6. Automation continues in the already authenticated browser

## Why not launchPersistentContext for login

Google can treat automation-first browser launches differently and may reject login with a security warning. By launching normal Chrome first and attaching later, the workflow is often more stable for Google sign-in pages.

## Important boundary

- Main daily Chrome profile: for human browsing
- Dedicated automation profile: for logged-in agent workflows

Do not mix them.
