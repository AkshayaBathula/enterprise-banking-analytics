-- Replace C:\banking_data with a folder readable by SQL Server service account.
-- BULK INSERT is server-side and requires permissions; alternatively use SSMS Import Flat File.
-- Example:
BULK INSERT dbo.DimBranch FROM 'C:\banking_data\DimBranch.csv' WITH (FORMAT='CSV',FIRSTROW=2,FIELDQUOTE='"',TABLOCK);
-- Repeat for each table in the dependency order documented in 01_create_schema.sql.
-- For Linux SQL Server use an accessible /var/opt/mssql/... path.
