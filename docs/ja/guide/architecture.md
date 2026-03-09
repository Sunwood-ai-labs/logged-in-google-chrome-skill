# 構成

## 基本思想

ログインと自動操作を意図的に分離します。

## 手順

1. 通常の Chrome を起動する
2. 専用 `--user-data-dir` を使う
3. ユーザーが手動でログインする
4. Chrome が CDP ポートを公開する
5. Playwright が CDP 接続する
6. ログイン済みブラウザで自動操作を続ける

## なぜ login を launchPersistentContext に載せないのか

Google ログインは、automation-first なブラウザ起動に対して警告を出すことがあります。通常 Chrome を先に起動して、あとから CDP 接続する方が安定しやすいです。

## 大事な境界

- 普段使いの Chrome: 人間用
- 専用 automation プロファイル: エージェント用

混ぜないことが重要です。
