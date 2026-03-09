---
layout: home

hero:
  name: "Logged In Google Chrome"
  text: "先に手動ログイン、あとから Playwright 接続。"
  tagline: "専用 Chrome プロファイルと CDP を使って、Google 系サービスを安定運用するためのドキュメントです。"
  image:
    src: /favicon.svg
    alt: Logged In Google Chrome
  actions:
    - theme: brand
      text: はじめに
      link: /ja/guide/getting-started
    - theme: alt
      text: English Docs
      link: /
    - theme: alt
      text: GitHub
      link: https://github.com/Sunwood-ai-labs/logged-in-google-chrome

features:
  - title: 専用 Chrome プロファイル
    details: 普段使いの Chrome と分離した user-data-dir で、安全にログイン済みセッションを保持します。
  - title: 手動 Google ログイン
    details: Google ログインは通常 Chrome で人間が行い、セキュリティ警告を回避します。
  - title: Playwright の CDP 接続
    details: ログイン完了後に connectOverCDP() で接続し、そのまま自動操作を続けます。
---

## 概要

このプロジェクトは、Google 系サービスを扱うときの実用的な手順をまとめています。

1. 専用プロファイル付きの通常 Chrome を起動
2. ユーザーが手動ログイン
3. CDP ポートを確認
4. Playwright を後付け接続

## 想定利用者

- Codex や Playwright で Gmail などを扱いたい人
- Google ログインのセキュリティ警告に悩んでいる人
- ログイン済みブラウザを再利用したいエージェント運用

## クイックリンク

- [はじめに](/ja/guide/getting-started)
- [使い方](/ja/guide/usage)
- [構成](/ja/guide/architecture)
- [トラブルシュート](/ja/guide/troubleshooting)
