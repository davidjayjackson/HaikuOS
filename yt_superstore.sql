SELECT count(*) FROM store;

# Begin EDA with ChatGPT
##  Querying the database to identify the top-selling products based on total sales

SELECT "Product Name", round(SUM(Sales),) as TotalSales
FROM store
GROUP BY "Product Name"
ORDER BY TotalSales DESC
LIMIT 10;;
# Top 10 Products by Order Count
SELECT "Product Name", COUNT("OrderID") as NumberOfOrders
FROM store
GROUP BY "Product Name"
ORDER BY NumberOfOrders DESC
LIMIT 10;
# Region with Hightest Sales
SELECT Region, round((SUM(Sales),2) as TotalSales
FROM store
GROUP BY Region
ORDER BY TotalSales DESC
LIMIT 1;
# distribution of customers by segment:
SELECT Segment, COUNT(DISTINCT "CustomerID") as NumberOfCustomers
FROM store
GROUP BY Segment;
# Top sales by Year and Month
SELECT strftime('%Y-%m', OrderDate) as SalesMonth,round(SUM(Sales),2) as TotalSales,
count(*) as OrderCount
FROM store
GROUP BY SalesMonth
ORDER BY OrderCount DESC
LIMIT 10;
# Top Customer
# SQL query to identify the top customer by total sales
SELECT CustomerID, CustomerName, round(SUM(Sales),2) as TotalSales
FROM store
GROUP BY CustomerID, CustomerName
ORDER BY TotalSales DESC
LIMIT 1;


# SQL query to identify the top products by total sales
SELECT "Product Name", round(SUM(Sales),2) as TotalSales
FROM store
GROUP BY "Product Name"
ORDER BY TotalSales DESC
LIMIT 5;

# SQL query to identify the top customer by total sales for each year
WITH SalesPerYear AS (
    SELECT strftime('%Y', OrderDate) as SalesYear, CustomerID, CustomerName, round(SUM(Sales),2) as TotalSales
    FROM store
    GROUP BY SalesYear, CustomerID, CustomerName
)
, RankedCustomers AS (
    SELECT SalesYear, CustomerID, CustomerName, TotalSales,
           RANK() OVER (PARTITION BY SalesYear ORDER BY TotalSales DESC) as rnk
    FROM SalesPerYear
)
SELECT SalesYear, CustomerID, CustomerName, TotalSales
FROM RankedCustomers
WHERE rnk = 1
ORDER BY SalesYear;

# SQL query to identify the top-selling product by total sales for each year

WITH SalesPerYear AS (
    SELECT strftime('%Y', OrderDate) as SalesYear, "Product Name", ROUND(SUM(Sales),2) as TotalSales
    FROM store
    GROUP BY SalesYear, "Product Name"
)
, RankedProducts AS (
    SELECT SalesYear, "Product Name", TotalSales,
           RANK() OVER (PARTITION BY SalesYear ORDER BY TotalSales DESC) as rnk
    FROM SalesPerYear
)
SELECT SalesYear, "Product Name", TotalSales
FROM RankedProducts
WHERE rnk = 1
ORDER BY SalesYear;

# average sales for each product category.
SELECT Category, ROUND(AVG(Sales), 2) as AverageSales
FROM store
GROUP BY Category;
# Count the number of orders placed by each customer.
SELECT CustomerName, COUNT(DISTINCT OrderID) as NumberOfOrders
FROM store
GROUP BY CustomerID, CustomerName
ORDER BY NumberOfOrders DESC
LIMIT 10;

# Calculate the total sales for each month in a specific year, say 2017.
SELECT strftime('%Y-%m', OrderDate) as SalesMonth, ROUND(SUM(Sales), 2) as TotalSales
FROM store
WHERE strftime('%Y', OrderDate) = '2017'
GROUP BY SalesMonth
ORDER BY SalesMonth;

