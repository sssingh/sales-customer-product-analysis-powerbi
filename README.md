[![Open In Power Bi](https://img.shields.io/badge/open_in_power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://app.powerbi.com/view?r=eyJrIjoiNDE5NDEyMWUtY2NiMi00MzRiLTljZmYtYmZlNWQzOTBkMDgzIiwidCI6ImFlZDI3MWNkLTYzOTgtNDllZi1hOWNmLTQ4NDIyMTAxZTE0ZSIsImMiOjEwfQ%3D%3D)

# Sales/Customer/Product Analysis
In this ‘Data Analysis’ project, we’ll analyze `AdventureWorks`, an online retailer's raw sales data, and draw meaningful insights.

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

* `AdventureWorks` is an online retailer that sells `Bikes` and `Biking related` items such as bike parts, biking protective gear, articles of clothing, etc. 
* Online sales transactions, inventory, financials, customer and product information are captured in real-time in a `transaction database`.
* At the End of the day after the closing of business, data from the transaction database is extracted, formatted, and then exported to a `data warehouse database.` 

## Objectives
We have been asked by AdventureWorks to perform the in-depth data analysis for the years `2016 and 2017` and draw insight into company sales performance, customers, and products so that they can build a strategy around it to generate more revenue and higher profits. Specific business requirements/questions are…

|Requirement ID|For Whom|Requirement Description|
|:--|:---|:--|
AW-DA01-REQ-1|Head of Sales|An high-level overview of internet sales by various dimensions such as `customers,` `products,` `customer-cities,` `quarter`
AW-DA01-REQ-2|Head of Sales|Follow/track `sales performance over time against the `budget/target`
AW-DA01-REQ-3|Head of Sales|Ability to dynamically slice/dice/filter data for `year,` `month,` `product-attributes`
AW-DA01-REQ-4|Sales Rep|A detailed overview of sales by `customers`
AW-DA01-REQ-5|Sales Rep|A detailed overview of sales by `products`
AW-DA01-REQ-6|Sales Rep|Ability to dynamically slice/dice/filter and analyze data by `year,` `month,` `product-attributes,` `customer-attributes`

***Table-1 : Requirements***

## Dataset
AdventureWorks makes data available strictly through its `datawarehouse-database` for any data analysis. The real-time transaction database is not directly accessible.
### AdventureWorks Datawarehouse
data warehouse-database schema is shown below... <br>
<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/DW%20Schema.png?raw=true" width="400" height="600" />

The complete datawarehouse-database in the form of Microsoft SQL Server  `database-backup`  can be downloaded from [here](https://drive.google.com/file/d/1azhAQjbAV7pgh_A0CSKAErneHr5L4zUu/view?usp=sharing), *refer the [How To Use](#how-to-use) section for more details in terms of how to restore the downloaded backup to re-create the database*.

### Budget Data
AdventureWorks allocates a monthly budget for sales. The company sets a monthly target against which sales performance for a given month is expected to be measured as a key KPI for success. The budget/target is decided and fixed yearly in advance. Note that the budget is decided by the company's top management once a year, and it's not a part datawarehouse-database. AdventureWorks have made the budget available in the form of an XLS file; a snapshot of the 2016/2017 budget is shown below... <br>
<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/budget.png?raw=true" width="400" height="600" />

## Solution Approach
  
|Requirement ID|Solution ID|Proposed Solution|
|:--|:---|:--|
AW-DA01-REQ-1 <br> AW-DA01-REQ-2 <br> AW-DA01-REQ-3|AW-DA01-SOL-1|An `Executive Summary` PowerBI dashboard/report page will be built to show a high-level overview of sales data. The report will contain visuals showing data as per requirements AW-DA01-REQ-1 & AW-DA01-REQ-2. <br> As per requirements AW-DA01-REQ-3, Year, month `slicers` and required `filters` will be made accessible to the user so that they can filter/slice the dashboard data dynamically as per their wishes
AW-DA01-REQ-4 <br> AW-DA01-REQ-6|AW-DA01-SOL-2|A `Customer Analysis` PowerBI dashboard/report page will be built to show sales data segmented by various `customer` attributes (e.g., top customers, sales by customer gender, sales by customer's marital status, etc.). It'll contain visuals showing data as per requirements AW-DA01-REQ-4. <br> As per requirements AW-DA01-REQ-6, Year, month `slicers` and required `filters` will be made accessible to the user so that they can filter/slice the dashboard data dynamically as per their wishes
AW-DA01-REQ-5 <br> AW-DA01-REQ-6|AW-DA01-SOL-3|` Product Analysis` PowerBI dashboard/report page will be built to show sales data segmented by various `product` attributes (e.g., top customers, sales by customer gender, sales by customer's marital status, etc.). It'll contain visuals showing data as per requirements AW-DA01-REQ-5. <br> As per requirements AW-DA01-REQ-6, Year, month `slicers` and required `filters` will be made accessible to users so that they can filter/slice the dashboard data dynamically as per their wishes

***Table-2 : Proposed Solution***

### Exploratory Data Analysis (EDA)  and Data Preparation [SQL]
To understand, be familiar with and check the sanity of the given data, the first step is EDA. In this project, the initial data exploration has been carried out using `SQL.` Here, in general, we are...
#### EDA
Here we explore the datawarehouse-database to identify the `dimension` and `fact` tables we'd need as our data source. We further explore the identified tables to understand their structure and their data. Based on the requirements, we identified the tables below as our primary data source...
|Table|Description|
|:--|:--| 
|`DimDate`|A dimension table containing date-related info
|`DimCustomer`|A dimension table containing customer-related info
|`DimGeography`|A dimension table containing customer-geography-related info
|`DimProduct`|A dimension table containing product-related info
|`DimProductCategory`|A dimension table containing product-category-related info
|`DimProductSubcategory`|A dimension table containing product-subcategory-related info
|`FactInternetSales`|A fact table containing sales-related information

***Table-3 : Database Tables***
#### Data Preparation
We are going to import data directly from the database into PowerBI. For this, we could directly execute the `SELECT` statement joining all the relevant tables from PowerBI. However, to make it cleaner, we'll create database `VIEWS` that'd encapsulate the required SQL, and finally, we need to execute a simple `SELECT * from <view>` statement from PowerBI. This approach has the following advantages...
* Makes PowerBI side of data import simpler
* We do not need to build, manage and schedule any extract (CSV or XLS files) to pull the latest data from the database and provide it to the PowerBI report since we are directly removing data from the database whenever the PowerBI report is refreshed it'll get the latest data.
* We are decoupling the data selection logic from PowerBI. If the selection logic changes, we need to modify the underlying database view; no changes are required in PowerBI as long as the selected columns remain the same.

##### 1. View: vw_date 
```SQL
-- Dimension: Date - All date-related attributes are encapsulated by this view
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
-- Dimension: Customer - All customer-related attributes are encapsulated by this view
DROP 
	VIEW IF EXISTS vw_customer 
GO 

CREATE 
	VIEW vw_customer AS 
SELECT 
	[CustomerKey], 
	CONCAT([FirstName], ', '[LastName]) AS [Full Name], 
	CASE [MaritalStatus] WHEN 'M' THEN 'Married' WHEN 'S' THEN 'Single' END AS [Marital status], 
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
-- Dimension: Product - All product-related attributes are encapsulated by this view 
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
-- Fact: FactInternetSales - All internet sales details for the years 2016 & 2017 are encapsulated by this view
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
The SQL used for creating the required views is in this repo's `sales-analysis.sql` file.
	
***NOTE:*** 
* *Above approach of creating views for complex queries is elegant. Still, it's feasible only if the person/team building the report has permission and the required database privileges to create SQL views. If the organization does not permit SQL view creation, the next best approach would be moving the SELECT queries for each view to PowerBI.*
* *It's also possible that the organization may not allow BI tools to connect with their dataware-house directly; in this situation, a data pipeline needs to be built for periodically (at least daily once) extracting required data in CSV/XLS/TXT format and placing the data-files at a location configured for PowerBI to pickup.*

### Data Cleaning and Transform [PowerQuery Editor]
1. We import the  `vw_customer,` `vw_product,` `vw_date` and `vw_internet_sales` as `Dim_Customer,` `Dim_Product,` `Dim_Date` and `Fact_Internet_Sales` query from SQL Server database (one example is shown below)...

 <img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/import-sql.png?raw=true"/>
 
2. We import the `budget` data from provided XLS file as a `Fact_Budget` query.

The imported data is relatively clean and well organized; hence only a little work was required in this step; the following steps were carried out...
* Correct column heading provided
* Correct data type is assigned to columns

### Data Model Creation [PowerBI Desktop]
the data model is based on the four SQL views (three dimensions and one fact) we imported from the database and the budget table we imported from the XLS file. Imported views and budget tables are not implicitly related; hence, PowerBI cannot correctly establish the relationship between them; this needs to be done manually in the PowerBI Desktop data model. Once done, they are linked together by logical relationship to form a `star schema.` The resultant data model is shown below...

<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/data-model.png?raw=true"/>

**NOTE:**  *The prefix `DIM` denotes the dimension table, and `FACT` is the fact table.*

### Report Creation [PowerBI Desktop]
Three interactive reports/dashboard (report pages) will be created to implement the proposed solution. Refer to [Table-2: Proposed Solution](#solution-approach) for detailed requirements and corresponding proposed solution. 

#### 1. Executive Summary Report [AW-DA01-SOL-1]
This high-level report shows the overall sales figures, top customers, top products, and Sales Vs. Budget KPI at a glance.

<img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/exec-summary-page.png?raw=true"/>

#### 2. Customer Analysis Report [AW-DA01-SOL-2]  
This more granular detailed report analyses the sales data from the company's customers' perspective.
 
 <img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/cust-analysis-page.png?raw=true"/>
 
#### 3. Product Analysis Report [AW-DA01-SOL-3]  
This detailed report analyses the sales data from the company's products perspective.
 
 <img src="https://github.com/sssingh/sales-customer-product-analysis-powerbi/blob/main/images/prod-analysis-page.png?raw=true"/>

## How To Use
### Read-only access via the web (Recommended)
[![Open In Power Bi](https://img.shields.io/badge/open_in_power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://app.powerbi.com/view?r=eyJrIjoiNDE5NDEyMWUtY2NiMi00MzRiLTljZmYtYmZlNWQzOTBkMDgzIiwidCI6ImFlZDI3MWNkLTYzOTgtNDllZi1hOWNmLTQ4NDIyMTAxZTE0ZSIsImMiOjEwfQ%3D%3D)  
Explore the fully functional report with native PowerBI interactive experience. 

### Full access via PowerBI desktop
If you have PowerBI desktop installed, download the `sales-analysis.pbix` from the repo and open it using PowerBI desktop. There is no need to download the raw dataset; the `pbix` files contain the complete normalized data model. Feel free to explore and modify. 

If you wish to re-create the complete AdventureWorks datawarehouse-database (AdventureWorksDW2019) and make changes to source data in the PowerBI dashboard, follow the below steps...
* Download and Install free [Microsoft SQL Server Express](https://www.microsoft.com/en-us/download/details.aspx?id=101064) and [Microsoft SQL Server Studio](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16#download-ssms)
* Download the AdventureWorksDW2019 database backup using the link provided in [Dataset](#dataset) section
* Unzip the downloaded file (AdventureWorksDW2019.zip) and restore the backup (AdventureWorksDW2019.bak file), just follow the instructions listed [here](https://learn.microsoft.com/en-us/sql/relational-databases/backup-restore/restore-a-database-backup-using-ssms?view=sql-server-ver16#a-restore-a-full-database-backup) 
* Once the database is restored, you should see the 4 SQL views under the "views" folder in SQL Server Management Studio. The `sales-analysis.sql` file provided under this repo contains the source code for the views. You can open the .sql file in SQL Server Studio and run it. It drops and re-creates the idea; hence .sql script can be modified and run multiple times without any issues.
* Now you can open the `sales-analysis.pbix` and click refresh; it'll ask for your SQL server credentials. Once connected, reports will fetch live data directly from SQL Server in real-time. Enjoy!
  

## License
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

# Get in touch
[![email](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:sunil@sunilssingh.me)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/@thesssingh)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sssingh/)
[![website](https://img.shields.io/badge/web_site-8B5BE8?style=for-the-badge&logo=ko-fi&logoColor=white)](https://sunilssingh.me)

## Credits
- AdventureWorks dataset sourced from [Microsoft AdventureWorks sample databases](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)

[Back To The Top](#pharmaceutical-sales-analysis)
