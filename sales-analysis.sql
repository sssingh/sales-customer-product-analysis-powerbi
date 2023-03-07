USE [AdventureWorksDW2019]

-- Dimention: Date
DROP 
  VIEW IF EXISTS vw_date 
GO 
CREATE VIEW vw_date AS 
SELECT 
  [DateKey],
  [FullDateAlternateKey] AS [Date],
  [DayNumberOfWeek], 
  [EnglishDayNameOfWeek] AS [Day], 
  [DayNumberOfMonth] AS [Day Nr], 
  [EnglishMonthName] AS [Month], 
  [MonthNumberOfYear] AS [Month Nr], 
  [CalendarQuarter] AS [Quarter], 
  [CalendarYear] AS [Year] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate] 
GO 

-- Dimention: Customer
DROP 
  VIEW IF EXISTS vw_customer 
GO 
CREATE VIEW vw_customer AS 
SELECT 
  [CustomerKey], 
  CONCAT([FirstName], ' ', [LastName]) AS [Full Name], 
  CASE [MaritalStatus] WHEN 'M' THEN 'Married' WHEN 'S' THEN 'Single' END AS [Marital Status], 
  CASE [Gender] WHEN 'M' THEN 'Male' ELSE 'Female' END AS [Gender], 
  [YearlyIncome], 
  [TotalChildren], 
  [EnglishEducation], 
  [EnglishOccupation], 
  [HouseOwnerFlag], 
  [NumberCarsOwned], 
  [DateFirstPurchase], 
  GEOG.City AS [City], 
  GEOG.EnglishCountryRegionName AS [Country] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS CUST 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimGeography] AS GEOG ON GEOG.GeographyKey = CUST.GeographyKey 
GO 

-- Dimention: Product
DROP 
  VIEW IF EXISTS vw_product 
GO 
CREATE VIEW vw_product AS 
SELECT 
  [ProductKey], 
  CATG.EnglishProductCategoryName AS [Category], 
  SUBC.EnglishProductSubcategoryName AS [Sub Category], 
  [EnglishProductName], 
  [Color], 
  [ListPrice], 
  [ProductLine], 
  [Class], 
  [Style], 
  [ModelName], 
  [EnglishDescription], 
  [StartDate], 
  [EndDate], 
  [Status] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] AS PROD 
  LEFT JOIN [AdventureWorksDW2019].[dbo].DimProductSubcategory AS SUBC ON SUBC.ProductSubcategoryKey = PROD.ProductSubcategoryKey 
  LEFT JOIN [AdventureWorksDW2019].[dbo].DimProductCategory AS CATG ON CATG.ProductCategoryKey = SUBC.ProductCategoryKey 
WHERE 
  PROD.FinishedGoodsFlag = 1 
GO 

-- Fact: Internet Sales for (2016-2017)
DROP 
  VIEW IF EXISTS vw_internet_sales 
GO 
CREATE VIEW vw_internet_sales AS 
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  [SalesOrderNumber], 
  [SalesAmount] 
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales]
  WHERE LEFT([OrderDateKey], 4) IN (2017, 2016)
GO
