# Release Notes

![Release Notes Header](/release-notes-header.svg)

## v1.0.0 Initial Public Release Draft

Published: March 10, 2026

This draft captures the current repository state for the first public release of the Logged In Google Chrome Skill. The project is centered on a safer Google login workflow: launch regular Chrome with a dedicated profile, sign in manually, then attach Playwright over CDP.

## Highlights

- Added a dedicated Chrome launch workflow that waits for both the profile-backed `chrome.exe` process and the CDP endpoint to become ready.
- Packaged the operational PowerShell scripts needed to launch Chrome, close the dedicated browser, and verify the configured CDP port.
- Documented the safe attachment pattern for `chromium.connectOverCDP(...)` after manual Google login.
- Published bilingual English and Japanese documentation with GitHub Pages deployment.
- Added architecture diagrams and a Google Apps Script case study that shows the workflow producing a real spreadsheet artifact.

## Included In This Release

- `SKILL.md` guidance for using a logged-in Google Chrome session in Codex
- `scripts/launch_logged_in_chrome.ps1`
- `scripts/close_logged_in_chrome.ps1`
- `scripts/check_cdp_port.ps1`
- VitePress docs under `docs/`
- SVG architecture diagrams under `docs/public/`

## Why This Release Matters

Google often blocks sign-in attempts that begin inside an automation-launched browser. This release packages a practical workaround into a reusable skill repository so the login happens in a normal Chrome window first, while Playwright connects only after the authenticated session already exists.

## Known Constraints

- Windows is the primary supported environment in the current scripts and examples.
- Google login remains a manual step by design.
- Playwright or `playwright-core` must be available from another workspace when you attach through `js_repl`.

## Recommended Next Step

If you want to publish a formal GitHub release after this draft, the repository is in a good position for an initial stable tag once the final README and license decision are locked in.
