---
layout: home

hero:
  name: "Logged In Google Chrome"
  text: "先に手動ログイン、あとから Playwright 接続。"
  tagline: "専用 Chrome プロファイルと CDP を使って、Google サービスを安定して扱うためのドキュメントです。"
  image:
    src: /favicon.svg
    alt: Logged In Google Chrome
  actions:
    - theme: brand
      text: はじめに
      link: /ja/guide/getting-started
    - theme: alt
      text: 事例
      link: /ja/guide/case-studies
    - theme: alt
      text: English Docs
      link: /
    - theme: alt
      text: GitHub
      link: https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill

features:
  - title: 専用 Chrome プロファイル
    details: 普段使いの Chrome を分離しながら、Google にログイン済みの作業用ブラウザを運用できます。
  - title: 手動 Google ログイン
    details: 通常の Chrome でログインしてから接続することで、Google のセキュリティ警告を避けやすくします。
  - title: Playwright の CDP 接続
    details: ログイン後に connectOverCDP() で接続し、そのまま認証済みセッションを再利用できます。
  - title: 実運用の事例
    details: Apps Script や Google Drive を使った具体的な成果物作成フローを追えます。
---

## 概要

このプロジェクトは、Google 系サービスへ安全にアクセスしながら自動化へつなぐ、実践的なログイン運用をまとめたものです。

1. 専用プロファイル付きの通常 Chrome を起動する
2. ユーザーが Google に手動ログインする
3. CDP ポートの疎通を確認する
4. Playwright を接続して認証済みセッションを操作する

## 向いているケース

- Codex や Playwright から Gmail、Google Drive、Google Docs などを扱いたい場合
- Playwright 起動ブラウザで Google ログイン警告に悩まされている場合
- メインの Chrome プロファイルを汚さずに、認証済みブラウザを再利用したい場合

## 注目事例

[`logged-in-google-chrome-skill-test`](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test) では、このスキルを使って Google Apps Script の新規プロジェクト作成からコード投入、実行、スプレッドシート生成確認までを通しています。

- 手動ログイン済み Chrome をそのまま再利用
- Playwright を CDP 経由で接続
- Apps Script プロジェクトを作成し、コードを貼り付けて実行
- `Orders` と `Summary` を持つスプレッドシート生成まで確認

- [Apps Script 事例を読む](/ja/guide/case-studies)

## クイックリンク

- [はじめに](/ja/guide/getting-started)
- [使い方](/ja/guide/usage)
- [事例](/ja/guide/case-studies)
- [構成](/ja/guide/architecture)
- [トラブルシュート](/ja/guide/troubleshooting)
