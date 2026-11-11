--Total Records
--SELECT COUNT(*) AS total_records
--FROM retail_sales_dataset;

--Unique Customers
--SELECT COUNT(DISTINCT customer_id) AS
--unique_customers
--FROM retail_sales_dataset; 

--Unique Products
--SELECT COUNT(DISTINCT product_id) AS
--unique_products
--FROM retail_sales_dataset; 

--Missing values check
--SELECT *
--FROM retail_sales_dataset
--WHERE customer_id IS NULL
--OR product_id IS NULL
--OR sales_amount IS NULL; 

--Duplicate Transactions
--SELECT transaction_id, COUNT(*)
--FROM retail_sales_dataset
--GROUP BY transaction_id
--HAVING COUNT(*) > 1; 

--Negative Sales Check
--SELECT *
--FROM retail_sales_dataset
--WHERE sales_amount < 0; 

--Invalid Quantity Check
--SELECT *
--FROM retail_sales_dataset
--WHERE quantity <= 0; 

--OVERALL BUSINESS PERFORMANCE
--Total Revenue
--SELECT ROUND(SUM(sales_amount),2) AS
--total_revenue
--FROM retail_sales_dataset; 

--Total Transactions 
--SELECT COUNT(*) AS total_transactions
--FROM retail_sales_dataset; 

--Average Order Value
--SELECT ROUND(AVG(sales_amount),2) AS 
--avg_order_value
--FROM retail_sales_dataset; 

--Total Quantity Sold
--SELECT SUM(quantity) AS
--total_units_sold
--FROM retail_sales_dataset; 

--PRODUCT ANALYSIS
--Revenue By Category
--SELECT category,
--ROUND(SUM(sales_amount),2)revenue
--FROM retail_sales_dataset
--GROUP BY category
--ORDER BY revenue DESC;

--Units Sold By Category
--SELECT category,
--SUM(quantity) units_sold
--FROM retail_sales_dataset
--GROUP BY category
--ORDER BY units_sold DESC;

--Revenue By Brand
--SELECT brand,
--ROUND(SUM(sales_amount),2)revenue
--FROM retail_sales_dataset
--GROUP BY brand
--ORDER BY revenue DESC;

--Top 10 Products
--SELECT *
--FROM (
--    SELECT product_name,
--     ROUND(SUM(sales_amount),2)
--revenue
--     FROM retail_sales_dataset
--     GROUP BY product_name
--     ORDER BY revenue DESC
--     )
--     WHERE ROWNUM <= 10;

--Bottom 10 Products
--SELECT *
--FROM (
--    SELECT product_name,
--     ROUND(SUM(sales_amount),2)
--revenue
--     FROM retail_sales_dataset
--     GROUP BY product_name
--     ORDER BY revenue ASC
--     )
--     WHERE ROWNUM <= 10;

--Most Sold Products
--SELECT * 
--FROM(
--    SELECT product_name,
--     SUM(quantity)
--units_sold
--     FROM retail_sales_dataset
--     GROUP BY product_name
--     ORDER BY units_sold DESC
--     )
--     WHERE ROWNUM <= 10;

--CUSTOMER ANALYSIS
--Revenue by Customer Segment

--SELECT customer_segment,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY customer_segment
--ORDER BY revenue DESC;

--Transactions By Customer_segment
--SELECT customer_segment,
--COUNT(*) transactions
--FROM retail_sales_dataset
--GROUP BY customer_segment;

--Revenue By Gender
--SELECT customer_gender,
--ROUND(SUM(sales_amount),2)revenue
--FROM retail_sales_dataset
--GROUP BY customer_gender;

--Revenue By Age Group
--SELECT customer_age_group,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY customer_age_group
--ORDER BY revenue DESC;

--Average Spend By Age Group
--SELECT customer_age_group,
--ROUND(AVG(sales_amount),2) avg_spend
--FROM retail_sales_dataset
--GROUP BY customer_age_group
--ORDER BY avg_spend DESC;

--REGIONAL ANALYSIS
--Revenue By Region
--SELECT region,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY region
--ORDER BY revenue DESC;

--Transactions by region
--SELECT region,
--COUNT(*) transactions
--FROM retail_sales_dataset
--GROUP BY region
--ORDER BY transactions DESC;

--Average Revenue Per Transactions by Region
--SELECT region,
--ROUND(AVG(sales_amount),2)
--avg_revenue
--FROM retail_sales_dataset
--GROUP BY region
--ORDER BY avg_revenue DESC;

--SALES CHANNEL ANALYSIS
--Revenue by sales channel
--SELECT sales_channel,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY sales_channel
--ORDER BY revenue DESC;

--Transactions By Channel
--SELECT sales_channel,
--COUNT(*) transactions
--FROM retail_sales_dataset
--GROUP BY sales_channel;

--Average Order Value By Channel
--SELECT sales_channel,
--ROUND(AVG(sales_amount),2)
--avg_order_value
--FROM retail_sales_dataset
--GROUP BY sales_channel
--ORDER BY avg_order_value DESC;

--PAYMENT ANALYSIS
--Payment Method Popularity
--SELECT payment_method,
--COUNT(*) transactions
--FROM retail_sales_dataset
--GROUP BY payment_method
--ORDER BY transactions DESC;

--Revenue by Payment Method
--SELECT payment_method,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY payment_method
--ORDER BY revenue DESC;

--DISCOUNT ANALYSIS
--Revenue by Discount
--SELECT discount_pct,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY discount_pct
--ORDER BY discount_pct;

--Average Sales by Discount%
--SELECT discount_pct,
--ROUND(AVG(sales_amount),2) avg_sales
--FROM retail_sales_dataset
--GROUP BY discount_pct
--ORDER BY discount_pct;

--TIME ANALYSIS
--Monthly Revenue Trend
--SELECT
--EXTRACT(YEAR FROM
--transaction_date) AS year,
--EXTRACT(MONTH FROM 
--transaction_date) as month,
--ROUND(SUM(sales_amount),2) AS
--revenue
--FROM retail_sales_dataset
--GROUP BY
--EXTRACT(YEAR FROM
--transaction_date),
--EXTRACT(MONTH FROM
--transaction_date)
--ORDER BY 1,2;

--Monthly Transactions
--SELECT
--EXTRACT(YEAR FROM 
--transaction_date) AS year,
--EXTRACT(MONTH FROM
--transaction_date) AS month,
--COUNT(*) AS transactions
--FROM retail_sales_dataset
--GROUP BY
--EXTRACT(YEAR FROM
--transaction_date),
--EXTRACT(MONTH FROM
--transaction_date)
--ORDER BY 1,2;

--Best Sales Month
--SELECT
--EXTRACT(MONTH FROM
--transaction_date) AS month,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY 
--EXTRACT(MONTH FROM
--transaction_date)
--ORDER BY revenue DESC;

--ADVANCED RECRUITER FRIENDLY QUERIES
--Top Category In each region
--SELECT region,
--category,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY region, category
--ORDER BY region, revenue DESC;

--VIP Revenue Contribution
--SELECT
--ROUND(SUM(CASE WHEN customer_segment = 'VIP'
--THEN sales_amount ELSE 0 END)
--*100/SUM(sales_amount),2) AS vip_contribution_pct
--FROM retail_sales_dataset;

--Customer Segment VS ChanneL
--SELECT customer_segment,sales_channel,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY customer_segment, sales_channel;

--Category VS ChanneL
--SELECT category, sales_channel,
--ROUND(SUM(sales_amount),2) revenue
--FROM retail_sales_dataset
--GROUP BY category, sales_channel;

--EXTRA QUER USING WINDOW FUNCTIONS
--Top 5 Products in Each Category
--SELECT category, product_name, revenue
--FROM( SELECT category, product_name,SUM(sales_amount) AS revenue,
--ROW_NUMBER() OVER (
--PARTITION BY category
--ORDER BY SUM(sales_amount) DESC) AS rn
--FROM retail_sales_dataset
--GROUP BY category,product_name) t
--WHERE rn <= 5
--ORDER BY category, revenue DESC;

--Top 3 Customers by revenue
--SELECT *
--FROM( SELECT customer_id, SUM(sales_amount) AS revenue
--FROM retail_sales_dataset
--GROUP BY customer_id
--ORDER BY revenue DESC
--     )
--     WHERE ROWNUM <= 3;

--Revenue Share By Category
--SELECT category, ROUND(SUM(sales_amount)*100.0 / SUM(SUM(sales_amount))
--OVER ( ),2) AS revenue_share_pct
--FROM retail_sales_dataset
--GROUP BY category
--ORDER BY revenue_share_pct DESC; 

--Revenue Share By Region
--SELECT region,ROUND(SUM(sales_amount)*100/ SUM(SUM(sales_amount))
--OVER(),2) revenue_share_pct
--FROM retail_sales_dataset
--GROUP BY region
--ORDER BY revenue_share_pct DESC;

--Repeat Customers
--SELECT customer_id, COUNT(*) purchases
--FROM retail_sales_dataset
--GROUP BY customer_id
--HAVING COUNT(*) > 1
--ORDER BY purchases DESC;

--Cuctomer Count by Gender
--SELECT customer_segment,
--COUNT(DISTINCT customer_id)customers
--FROM retail_sales_dataset
--GROUP BY customer_segment
--ORDER BY customers DESC;

--Monthly Revenue Trend
SELECT EXTRACT(YEAR FROM transaction_date) AS year,
       EXTRACT(MONTH FROM transaction_date) AS month,
       ROUND(SUM(sales_amount),2) AS revenue
FROM retail_sales_dataset
GROUP BY EXTRACT(YEAR FROM transaction_date),
         EXTRACT(MONTH FROM transaction_date)
ORDER BY year, month;



