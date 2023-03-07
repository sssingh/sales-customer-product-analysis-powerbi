<a href="https://app.powerbi.com/view?r=eyJrIjoiN2RkNGNjOTMtYmMxOC00NzY3LTg0OGEtMmY4YThlNWM5ZmMyIiwidCI6ImFlZDI3MWNkLTYzOTgtNDllZi1hOWNmLTQ4NDIyMTAxZTE0ZSIsImMiOjEwfQ%3D%3D&amp;pageName=ReportSection" target="_blank" rel="noopener"> <img class="pbi" src="https://datamatrix-ml.com/wp-content/uploads/2023/02/Power_BI_small_Logo.png" alt="Click here to open interactive PowerBI report" title="Click here to open interactive PowerBI report" style="width:45px;height:45px;">
Click here to open interactive PowerBI report</a>

# Sales/Customer/Product Analysis
In this ‘Data Analysis’ project, we’ll analyze a `AdventureWorks` is an online retailer;s raw sales data and draw meaningful insights.

<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/title.png?raw=true" width="1000" height="800" />

## Features
⚡Microsoft SQL Server / SQL / T-SQL [For building the datasource]  
⚡PowerBI Desktop [For building the PowerBI dashboard/report]  
⚡PowerQuery Editor [For data-transformation/data-modeling]  
⚡PowerBI Service [For making the report accessible on the web without PowerBI login]  
⚡Multipage fully Interactive Report [For drawing insights and analysis]  

## Table of Contents
- [Introduction](#introduction) 
- [Objective](#objective)
- [Dataset](#dataset)
- [Solution Approach](#solution-approach)
- [How To Use](#how-to-use)
- [License](#license)
- [Credits](#credits)
- [Get in touch](#get-in-touch)


## Introduction

* `AdventureWorks` is an online retailer that sells `Bikes` and `Biking related` items such as bike parts, biking protective gear, clothings etc. 
* Online sales transactions, inventory, financials, customer and product information are captured in real-time in a `transaction-database`.
* End of day after close of business data from transaction-database is extracted, formated and then exported to a `datawarehouse-database` 

## Objective
We have been asked by AdventureWorks to perform the in-depth data analysis for year `2016 and 2017` and draw insight into company sales performance, customers and products so that they can build strategy around it to generate more revenue and higher profits. Specific business requirements/questions are…

|Requirement ID|For Whom|Requirement Description|
|:--|:---|:--|
AW-DA01-REQ-1|Head of Sales|An high-level overview of internet sales by various dimentions such as `customers`, `products`, `customer-cities`, `quarter`|
AW-DA01-REQ-2|Head of Sales|Follow/track `sales performance` over-time against the `budget/target`|
AW-DA01-REQ-3|Head of Sales|Ability to dynamically slice/dice/filter data for `year`, `month`, `product-attributes`|
AW-DA01-REQ-4|Sales Rep|A detailed overview of sales by `customers`|
AW-DA01-REQ-5|Sales Rep|A detailed overview of sales by `products`|
AW-DA01-REQ-6|Sales Rep|Ability to dynamically slice/dice/filter and analyze data by `year`, `month`, `product-attributes`, `customer-attributes`|

***Table-1 : Requirements***

## Dataset
For any data-analysis, AdventureWorks makes data available strictly through its `datawarehouse-database`. The real-time transaction-database is not directly accessible.
### AdventureWorks Datawarehouse
datawarehouse-database schema is shown below... <br>
<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/DW%20Schema.png?raw=true" width="400" height="600" />

The complete datawarehouse-database in form of Microsoft SQL Server  `database-backup`  can be downloaded from [here](https://drive.google.com/file/d/1azhAQjbAV7pgh_A0CSKAErneHr5L4zUu/view?usp=sharing), *refer the [How To Use](#how-to-use) section for more details in terms of how to restore the downloaded bakup to re-create the database*.

### Budget Data
AdventureWorks allocates a monthly budget for sales. Basically its a monthly target set by company against which sales performance for a given month is expected to measured as a key KPI for success. Budget/target is decided and fixed yearly in advance. Note that the budget is decided by company's top management once a year and its not a part datawarehouse-database. AdventureWorks have made the budget available in form a XLS file, a snapshot of 2016/2017 budget is shown below... <br>
<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/budget.png?raw=true" width="400" height="600" />

## Solution Approach
  
|Requirement ID|Solution ID|Proposed Solution|
|:--|:---|:--|
AW-DA01-REQ-1 <br> AW-DA01-REQ-2 <br> AW-DA01-REQ-3|AW-DA01-SOL-1|A `Executive Summary` dashboard/report-page will be build to show high-level overview of sales data. Report will contain visuals showing data as per requirements AW-DA01-REQ-1 & AW-DA01-REQ-2. <br> As per requirements AW-DA01-REQ-3, Year, month `slicers` and required `filters` will be made accessible to user so that he/she can filter/slice the dashborad data dynamically as per their wishes|
AW-DA01-REQ-4 <br> AW-DA01-REQ-6|AW-DA01-SOL-2|A `Customer Analysis` dashboard/report-page will be build that'd show sales data segmented by various `customer` attributes (e.g. top customers, sales by customer gender, sales by customer marital status etc). It'll contain visuals showing data as per requirements AW-DA01-REQ-4. <br> As per requirements AW-DA01-REQ-6, Year, month `slicers` and required `filters` will be made accessible to user so that he/she can filter/slice the dashborad data dynamically as per their wishes|
AW-DA01-REQ-5 <br> AW-DA01-REQ-6|AW-DA01-SOL-3|`Product Analysis` dashboard/report-page will be build that'd show sales data segmented by various `product` attributes (e.g. top customers, sales by customer gender, sales by customer marital status etc). It'll contain visuals showing data as per requirements AW-DA01-REQ-5. <br> As per requirements AW-DA01-REQ-6, Year, month `slicers` and required `filters` will be made accessible to user so that he/she can filter/slice the dashborad data dynamically as per their wishes|

***Table-2 : Proposed Solution***

### Exploratory Data Analysis (EDA)  and Data Preparation [SQL]
To understand, be familiar with and check the sanity of the given data, the first step is EDA. In this project, the initial data exploration has been carried out using `SQL`. Here, in general, we are...
#### EDA
Here we explore the datawarehouse-database to identify the `dimention` and `fact` tables we'd need to as out data source. We further explore the identified tables to understand their structure and data contained in them. Based on the requirements we have identified below tables as our main data source...
|Table|Description|
|:--|:--| 
|`DimDate`|A dimention table containing date-related info|
|`DimCustomer`|A dimention table containing customer-related info|
|`DimGeography`|A dimention table containing customer-geography-related info|
|`DimProduct`|A dimention table containing product-related info|
|`DimProductCategory`|A dimention table containing product-category-related info|
|`DimProductSubcategory`|A dimention table containing product-subcategory-related info|
|`FactInternetSales`|A fact table containing sales-related information|

***Table-3 : Database Tables***
#### Data Preparation
We are going to import data directly from the database into powerBI. For this we could execute `SELECT` statement joining all the relevant tables from powerBI directly. However, instead, to make it more cleaner we'll create database `VIEWS` that'd encapsulate the required of SQL, and finally we just need to execute simple `SELECT * from <view>` statement from PowerBI. This approach has following advantages...
* Makes PowerBI side of data import simpler
* We do not need to build, manage and schedule any extract (CSV or XLS files) to pull latest data from database and provide it to PowerBI report, since we are directly pulling data from the database whenever PowerBI report is refreshed it'll get the latest data.
* We are decoupling the data selection logic from PowerBI. In case selection logic changes we just need to modify the underlying database view, no changes needed in PowerBI as long as the selected columns remains same.

##### 1. View: vw_date 
```SQL
-- Dimention: Date - All date related attributes are encapsulated by this view
DROP
	VIEW IF EXISTS vw_date
GO

CREATE 
	VIEW vw_date AS
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
```
##### 2. View: vw_customer 
```SQL
-- Dimention: Customer - All customer related attributes are encapsulated by this view
DROP 
	VIEW IF EXISTS vw_customer 
GO 

CREATE 
	VIEW vw_customer AS 
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
```

##### 3. View: vw_product
```SQL
-- Dimention: Product - All product related attributes are encapsulated by this view 
DROP 
	VIEW IF EXISTS vw_product 
GO
 
CREATE 
	VIEW vw_product AS 
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
```
##### 4. View: vw_internet_sales
```SQL
-- Fact: FactInternetSales - All internet sales details for year 2016 & 2017 are encapsulated by this view
DROP 
	VIEW IF EXISTS vw_internet_sales 
GO 

CREATE 
	VIEW vw_internet_sales AS 
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
WHERE 
	LEFT([OrderDateKey], 4) IN (2017, 2016)
GO
```
The SQL used for creating the required views are in the `sales-analysis.sql` file in tyhis repo.
	
***NOTE:*** 
* *Above approach of creating views for complex queries is elegent but its feasible only if person/team building the report has permission and required database previleges to create SQL views. If organisation does not permit view creation then the next best approach would be moving the SELECT queries used for each view to PowerBI.*
* *Its also possible that organisation may not allow BI tools to directing connect with their dataware-house, in this situation a data-pipeline needs to be build for periodically (atleast daily once) extracting required data in CSV/XLS/TXT format and placing the data-files at a location configured for PowerBI to pickup.*

### Data Cleaning and Transform [PowerQuery Editor]
1. We import the  `vw_customer` , `vw_product`, `vw_date` and `vw_internet_sales` as `Dim_Customer`, `Dim_Product`, `Dim_Date` and `Fact_Internet_Sales` query from SQL Server database (one example is shown below)...

 <img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/import-sql.png?raw=true"/>
 
2. We import the `budget` data from provided XLS file as `Fact_Budget` query.

The imported data is relatively clean and well organized; hence not much work was required in this step; the following steps were carried out...
* Correct column heading provided
* Correct data type is assigned to columns

### Data Model Creation [PowerBI Desktop]
the data-model is based on the four SQL views (three dimentions and one fact) we imported from the database and budget table we imported from XLS file. Import views and budget tables are not implicitly related hence PowerBI is not able to correctly establish the relationship between them, this needs to be done manually in PowerBI Desktop data-model. Once done they are linked together by logical relationship to form a `star schema.` The resultant data model is shown below...

<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/data-model.png?raw=true"/>

**NOTE:**  *The prefix `DIM` denotes dimension table, and `FACT` the fact table.*

### Report Creation [PowerBI Desktop]
Three interactive reports (report pages) will be created Refer [Table-2: Proposed Solution](#solution-approach) for detail requirements to solution mapping.

#### 1. Executive Summary Report [AW-DA01-SOL-3]
This is a high-level report that shows the overall sales figures, top customers, top products and sales Vs, budget KPI at a glance.

<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/exec-summary-page.png?raw=true"/>

#### 2. Customer Analysis Report [AW-DA01-SOL-2]  
This is a more granular detailed report that analyses the sales data from the company's customers' perspective.
 
 <img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/cust-analysis-page.png?raw=true"/>
 
#### 3. Product Analysis Report [AW-DA01-SOL-3]  
This is another detailed report that analyses the sales data from the company's products' perspective.
 
 <img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/prod-analysis-page.png?raw=true"/>

## How To Use
<<TODO: Describe online access and then explain how to use backup database>>
### Read-only access via the web (Recommended)
[Open and view the report](https://app.powerbi.com/view?r=eyJrIjoiN2RkNGNjOTMtYmMxOC00NzY3LTg0OGEtMmY4YThlNWM5ZmMyIiwidCI6ImFlZDI3MWNkLTYzOTgtNDllZi1hOWNmLTQ4NDIyMTAxZTE0ZSIsImMiOjEwfQ%3D%3D&pageName=ReportSection) . It's a fully functional interactive report; feel free to experiment with it. 

### Full access via PowerBI desktop
If you have PowerBI desktop installed, download the `sales-analysis.pbix` from the repo and open it using PowerBI desktop. There is no need to download the raw dataset; the `pbix` files contain the complete normalized data model. Feel free to explore and modify. 

If you wish to re-create the complete AdventureWorks datawarehouse-database (AdventureWorksDW2019) and make changes to source data and then in PowerBI dashborad then follow below steps...
* Download and Install free [Microsoft SQL Server Express](https://www.microsoft.com/en-us/download/details.aspx?id=101064) and [Microsoft SQL Server Studio](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16#download-ssms)
* Download the AdventureWorksDW2019 database backup using the link provided in [Dataset](#dataset) section
* Unzip the downloaded file (AdventureWorksDW2019.zip) and restore the backup (AdventureWorksDW2019.bak file), just follow the instructions listed [here](https://learn.microsoft.com/en-us/sql/relational-databases/backup-restore/restore-a-database-backup-using-ssms?view=sql-server-ver16#a-restore-a-full-database-backup) 
* Once dataset is re-stored you should be able to see the 4 SQL views under "views" folder. `sales-analysis.sql` file provided under this repo contains the source code for the views. You can open the .sql file in SQL Server Studio and run it. It drops and re-creates the view hence .sql scrip can be modified and run multiple times without any issues.
* Now you can open the `sales-analysis.pbix` and click refresh, it'll ask for your SQL server credentials. Once connected reports will fetch live data directly from SQL Server in real time. Enjoy!
  

## License
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## Get in touch
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/sssingh)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/_sssingh)
[![website](https://img.shields.io/badge/website-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://datamatrix-ml.com/)

## Credits
- AdventureWorks dataset sourced from [Microsoft AdventureWorks sample databases](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)

[Back To The Top](#pharmaceutical-sales-analysis)
