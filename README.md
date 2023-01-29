# SQL and Power BI project on Sales for a hypothetical Computer Hardware Company
This project explores the revenue over different years in different markets and also the decrease in revenue between 2019 and 2020. 
The repository contains a Power BI report, a SQL script, and initial exploratory data analysis results using the SQL script. 


## Extract Transform Load (ETL) in Power BI using Power Query Editor
1.	Connected to SQL server 
2.	Created relationships between tables using Power BI’s data modelling
3.	Cleaned data\
a)	Sales amount <= 0 in the transaction table, filtered these rows\
b)	INR and USD have extra characters (hidden), cleaned\
c)	Normalized currency to CAD from INR and USD
4.	Applied all transformations and loaded. 

## Measures created using DAX 
1. Total Revenue from 2017-2020: revenue = SUM(transactions[normalized_amount_cad])
2. Total sales quantity from 2017-2020: sales_qty = SUM(transactions[sales_qty])

