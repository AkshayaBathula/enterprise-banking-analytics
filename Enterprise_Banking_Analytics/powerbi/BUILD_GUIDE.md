# Power BI Desktop implementation

1. Get Data > Text/CSV: import all seven CSVs from `data/`.
2. In Power Query set Date/Month/JoinDate to Date; keys to Whole Number; amounts to Decimal Number.
3. Close & Apply. Mark `DimDate` as date table using `DimDate[Date]`.
4. Create single-direction one-to-many relationships: DimDate[Date] -> FactFinancials[Date], FactTransactions[Date], FactCustomerStatus[Month]; DimBranch[BranchID] -> FactFinancials[BranchID], FactTransactions[BranchID], DimCustomer[BranchID]; DimProduct[ProductID] -> FactFinancials[ProductID], FactTransactions[ProductID]; DimCustomer[CustomerID] -> FactTransactions[CustomerID], FactCustomerStatus[CustomerID]. Avoid ambiguous relationship paths: **leave DimBranch -> DimCustomer inactive or remove it** and use branch analysis through FactFinancials / FactTransactions.
5. Create the measures in `measures.dax` one at a time. Format % measures as percentages.
6. Page 1 Executive Overview: cards Total Revenue, Net Profit, Profit Margin %, Revenue YoY %; line chart DimDate[Date] vs Total Revenue and Total Expense; bar chart DimBranch[Region] vs Total Revenue; slicer DimDate[Year]. Filter Year=2026.
7. Page 2 Financial Performance: clustered bars Revenue vs Budget Revenue by month; matrix by Region and Product; KPI Revenue Variance %.
8. Page 3 Branch Analytics: bar chart BranchName vs Net Profit; matrix Region, BranchName with Revenue, Expense, Profit Margin %.
9. Page 4 Customer Intelligence: line chart Month vs Monthly Churn Rate %; Segment slicer (customer status is related to DimCustomer); card Retention Rate %. Churn represents a monthly snapshot, not permanent attrition.
10. Page 5 Strategy: scenario assumptions and recommendations from executive deck. Optional: What-if parameter for growth assumptions.
11. Validate 2026 revenue, expense and profit against `data/metrics_reference.json` and `excel/Banking_Analytics_Financial_Model.xlsx`.
12. Publish only to a suitable workspace with correct access controls. Synthetic dataset contains no real customer identities.

Note: A native `.pbix` cannot be authored reliably in this environment; these files are a complete reproducible build specification.
