# 事例

## Google Apps Script: スプレッドシート生成スクリプトを作成して実行

関連レポートの [`logged-in-google-chrome-skill-test`](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test) には、2026 年 3 月 9 日時点での具体的な実行記録があります。

この事例では、手動ログイン済みの Chrome セッションを再利用して Google Apps Script を開き、新規プロジェクトの作成、コード貼り付け、実行、権限承認、Google Drive 上の成果物確認までを通しています。

## 目的

このスキルが単なるページ遷移だけでなく、Google 認証が必要な実作業を最後まで完了できることを示すことです。

## 実施内容

1. `D:\Prj\onizuka-playwright-profile` の専用 Chrome プロファイルを起動する
2. Chrome が `9222` ポートで CDP を公開していることを確認する
3. `connectOverCDP("http://127.0.0.1:9222")` で Playwright を接続する
4. `https://script.google.com/home` を開く
5. `Sample Sales Spreadsheet Generator` という Apps Script プロジェクトを作成する
6. `createSampleSalesSpreadsheet()` を貼り付けて保存する
7. スクリプトを実行し、Google の権限承認を完了してスプレッドシート URL を取得する
8. 生成されたスプレッドシートを開き、シート構成とデータを確認する

## 成果物

この事例では、次の成果物が生成されました。

- `Sample Sales Spreadsheet Generator` という Apps Script プロジェクト
- `create_sample_sales_spreadsheet.gs` というスクリプトファイル
- `Orders` シートと `Summary` シートを持つスプレッドシート

スクリプトの中身としては、以下のような出力が作られます。

- サンプル受注データ 60 行
- `Order ID`、`Order Date`、`Region`、`Units`、`Revenue` など 10 列
- 総件数、総売上、平均注文単価、地域別売上をまとめた `Summary` シート

## この事例が示すこと

このケースは、次の点を一度に確認できるため、スキルの有効性を示す事例として分かりやすいです。

- Google にログイン済みのブラウザを再利用できる
- 手動ログイン後に CDP で Playwright を接続できる
- Google の Web エディタ上でコード編集を継続できる
- 権限承認を含む実行フローを通せる
- Google Drive 上に生成された成果物まで検証できる

つまり、このワークフローは「閲覧できた」で終わらず、Google サービス上での作成と実行まで扱えることを示しています。

## 参照

- レポートリポジトリ: [logged-in-google-chrome-skill-test](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test)
- スクリプト本体: [create_sample_sales_spreadsheet.gs](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test/blob/main/create_sample_sales_spreadsheet.gs)
- 処理フロー図: [GAS_process_flow_vertical.svg](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test/blob/main/GAS_process_flow_vertical.svg)
