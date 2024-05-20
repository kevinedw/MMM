# MMM
Marketing Mixed Modeling

## Overview
The objective was to view the effects of each marketing channel on sales and the affect of all on each other. For instance, with radio a non-digital and difficult channel to access, how is it affecting all the other channels, and is it affecting sales?

<img src="https://github.com/wylee3/MMM/blob/main/RobynData-to-visuals_Page_2-cl.jpg" width="500" />
<img src="https://github.com/wylee3/MMM/blob/main/RobynData-to-visuals_Page_3-spend.jpg" width="500" />
<img src="https://github.com/wylee3/MMM/blob/main/RobynData-to-visuals_Page_3-spendPerc.jpg" width="500" />


## Code Used:
* Robyn 3.10
* Python: python 3.11.8
* Packages: numpy, pandas, seaborn, matplotlib, sklearn, os
* SQL Server
* Anaconda 2.6.0

## Data Sources
* Saleforce
* Google Analytics
* Facebook Ads Manager
* Sprout Social
* Radio and TV estimates
* Youtube

*Data privacy through one or many of the following steps applied to original data: random functions, deletion/addition, other math functions*

## Data Cleaning
* SQL
* Excel

Data was imported into SQL Server Management Studio where specific columns were taken from multiple tables, and then joined into a master table. 
Exported as a csv file. This master file was initially created for another project but served well for these correlations. To work with this data for 
this project, it was hand-edited in Excel to delete columns for individual channel-only csv files.

[SQL file](https://github.com/wylee3/marketing-linear-regressions/blob/9a1fc2df0952b384e930bc9e68a45cb49eb52003/SQL-CorrelationPrep_v3-portfolio.sql)

## Exploratory Data Analysis (EDA)
This gave insight into the best correlating channel which went against marketing's pre-determined gut feelings.

## Model Building
