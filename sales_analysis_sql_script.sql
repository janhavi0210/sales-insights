-- To check if there are any other transactions in a currency other than INR 
SELECT COUNT(*) FROM sales.transactions WHERE sales.transactions.currency='USD';

 -- Total sales in 2020
 SELECT SUM(sales.transactions.sales_amount)
 FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date
 WHERE sales.date.year=2020;
 
 -- Total sales in 2019
 SELECT SUM(sales.transactions.sales_amount)
 FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date
 WHERE sales.date.year=2019;
 
 -- Sales by Markets in 2020
 SELECT SUM(sales.transactions.sales_amount), sales.markets.markets_name
 FROM sales.transactions INNER JOIN sales.markets ON sales.transactions.market_code = sales.markets.markets_code 
 INNER JOIN sales.date ON sales.transactions.date = sales.date.date
 WHERE sales.date.year=2020
 GROUP BY sales.markets.markets_name; 
 
 -- Sales by Markets in 2019
 SELECT SUM(sales.transactions.sales_amount), sales.markets.markets_name
 FROM sales.transactions INNER JOIN sales.markets ON sales.transactions.market_code = sales.markets.markets_code 
 INNER JOIN sales.date ON sales.transactions.date = sales.date.date
 WHERE sales.date.year=2019
 GROUP BY sales.markets.markets_name; 
 
 -- Revenue difference for each market between 2020 and 2019
 WITH sales_2020 AS (SELECT SUM(sales.transactions.sales_amount) AS revenue_2020, sales.markets.markets_name
 FROM sales.transactions INNER JOIN sales.markets ON sales.transactions.market_code = sales.markets.markets_code 
 INNER JOIN sales.date ON sales.transactions.date = sales.date.date
 WHERE sales.date.year=2020
 GROUP BY sales.markets.markets_name),
 sales_2019 AS (SELECT SUM(sales.transactions.sales_amount) AS revenue_2019, sales.markets.markets_name
 FROM sales.transactions INNER JOIN sales.markets ON sales.transactions.market_code = sales.markets.markets_code 
 INNER JOIN sales.date ON sales.transactions.date = sales.date.date
 WHERE sales.date.year=2019
 GROUP BY sales.markets.markets_name)
 SELECT sales_2019.markets_name, sales_2020.revenue_2020 - sales_2019.revenue_2019 AS revenue_difference 
 FROM sales_2020 INNER JOIN sales_2019 ON sales_2020.markets_name=sales_2019.markets_name
 ORDER BY revenue_difference DESC;

