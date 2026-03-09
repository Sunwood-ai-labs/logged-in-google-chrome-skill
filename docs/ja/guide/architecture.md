# アーキテクチャ

## 概要

この Skill では、Google ログインと自動化を意図的に分離します。

## Draw.io ファイル

- Repository Structure: [SVG プレビュー](/logged-in-google-chrome-repository-structure.svg) / [Draw.io ソース](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-repository-structure.drawio)
- Runtime Workflow: [SVG プレビュー](/logged-in-google-chrome-runtime-workflow.svg) / [Draw.io ソース](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-runtime-workflow.drawio)
- Boundaries and Rules: [SVG プレビュー](/logged-in-google-chrome-boundaries-and-rules.svg) / [Draw.io ソース](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-boundaries-and-rules.drawio)
- Repository Structure (JA): [SVG プレビュー](/logged-in-google-chrome-repository-structure-ja.svg) / [Draw.io ソース](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-repository-structure-ja.drawio)
- Runtime Workflow (JA): [SVG プレビュー](/logged-in-google-chrome-runtime-workflow-ja.svg) / [Draw.io ソース](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-runtime-workflow-ja.drawio)
- Boundaries and Rules (JA): [SVG プレビュー](/logged-in-google-chrome-boundaries-and-rules-ja.svg) / [Draw.io ソース](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill/blob/main/docs/public/logged-in-google-chrome-boundaries-and-rules-ja.drawio)

## 図ごとの役割

- `Repository Structure`: Skill の主要ファイル、スクリプト、ドキュメント、メタデータの構成
- `Runtime Workflow`: Chrome 起動から認証済みセッション再利用までの基本フロー
- `Boundaries and Rules`: 普段使いの Chrome と自動化専用プロファイルの分離、および安全ルール

## SVG プレビュー

### Repository Structure (JA)

![Repository Structure JA](/logged-in-google-chrome-repository-structure-ja.svg)

### Runtime Workflow (JA)

![Runtime Workflow JA](/logged-in-google-chrome-runtime-workflow-ja.svg)

### Boundaries and Rules (JA)

![Boundaries and Rules JA](/logged-in-google-chrome-boundaries-and-rules-ja.svg)

## 英語版 SVG プレビュー

### Repository Structure

![Repository Structure](/logged-in-google-chrome-repository-structure.svg)

### Runtime Workflow

![Runtime Workflow](/logged-in-google-chrome-runtime-workflow.svg)

### Boundaries and Rules

![Boundaries and Rules](/logged-in-google-chrome-boundaries-and-rules.svg)

## 実行シーケンス

1. 通常の Chrome を起動する
2. 専用の `--user-data-dir` を使う
3. ユーザーが手動でログインする
4. Chrome が CDP ポートを公開する
5. Playwright が CDP で接続する
6. 認証済みブラウザをそのまま自動化する

## なぜ `launchPersistentContext()` でログインしないのか

Google は automation-first なブラウザ起動を通常ブラウザとは別扱いにし、ログインを拒否することがあります。通常の Chrome を先に起動し、ログイン後に CDP 接続する方が安定しやすいです。

## 大事な境界

- 普段使いの Chrome プロファイル: 人の通常ブラウジング用
- 自動化専用プロファイル: エージェント作業用

この 2 つは混ぜないでください。
