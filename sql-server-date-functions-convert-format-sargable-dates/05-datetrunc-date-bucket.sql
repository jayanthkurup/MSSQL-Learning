/* 05-datetrunc-date-bucket.sql
   Shows:    DATETRUNC and DATE_BUCKET: round dates down to a part or a bucket.
   Requires: SQL Server 2022+, or Azure SQL Database / Managed Instance
   Video:    2:30

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

-- (DATEFROMPARTS in this query is 2012+; the batch as a whole needs 2022.)
DECLARE @Placed datetime2(0) = '2024-03-15T14:30:45';

SELECT DATEFROMPARTS(2024, 3, 15)    AS Built,      -- 2024-03-15
       DATETRUNC(month, @Placed)     AS MonthStart, -- 2024-03-01 00:00:00
       DATE_BUCKET(week, 1, @Placed) AS WeekStart;  -- 2024-03-11 00:00:00 (a Monday)

SELECT DATETRUNC(hour, @Placed)          AS HourStart,    -- 2024-03-15 14:00:00
       DATETRUNC(year, @Placed)          AS YearStart,    -- 2024-01-01 00:00:00
       DATE_BUCKET(minute, 15, @Placed)  AS QuarterHour,  -- 2024-03-15 14:30:00
       DATE_BUCKET(day, 7, @Placed, CAST('20240101' AS datetime2(0)))
                                         AS WeekFrom1Jan; -- 2024-03-11 00:00:00
-- DATE_BUCKET counts buckets from an origin: by default 1900-01-01, a
-- Monday, so one-week buckets start on Mondays. It needs a typed value,
-- not a string literal, for its date argument.
-- DATETRUNC(week, ...) uses @@DATEFIRST instead: Sunday 2024-03-10 here.
GO
