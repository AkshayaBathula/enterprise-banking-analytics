# Enterprise Business Analytics & Executive Decision Support Platform

**Portfolio implementation: synthetic banking data only.** Random seed 42. FY2025–FY2026, 12 branches, four products, 1,200 synthetic customers, 12,000 transactions, 1152 financial rows, 28800 monthly customer-status rows.

## Deliverables
- `data/`: 7 CSVs and authoritative `metrics_reference.json`
- `sql/`: SQL Server DDL, six analytical queries and CSV loading guidance
- `excel/`: formatted Excel workbook with linked formulas and scenario assumptions
- `powerbi/`: DAX measures and reproducible Power BI Desktop build instructions
- `presentation/`: 8-slide executive briefing, metrics reconciled with CSV data
- `documents/`: BRD, charter, KPI dictionary, stakeholder matrix, user stories, UAT, RACI and risks in one Word pack

## Verified FY2026 financial metrics
- Revenue: $418,690,487.10
- Expense: $287,539,630.70
- Net profit: $131,150,856.40
- Profit margin: 31.3241%
- Revenue growth YoY: 6.1182%
- Revenue budget variance: $-5,328,442.24

## Run order
1. Inspect CSVs and metrics_reference.json.
2. Open Excel workbook; recalculate formulas in Excel if preview values are blank.
3. Create SQL Server database, execute `01_create_schema.sql`, import CSVs in documented dependency order, execute `02_analytics_queries.sql`.
4. In Power BI Desktop follow `powerbi/BUILD_GUIDE.md`; add measures from `measures.dax` one by one.
5. Review the presentation and BA pack; record actual UAT results when you implement the dashboard.

## Limitations
Native `.pbix` is not included: Power BI Desktop is required to build/save the report. No claims of real organizational outcomes or actual stakeholder approvals are made. Customer churn is a simulated monthly snapshot, not a persistent customer lifecycle model.
