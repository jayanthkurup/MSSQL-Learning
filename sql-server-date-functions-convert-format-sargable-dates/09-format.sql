/* 09-format.sql
   Shows:    FORMAT with .NET patterns and cultures, and the MM / mm trap.
   Requires: SQL Server 2012+, or Azure SQL Database / Managed Instance
   Video:    4:22

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

DECLARE @Placed datetime2(0) = '2024-03-15T14:30:45';

SELECT FORMAT(@Placed, 'dd MMM yyyy')      AS Short,  -- 15 Mar 2024
       FORMAT(@Placed, 'D', 'en-US')       AS LongUS, -- Friday, March 15, 2024
       FORMAT(@Placed, 'D', 'de-DE')       AS LongDE, -- Freitag, 15. März 2024
       FORMAT(@Placed, 'yyyy-MM-dd HH:mm') AS Stamp,  -- 2024-03-15 14:30
       FORMAT(@Placed, 'yyyy-mm-dd')       AS Oops;   -- 2024-30-15 (mm = minutes!)
-- FORMAT returns nvarchar: NULL for an invalid format string, and an
-- error for an invalid culture. For large
-- result sets, prefer CONVERT with a style, or format in the application.
GO
