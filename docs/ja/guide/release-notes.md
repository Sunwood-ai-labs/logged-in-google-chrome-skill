# リリースノート

![リリースノートヘッダー](/releases/v1.0.0-header.svg)

## v1.0.0 初回公開リリース案

公開日: 2026 年 3 月 10 日

このページは、Logged In Google Chrome Skill の現時点の内容を、初回公開向けのリリースノート案としてまとめたものです。主眼は、通常の Chrome を専用プロファイルで起動し、Google に手動ログインしたあとで Playwright を CDP 接続する、安全寄りの運用パターンを再利用しやすい形で提供することにあります。

このリリース専用ヘッダー画像: `/releases/v1.0.0-header.svg`

## ハイライト

- 専用プロファイルの `chrome.exe` プロセスと CDP エンドポイントの両方が準備完了になるまで待つ起動フローを追加しました。
- Chrome 起動、専用ブラウザ終了、CDP ポート確認に必要な PowerShell スクリプトを一式そろえました。
- 手動 Google ログイン後に `chromium.connectOverCDP(...)` で接続する安全な運用パターンをドキュメント化しました。
- GitHub Pages で配信できる英語 / 日本語の VitePress ドキュメントを整備しました。
- アーキテクチャ図と Google Apps Script 事例を追加し、実際に成果物を作れるワークフローであることを示しました。

## このリリースに含まれるもの

- Codex からログイン済み Google Chrome を扱うための `SKILL.md`
- `scripts/launch_logged_in_chrome.ps1`
- `scripts/close_logged_in_chrome.ps1`
- `scripts/check_cdp_port.ps1`
- `docs/` 配下の VitePress ドキュメント
- `docs/public/` 配下の SVG アーキテクチャ図

## このリリースの意味

Google は、自動化ツールが最初から起動したブラウザ内でログインしようとすると、セキュリティ上の理由で弾くことがあります。このリリースでは、ログインを通常 Chrome 側で先に済ませ、Playwright はあとから接続だけを担当する形に整理することで、実務で再利用しやすいリポジトリとしてまとめています。

## 既知の制約

- 現在のスクリプトと説明は Windows を主対象にしています。
- Google ログイン操作そのものは意図的に手動のままです。
- `js_repl` から接続する場合は、別ワークスペース側に `playwright` または `playwright-core` が必要です。

## 次の一手

この内容をそのまま GitHub Release に流用するなら、README の最終確認とライセンス方針の確定後に、初回安定版タグを付ける段階まで持っていけます。
