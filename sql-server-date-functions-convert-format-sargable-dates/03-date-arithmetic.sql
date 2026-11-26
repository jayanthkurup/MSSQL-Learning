/* 03-date-arithmetic.sql
   Shows:    DATEADD, DATEDIFF (counts boundaries), EOMONTH, and DATEDIFF_BIG (2016+).
   Requires: SQL Server 2012+, or Azure SQL Database / Managed Instance
   Video:    1:41

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

--    This batch needs SQL Server 2012+. ---------------------------------
DECLARE @Placed    datetime2(0) = '2024-03-15T14:30:45';
DECLARE @Delivered datetime2(0) = '2024-03-21T09:10:00';
DECLARE @Due       datetime2(0) = DATEADD(day, 5, @Placed);  -- 2024-03-20 14:30:45

SELECT @Due                                    AS Due,       -- 2024-03-20 14:30:45
       DATEDIFF(day, @Due, @Delivered)         AS DaysLate,  -- 1
       DATEDIFF(year, '20241231', '20250101')  AS Years,     -- 1, after one day!
       EOMONTH(@Placed)                        AS MonthEnd,  -- 2024-03-31
       EOMONTH(@Placed, 1)                     AS NextEnd;   -- 2024-04-30

SELECT DATEDIFF(day, @Placed, @Delivered)        AS DaysInTransit,  -- 6
       DATEDIFF(hour, @Placed, @Delivered)       AS HoursInTransit, -- 139
       DATEADD(month, 1, CAST('20240131' AS date)) AS MonthAfter31Jan; -- 2024-02-29 (clamped)
-- DATEDIFF counts BOUNDARIES crossed (midnights, new years), not
-- complete periods. DATEADD with a negative number goes back in time.
GO

-- DATEDIFF_BIG: SQL Server 2016+ -------------------------------------
-- DATEDIFF returns int, so DATEDIFF(millisecond, '20000101', @Placed)
-- overflows (763,828,245,000 is more than 2,147,483,647).
DECLARE @Placed datetime2(0) = '2024-03-15T14:30:45';
SELECT DATEDIFF_BIG(millisecond, '20000101', @Placed) AS MsSince2000; -- 763828245000
GO
