-- 1. Monthly P&L
SELECT YEAR([Date]) AS ReportYear,MONTH([Date]) AS ReportMonth, SUM(Revenue) AS Revenue,SUM(Expense) AS Expense,SUM(Revenue-Expense) AS Profit,100.0*SUM(Revenue-Expense)/NULLIF(SUM(Revenue),0) AS MarginPct FROM dbo.FactFinancials GROUP BY YEAR([Date]),MONTH([Date]) ORDER BY 1,2;
-- 2. Branch ranking (2026)
WITH p AS (SELECT b.BranchID,b.BranchName,b.Region,SUM(f.Revenue) Revenue,SUM(f.Expense) Expense,SUM(f.Revenue-f.Expense) Profit FROM dbo.FactFinancials f JOIN dbo.DimBranch b ON b.BranchID=f.BranchID WHERE f.[Date]>='20260101' AND f.[Date]<'20270101' GROUP BY b.BranchID,b.BranchName,b.Region) SELECT *,DENSE_RANK() OVER(ORDER BY Profit DESC) AS ProfitRank FROM p ORDER BY ProfitRank;
-- 3. Budget variance
SELECT YEAR([Date]) ReportYear,SUM(Revenue) ActualRevenue,SUM(BudgetRevenue) BudgetRevenue,SUM(Revenue-BudgetRevenue) RevenueVariance,100.0*SUM(Revenue-BudgetRevenue)/NULLIF(SUM(BudgetRevenue),0) RevenueVariancePct FROM dbo.FactFinancials GROUP BY YEAR([Date]);
-- 4. Churn (monthly opening eligible cohort)
SELECT [Month],SUM(CAST(ChurnFlag AS int)) Churned,SUM(CAST(OpeningEligibleFlag AS int)) Eligible,100.0*SUM(CAST(ChurnFlag AS int))/NULLIF(SUM(CAST(OpeningEligibleFlag AS int)),0) ChurnPct FROM dbo.FactCustomerStatus GROUP BY [Month] ORDER BY [Month];
-- 5. Reconciliation and quality checks (all should return zero discrepancies)
SELECT [Date],BranchID,ProductID,COUNT(*) DuplicateCount FROM dbo.FactFinancials GROUP BY [Date],BranchID,ProductID HAVING COUNT(*)>1;
SELECT COUNT(*) AS NullCriticalRows FROM dbo.FactFinancials WHERE Revenue IS NULL OR Expense IS NULL OR BudgetRevenue IS NULL;
-- 6. YoY revenue
WITH a AS(SELECT YEAR([Date]) y,SUM(Revenue) rev FROM dbo.FactFinancials GROUP BY YEAR([Date])) SELECT cur.y,cur.rev,prev.rev PreviousRevenue,100.0*(cur.rev-prev.rev)/NULLIF(prev.rev,0) YoYPct FROM a cur LEFT JOIN a prev ON prev.y=cur.y-1;
