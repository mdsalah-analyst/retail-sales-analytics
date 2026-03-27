-- ============================================
-- RETAIL SALES ANALYTICS PROJECT - WEEK 2
-- ============================================

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS retail_analytics;
USE retail_analytics;

-- 2. CREATE TABLE
CREATE TABLE IF NOT EXISTS retail_sales (
    Transaction_ID INT,
    Date DATE,
    Customer_ID INT,
    Gender VARCHAR(10),
    Age INT,
    Product_Category VARCHAR(50),
    Quantity INT,
    Price_per_Unit DECIMAL(10,2),
    Total_Amount DECIMAL(10,2)
);

-- ============================================
-- 3. VERIFY DATA
-- ============================================
SELECT COUNT(*) AS Total_Rows FROM retail_sales;

-- ============================================
-- 4. CORE SALES METRICS
-- ============================================

-- Total Revenue
SELECT SUM(Total_Amount) AS Total_Revenue
FROM retail_sales;

-- Average Order Value
SELECT AVG(Total_Amount) AS Average_Order_Value
FROM retail_sales;

-- Total Transactions
SELECT COUNT(*) AS Total_Transactions
FROM retail_sales;

-- Overall Sales Summary
SELECT
    COUNT(*) AS Total_Orders,
    SUM(Total_Amount) AS Total_Revenue,
    AVG(Total_Amount) AS Avg_Order_Value,
    MIN(Total_Amount) AS Min_Order,
    MAX(Total_Amount) AS Max_Order
FROM retail_sales;

-- ============================================
-- 5. PRODUCT ANALYSIS
-- ============================================

-- Best Selling Products by Quantity
SELECT
    Product_Category,
    SUM(Quantity) AS Total_Quantity_Sold
FROM retail_sales
GROUP BY Product_Category
ORDER BY Total_Quantity_Sold DESC;

-- Revenue by Product Category
SELECT
    Product_Category,
    SUM(Total_Amount) AS Category_Revenue
FROM retail_sales
GROUP BY Product_Category
ORDER BY Category_Revenue DESC;

-- ============================================
-- 6. TIME-BASED ANALYSIS
-- ============================================

-- Monthly Revenue Trend
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(Total_Amount) AS Monthly_Revenue
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- Best Performing Month
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(Total_Amount) AS Revenue
FROM retail_sales
GROUP BY Month
ORDER BY Revenue DESC
LIMIT 1;

-- ============================================
-- 7. CUSTOMER ANALYSIS
-- ============================================

-- Revenue by Gender
SELECT
    Gender,
    SUM(Total_Amount) AS Revenue
FROM retail_sales
GROUP BY Gender;

-- Average Age per Product Category
SELECT
    Product_Category,
    AVG(Age) AS Avg_Customer_Age
FROM retail_sales
GROUP BY Product_Category;

-- ============================================
-- 8. TRANSACTION-LEVEL ANALYSIS
-- ============================================

-- Top 5 Highest Revenue Transactions
SELECT *
FROM retail_sales
ORDER BY Total_Amount DESC
LIMIT 5;

-- ============================================
-- 9. DATA RANGE CHECK
-- ============================================

SELECT
    MIN(Date) AS First_Transaction,
    MAX(Date) AS Last_Transaction
FROM retail_sales;