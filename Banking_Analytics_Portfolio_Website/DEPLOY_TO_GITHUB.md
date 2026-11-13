# Publish your interactive banking analytics website

Repository: https://github.com/AkshayaBathula/enterprise-banking-analytics

## Upload (do not upload the ZIP as the website)

1. Download and extract `Banking_Analytics_Portfolio_Website.zip` on your computer.
2. Open your existing GitHub repository and choose **Add file → Upload files**.
3. Open the extracted website folder in Windows File Explorer. Select the **four files** `index.html`, `styles.css`, `app.js`, and `data.js`. Drag these files into the GitHub upload area. **Place them at the top level (repository root), next to README.md**, not inside `Enterprise_Banking_Analytics` or a new website folder. If GitHub shows paths beginning with a folder name, remove them from the pending upload and drag the individual files instead.
4. Commit changes.
5. In your repository, open **Settings → Pages**. Under **Build and deployment**, choose **Deploy from a branch**. Set **Branch: main**, **Folder: / (root)**, and click **Save**.
6. Wait for the deployment to complete. The expected URL is:
   `https://akshayabathula.github.io/enterprise-banking-analytics/`
7. Open the site, try both year and region filters, and check that all charts update. If you see a 404, wait for the Pages build and check Settings → Pages for its published URL and build status.
8. Add the verified Pages URL to your resume; keep the GitHub repository URL as the source-code link.

## What the website does

- Interactive 2025 / 2026 / both-year and region filters
- Financial KPI cards, monthly revenue/expense trends, actual vs. budget comparisons
- Regional revenue bars and branch ranking
- Customer churn cohort rates, segment breakdown and transaction activity
- Executive decision-support narrative that updates with filters
- All data is aggregated in the browser from the project's original synthetic CSVs and embedded in `data.js`.

## Important limitations

This is a custom HTML/CSS/JavaScript portfolio dashboard, **not a Power BI .pbix file**. The Power BI folder in the repository contains DAX and build instructions. This is an independent portfolio simulation, not professional banking employment. The website is fully static and does not connect to production systems.

## Maintenance

To update the site, replace `index.html`, `styles.css`, `app.js`, or `data.js` in the repository root and commit. The current `data.js` is derived from the existing synthetic project CSVs. No API keys or web hosting subscription are required. The font uses Google Fonts when online; system fonts are used if it cannot load.
