# トラブルシュート

## 🚫 このブラウザまたはアプリは安全でない可能性があります

- ログインを Playwright 起動 Chrome で行っていないか確認
- `scripts/launch_logged_in_chrome.ps1` で通常 Chrome を起動
- 手動ログイン完了後にだけ Playwright を接続

## 🔌 CDP ポートにつながらない

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_cdp_port.ps1
```

失敗する場合:

- 専用ブラウザを閉じる
- もう一度起動する
- ポート競合がないか確認する
- 専用プロフィールを使う `chrome.exe` プロセスが本当に存在するか確認する
- 「起動コマンドが返ったこと」と「CDP 接続できること」は別チェックとして扱う

## ⏳ 起動コマンドは終わったのに Chrome 準備ができない

- 更新後の起動スクリプトは、専用プロフィールの Chrome プロセスと CDP エンドポイントの両方を待機する
- それでも失敗した場合は、Playwright を先に接続しない
- Chrome を閉じてから再起動し、`scripts/check_cdp_port.ps1` を再実行する

## 🎭 Playwright が接続できない

- 現在のワークスペースで `playwright-core` が使えるか確認
- ポート番号が合っているか確認
- `chromium.connectOverCDP("http://127.0.0.1:9222")` で再接続

## 🧭 間違った Chrome プロファイルが開いた

- ブラウザを止める
- 専用 `UserDataDir` を明示して再起動
- `%LOCALAPPDATA%\Google\Chrome\User Data` を使わない
