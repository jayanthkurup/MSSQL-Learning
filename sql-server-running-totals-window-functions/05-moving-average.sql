/* 05-moving-average.sql
   Shows:    a 3-row moving average with AVG() OVER (... ROWS BETWEEN 2 PRECEDING AND CURRENT ROW).
   Requires: SQL Server 2012+ or Azure SQL (ROWS BETWEEN ...).
   Video:    3:00 Moving average: ROWS BETWEEN 2 PRECEDING

   Run 01-setup-sample-data.sql first, in this same query window. */

-- Expected MovingAvg3: 100.00, 125.00, 150.00, 133.33, 123.33, 83.33
SELECT SaleID, SaleDate, Amount,
       CAST(AVG(Amount) OVER (ORDER BY SaleDate, SaleID
                              ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
            AS decimal(10,2)) AS MovingAvg3
FROM #Sales
ORDER BY SaleDate, SaleID;
