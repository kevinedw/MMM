# MMM
Marketing Mixed Modeling

## Overview
The objective was to view the effects of each marketing channel on sales, and on each other. For instance, is radio affecting all the other channels, and is it affecting sales?

<img src="https://github.com/wylee3/MMM/blob/main/channels.jpg" width="500" />
<img src="https://github.com/wylee3/MMM/blob/main/predictEffect.jpg" width="500" />
<img src="https://github.com/wylee3/MMM/blob/main/shareMediaSpend.jpg" width="500" />
<img src="https://github.com/wylee3/MMM/blob/main/shareMediaSpendPercentage.jpg" width="500" />


## Code and Applications Used:
* R / RStudio
* Robyn 3.10
* SQL Server Management Studio
* Anaconda 2.6.0
* Power BI
* Excel

## Data Sources
* Saleforce
* Google Analytics
* Facebook Ads Manager
* Sprout Social
* Radio and TV estimates
* Youtube

*Data privacy through one or many of the following steps applied to original data: random functions, deletion/addition, other math functions, and redaction*

## Data Cleaning
* SQL
* Excel

Roughly 15 csv files were imported into SQL Server where specific columns were taken from multiple tables, daily data was recalculated to weekly, and other cleaning which as then exported as one master table.

[SQL file](https://github.com/wylee3/marketing-linear-regressions/blob/9a1fc2df0952b384e930bc9e68a45cb49eb52003/SQL-CorrelationPrep_v3-portfolio.sql)

## Exploratory Data Analysis (EDA)
For this type of MMM to succeed there needs to be at least two years of regular data for analysis. This will help to get unavoidable level of error lower. With many outputs the best business-fitting one model was chosen, and then it was run for projections. 
This confirmed the believed affect that all marketing channels were having on each other and on sales.

## Model Building

Many csv files were gathered from multiple sources. These files were imported, cleaned, and transformed with Excel and SQL Server. The output data was used as the input to Robyn, which is a R-based program running in RStudio. Robyn was adjusted, and the data was continually massaged until reasonable results began to show up. Once the results started to look promising, final tweaks were made to the code and then predictions were run.
