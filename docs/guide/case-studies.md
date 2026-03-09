# Case Studies

## Google Apps Script: Build and Run a Spreadsheet Generator

The companion report repository [`logged-in-google-chrome-skill-test`](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test) captures a concrete end-to-end use of this skill on March 9, 2026.

The workflow used a manually authenticated Chrome session to open Google Apps Script, create a new project, paste a generator script, run it, approve access, and confirm the resulting spreadsheet in Google Drive.

## Goal

Show that the logged-in Chrome workflow is useful for more than page navigation by completing a real Google-authorized task from start to finish.

## What Happened

1. Launch dedicated Chrome with the reusable profile at `D:\Prj\onizuka-playwright-profile`
2. Confirm Chrome is exposing CDP on port `9222`
3. Attach Playwright with `connectOverCDP("http://127.0.0.1:9222")`
4. Open `https://script.google.com/home`
5. Create a new Apps Script project named `Sample Sales Spreadsheet Generator`
6. Paste `createSampleSalesSpreadsheet()` and save the script
7. Run the script, complete Google authorization, and capture the spreadsheet URL
8. Open the spreadsheet and verify the generated sheets and sample rows

## Output

The case study produced three clear artifacts:

- An Apps Script project named `Sample Sales Spreadsheet Generator`
- A script file named `create_sample_sales_spreadsheet.gs`
- A generated spreadsheet containing `Orders` and `Summary` sheets

The script itself creates:

- 60 sample order rows
- 10 columns including `Order ID`, `Order Date`, `Region`, `Units`, and `Revenue`
- A summary sheet with total orders, total revenue, average order value, and revenue by region

## Why This Matters

This example is a strong proof point for the skill because it combines:

- Google-authenticated browser reuse
- CDP attachment after manual login
- Editor interaction in a Google web app
- Permission approval and script execution
- Verification of a newly created Drive-backed artifact

In other words, it demonstrates that the workflow is practical for actual production-style tasks inside Google properties, not only for viewing already accessible pages.

## References

- Report repository: [logged-in-google-chrome-skill-test](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test)
- Script source: [create_sample_sales_spreadsheet.gs](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test/blob/main/create_sample_sales_spreadsheet.gs)
- Process diagram: [GAS_process_flow_vertical.svg](https://github.com/Sunwood-ai-labs/logged-in-google-chrome-skill-test/blob/main/GAS_process_flow_vertical.svg)
