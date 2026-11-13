-- SQL Server 2019+; run in a dedicated database. All data synthetic.
-- Create database separately, then run this script.
CREATE TABLE dbo.DimBranch (BranchID int PRIMARY KEY, BranchName varchar(80), Region varchar(40), State char(2));
CREATE TABLE dbo.DimProduct (ProductID int PRIMARY KEY, ProductName varchar(80), ProductCategory varchar(40));
CREATE TABLE dbo.DimCustomer (CustomerID int PRIMARY KEY, BranchID int REFERENCES dbo.DimBranch(BranchID), Segment varchar(40), JoinDate date);
CREATE TABLE dbo.DimDate ([Date] date PRIMARY KEY, [Year] int, [Quarter] int, [Month] int, MonthName varchar(10));
CREATE TABLE dbo.FactFinancials ([Date] date REFERENCES dbo.DimDate([Date]), BranchID int REFERENCES dbo.DimBranch(BranchID), ProductID int REFERENCES dbo.DimProduct(ProductID), Revenue decimal(18,2), Expense decimal(18,2), BudgetRevenue decimal(18,2), BudgetExpense decimal(18,2), CONSTRAINT PK_Financials PRIMARY KEY ([Date],BranchID,ProductID));
CREATE TABLE dbo.FactCustomerStatus (CustomerID int REFERENCES dbo.DimCustomer(CustomerID), [Month] date REFERENCES dbo.DimDate([Date]), ActiveFlag bit, ChurnFlag bit, OpeningEligibleFlag bit, CONSTRAINT PK_CustomerStatus PRIMARY KEY(CustomerID,[Month]));
CREATE TABLE dbo.FactTransactions (TransactionID int PRIMARY KEY, [Date] date REFERENCES dbo.DimDate([Date]), CustomerID int REFERENCES dbo.DimCustomer(CustomerID), BranchID int REFERENCES dbo.DimBranch(BranchID), ProductID int REFERENCES dbo.DimProduct(ProductID), Amount decimal(18,2), TransactionType varchar(30));
-- Load CSVs in dependency order: DimBranch, DimProduct, DimCustomer, DimDate, FactFinancials, FactCustomerStatus, FactTransactions.
-- In SSMS use Import Flat File, or BULK INSERT with an accessible SQL Server path.
