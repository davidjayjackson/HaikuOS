CREATE TABLE superstore (
    "Row ID" INTEGER,
    "Order ID" TEXT,
    "Order Date" TEXT,
    "Ship Date" TEXT,
    "Ship Mode" TEXT,
    "Customer ID" TEXT,
    "Customer Name" TEXT,
    "Segment" TEXT,
    "Country" TEXT,
    "City" TEXT,
    "State" TEXT,
    "Postal Code" INTEGER,
    "Region" TEXT,
    "Product ID" TEXT,
    "Category" TEXT,
    "Sub-Category" TEXT,
    "Product Name" TEXT,
    "Sales" REAL
);
.mode csv
.import ./supterstore.csv superstore
PRAGMA table_info(superstore);
.mode column
.headers on
DELETE FROM Superstore WHERE "Country = 'Country';
# Export table as csv.
.mode csv
.output supersqlite.csv
SELECT * FROM Superstore;




