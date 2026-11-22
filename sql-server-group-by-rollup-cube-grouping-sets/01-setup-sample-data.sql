/* 01-setup-sample-data.sql
   Shows:    the demo table #Sales: 9 sales, 2 regions, 2 products, 2024-2025.
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    0:48

   Run this first. #Sales is a session temp table: run 02-08 in the
   SAME query window. It disappears when you close the session. */

IF OBJECT_ID('tempdb..#Sales') IS NOT NULL DROP TABLE #Sales;

CREATE TABLE #Sales
(
    SaleID   int IDENTITY(1,1) PRIMARY KEY,
    Region   varchar(10)   NOT NULL,
    Product  varchar(10)   NOT NULL,
    SaleDate date          NOT NULL,
    Amount   decimal(10,2) NOT NULL
);

INSERT INTO #Sales (Region, Product, SaleDate, Amount)
VALUES ('East', 'Laptop', '2024-11-05', 1200.00),
       ('East', 'Phone',  '2024-12-10',  800.00),
       ('West', 'Laptop', '2024-12-20',  900.00),
       ('East', 'Laptop', '2025-01-15', 1500.00),
       ('East', 'Laptop', '2025-03-02', 1300.00),
       ('East', 'Phone',  '2025-02-11',  600.00),
       ('West', 'Laptop', '2025-01-20', 1100.00),
       ('West', 'Phone',  '2025-02-03',  700.00),
       ('West', 'Phone',  '2025-04-18',  500.00);
