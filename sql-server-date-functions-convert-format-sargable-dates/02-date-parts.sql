/* 02-date-parts.sql
   Shows:    YEAR, MONTH, DAY, DATEPART, DATENAME, and how SET DATEFIRST changes the weekday number.
   Requires: SQL Server 2008+, or Azure SQL Database / Managed Instance
   Video:    0:49

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

DECLARE @Placed    datetime2(0) = '2024-03-15T14:30:45';  -- Friday
DECLARE @Delivered datetime2(0) = '2024-03-21T09:10:00';  -- Thursday

SELECT YEAR(@Placed)                AS Yr,        -- 2024
       MONTH(@Placed)               AS Mo,        -- 3
       DAY(@Placed)                 AS Dy,        -- 15
       DATEPART(quarter, @Placed)   AS Qtr,       -- 1
       DATEPART(hour, @Placed)      AS Hr,        -- 14
       DATEPART(dayofyear, @Placed) AS DayOfYr,   -- 75
       DATENAME(month, @Placed)     AS MonthName, -- March
       DATENAME(weekday, @Placed)   AS DayName,   -- Friday
       DATEPART(weekday, @Placed)   AS WeekdayNo; -- 6 (DATEFIRST 7)

-- More DATEPART parts
SELECT DATEPART(week, @Placed)        AS Wk,       -- 11 (week 1 contains 1 January)
       DATEPART(iso_week, @Placed)    AS IsoWk,    -- 11 (ISO 8601, weeks start Monday)
       DATEPART(minute, @Placed)      AS Mi,       -- 30
       DATEPART(second, @Placed)      AS Ss,       -- 45
       DATEPART(millisecond, @Placed) AS Ms,       -- 0
       @@DATEFIRST                    AS DateFirst; -- 7 for us_english

-- The weekday number depends on SET DATEFIRST (it is per session):
SET DATEFIRST 1;                              -- Monday = day 1
SELECT DATEPART(weekday, @Placed) AS WeekdayNo; -- 5
SET DATEFIRST 7;                              -- back to the us_english default
-- SET LANGUAGE changes DATEFIRST and the names DATENAME returns.
-- SET DATEFORMAT dmy / mdy changes how ambiguous strings like '03/04/2024' are read.
GO
