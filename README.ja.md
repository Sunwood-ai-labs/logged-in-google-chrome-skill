<div align="center">
  <h1>Logged In Google Chrome Skill</h1>
  <img src="https://raw.githubusercontent.com/Sunwood-ai-labs/logged-in-google-chrome-skill/main/docs/public/logo.svg" alt="Logged In Google Chrome Skill" width="220">
  <p>
    <img src="https://img.shields.io/badge/Chrome-Google%20Chrome-4285F4?logo=googlechrome&logoColor=white" alt="Google Chrome">
    <img src="https://img.shields.io/badge/Playwright-CDP%20Attach-2EAD33?logo=playwright&logoColor=white" alt="Playwright">
    <img src="https://img.shields.io/badge/VitePress-Docs-646CFF?logo=vitepress&logoColor=white" alt="VitePress">
    <img src="https://img.shields.io/badge/Google-Manual%20Login-EA4335?logo=google&logoColor=white" alt="Google Login">
  </p>
  <p>
    <a href="./README.md">
      <img src="https://img.shields.io/badge/Language-English-blue.svg" alt="English">
    </a>
    <a href="./README.ja.md">
      <img src="https://img.shields.io/badge/%E8%A8%80%E8%AA%9E-%E6%97%A5%E6%9C%AC%E8%AA%9E-lightgrey.svg" alt="Japanese">
    </a>
  </p>
</div>

通常の Google Chrome を専用プロファイルで起動し、人間が先に Google ログインを済ませたあとで、Playwright を CDP 接続でぶら下げるためのリポジトリです。Playwright 起動ブラウザに対して Google が出す「このブラウザまたはアプリは安全でない可能性があります」を避けたいときに使います。

## ✨ 特徴

- Gmail、Google アカウント、各種 Google アプリ用に専用 Chrome プロファイルを分離できる
- 普段使いの Chrome プロファイルを自動操作に巻き込まない
- ログイン後に `chromium.connectOverCDP(...)` で Playwright を接続できる
- ログイン済み Chrome セッションを複数のエージェント作業で再利用できる
- 起動・終了・CDP 確認用の PowerShell スクリプトが入っている
- 英語 / 日本語の VitePress ドキュメントを同梱している

## 🎯 このリポジトリの狙い

Google ログインは、Playwright から直接起動したブラウザだと次のような警告で弾かれることがあります。

> このブラウザまたはアプリは安全でない可能性があります

この repo では次の流れを前提にしています。

1. 専用 `--user-data-dir` 付きの通常 Chrome を起動する
2. ユーザーが手動で Google ログインする
3. ログイン後に Playwright を CDP 接続でアタッチする

## 📋 必要環境

- Windows
- Google Chrome
- Node.js 20 以上推奨
- `js_repl` から接続する場合は、どこかのワークスペースに `playwright` または `playwright-core`

## 🗂️ ディレクトリ構成

```text
logged-in-google-chrome-skill/
|- SKILL.md
|- README.md
|- README.ja.md
|- agents/
|  `- openai.yaml
|- references/
|  `- troubleshooting.md
|- scripts/
|  |- launch_logged_in_chrome.ps1
|  |- close_logged_in_chrome.ps1
|  `- check_cdp_port.ps1
`- docs/
   |- .vitepress/
   |- en/
   |- guide/
   |- ja/
   `- public/
```

## 🚀 クイックスタート

### 1. 専用 Chrome を起動

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\launch_logged_in_chrome.ps1
```

起動スクリプトは、次の 2 条件がそろうまで成功として扱いません。

- 専用 `UserDataDir` を使う `chrome.exe` プロセスが存在すること
- CDP エンドポイント `http://127.0.0.1:<port>/json/version` に到達できること

デフォルト値:

- User data dir: `D:\Prj\onizuka-playwright-profile`
- CDP port: `9222`
- 起動 URL: `https://accounts.google.com/`

### 2. Google に手動ログイン

起動した Chrome ウィンドウで、普段どおり自分でログインします。

### 3. CDP ポートを確認

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_cdp_port.ps1
```

専用プロフィールの Chrome プロセスが見つからない場合や、CDP エンドポイント確認に失敗した場合は、そのまま Playwright 接続へ進まないでください。

### 4. Playwright を接続

```javascript
var chromium;
var attachedBrowser;
var attachedContext;
var attachedPage;

{
  const nm = await import("node:module");
  const requireForPw = nm.createRequire("file:///D:/Prj/demo/package.json");
  ({ chromium } = requireForPw("playwright-core"));

  attachedBrowser = await chromium.connectOverCDP("http://127.0.0.1:9222");
  attachedContext = attachedBrowser.contexts()[0];
  attachedPage = attachedContext.pages()[0];
}
```

## 🛠️ スクリプト一覧

| スクリプト | 用途 |
| --- | --- |
| `scripts/launch_logged_in_chrome.ps1` | 専用 user-data-dir と CDP ポート付きで通常 Chrome を起動 |
| `scripts/close_logged_in_chrome.ps1` | 専用プロファイルを使っている Chrome をまとめて終了 |
| `scripts/check_cdp_port.ps1` | CDP ポート到達性を確認 |

## 🔒 運用ルール

- `%LOCALAPPDATA%\Google\Chrome\User Data` を Playwright に直接渡さない
- Google ログイン自体は Playwright 起動 Chrome で行わない
- 自動操作用には必ず専用プロファイルディレクトリを使う
- 手動ログイン完了後にだけ Playwright を接続する

## 📚 ドキュメント

- 英語 docs: [Project Docs](https://sunwood-ai-labs.github.io/logged-in-google-chrome-skill/)
- 日本語 docs: [日本語ドキュメント](https://sunwood-ai-labs.github.io/logged-in-google-chrome-skill/ja/)
- ローカル起動:

```bash
cd docs
npm install
npm run docs:dev
```

Draw.io files:

- Repository Structure: [SVG](./docs/public/logged-in-google-chrome-repository-structure.svg) / [Draw.io](./docs/public/logged-in-google-chrome-repository-structure.drawio)
- Runtime Workflow: [SVG](./docs/public/logged-in-google-chrome-runtime-workflow.svg) / [Draw.io](./docs/public/logged-in-google-chrome-runtime-workflow.drawio)
- Boundaries and Rules: [SVG](./docs/public/logged-in-google-chrome-boundaries-and-rules.svg) / [Draw.io](./docs/public/logged-in-google-chrome-boundaries-and-rules.drawio)
- Repository Structure (JA): [SVG](./docs/public/logged-in-google-chrome-repository-structure-ja.svg) / [Draw.io](./docs/public/logged-in-google-chrome-repository-structure-ja.drawio)
- Runtime Workflow (JA): [SVG](./docs/public/logged-in-google-chrome-runtime-workflow-ja.svg) / [Draw.io](./docs/public/logged-in-google-chrome-runtime-workflow-ja.drawio)
- Boundaries and Rules (JA): [SVG](./docs/public/logged-in-google-chrome-boundaries-and-rules-ja.svg) / [Draw.io](./docs/public/logged-in-google-chrome-boundaries-and-rules-ja.drawio)
- [Architecture guide](./docs/guide/architecture.md)

### Repository Structure (JA)

![Repository Structure JA](./docs/public/logged-in-google-chrome-repository-structure-ja.svg)

### Runtime Workflow (JA)

![Runtime Workflow JA](./docs/public/logged-in-google-chrome-runtime-workflow-ja.svg)

### Boundaries and Rules (JA)

![Boundaries and Rules JA](./docs/public/logged-in-google-chrome-boundaries-and-rules-ja.svg)

## 💡 想定ユースケース

- Gmail をログイン済み状態で開き、エージェントに下書きや送信を任せる
- Google アカウント設定、Google Drive、Google Docs などを同じログインセッションで扱う
- 普段使い Chrome を汚さずに、エージェント用ブラウザ運用を安定化させる

## 📄 ライセンス

ログイン済み Google Chrome 運用を実務で回しやすくするための実用リポジトリとして提供しています。
