# Architecture

## Core idea

The workflow intentionally separates login from automation.

## Diagram files

- Repository Structure: [SVG preview](/logged-in-google-chrome-repository-structure.svg) / [Draw.io source](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-repository-structure.drawio)
- Runtime Workflow: [SVG preview](/logged-in-google-chrome-runtime-workflow.svg) / [Draw.io source](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-runtime-workflow.drawio)
- Boundaries and Rules: [SVG preview](/logged-in-google-chrome-boundaries-and-rules.svg) / [Draw.io source](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-boundaries-and-rules.drawio)
- Repository Structure (JA): [SVG preview](/logged-in-google-chrome-repository-structure-ja.svg) / [Draw.io source](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-repository-structure-ja.drawio)
- Runtime Workflow (JA): [SVG preview](/logged-in-google-chrome-runtime-workflow-ja.svg) / [Draw.io source](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-runtime-workflow-ja.drawio)
- Boundaries and Rules (JA): [SVG preview](/logged-in-google-chrome-boundaries-and-rules-ja.svg) / [Draw.io source](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-boundaries-and-rules-ja.drawio)

## What Each Diagram Shows

- `Repository Structure`: main skill files, scripts, docs, and metadata
- `Runtime Workflow`: the happy-path flow from launching Chrome to reusing the authenticated session
- `Boundaries and Rules`: the separation between the main Chrome profile and the dedicated automation profile, plus the core safety rules

## SVG previews

### Repository Structure

![Repository Structure](/logged-in-google-chrome-repository-structure.svg)

### Runtime Workflow

![Runtime Workflow](/logged-in-google-chrome-runtime-workflow.svg)

### Boundaries and Rules

![Boundaries and Rules](/logged-in-google-chrome-boundaries-and-rules.svg)

## Sequence

1. Chrome starts as a regular user-facing browser
2. The browser uses a dedicated `--user-data-dir`
3. The user logs in manually
4. Chrome exposes a CDP port
5. Playwright attaches over CDP
6. Automation continues in the already authenticated browser

## Why Not `launchPersistentContext()` For Login

Google can treat automation-first browser launches differently and may reject login with a security warning. By launching normal Chrome first and attaching later, the workflow is often more stable for Google sign-in pages.

## Important Boundary

- Main daily Chrome profile: for human browsing
- Dedicated automation profile: for logged-in agent workflows

Do not mix them.
