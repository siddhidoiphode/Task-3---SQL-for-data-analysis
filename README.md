# Task-3---SQL-for-data-analysis

✅ Task 3 – SQL for Data Analysis (MySQL)
Dataset: Cleaned eCommerce Sales CSV

🔹 1. Setup
Created ecommerce DB and sales_data table
Columns: year, month, category, region, units_sold, revenue, profit, customer_rating, ad_spend

🔹 2. Import
Enabled local_infile
Loaded CSV via LOAD DATA LOCAL INFILE
Verified with SELECT * LIMIT

🔹 3. Queries
Used SELECT, WHERE, ORDER BY, LIMIT
Aggregates: SUM, AVG, MAX, MIN, COUNT
GROUP BY + HAVING
Subqueries for avg revenue, top profits
JOINs with region_info table (INNER, LEFT, RIGHT)

🔹 4. Views
Created views: region_revenue, category_performance, high_revenue_sales

🔹 5. Optimization

Indexed: region, category, year, revenue
Checked with SHOW INDEXES, EXPLAIN
