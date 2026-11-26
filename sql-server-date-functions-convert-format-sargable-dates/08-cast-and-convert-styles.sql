/* 08-cast-and-convert-styles.sql
   Shows:    CAST, and CONVERT with style codes (101, 103, 23, 112, 120, 126 and more).
   Requires: SQL Server 2008+, or Azure SQL Database / Managed Instance
   Video:    3:42

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

DECLARE @Placed datetime2(0) = '2024-03-15T14:30:45';

SELECT CAST(@Placed AS date)              AS JustDate,  -- 2024-03-15
       CAST(@Placed AS time(0))           AS JustTime,  -- 14:30:45
       CONVERT(varchar(30), @Placed, 101) AS US,        -- 03/15/2024
       CONVERT(varchar(30), @Placed, 103) AS British,   -- 15/03/2024
       CONVERT(varchar(30), @Placed, 23)  AS IsoDate,   -- 2024-03-15
       CONVERT(varchar(30), @Placed, 112) AS IsoBasic,  -- 20240315
       CONVERT(varchar(30), @Placed, 120) AS Odbc,      -- 2024-03-15 14:30:45
       CONVERT(varchar(30), @Placed, 126) AS Iso8601;   -- 2024-03-15T14:30:45

-- More styles
SELECT CONVERT(varchar(30), @Placed, 104) AS German,    -- 15.03.2024
       CONVERT(varchar(30), @Placed, 106) AS DayMonYr,  -- 15 Mar 2024
       CONVERT(varchar(30), @Placed, 107) AS MonDayYr,  -- Mar 15, 2024
       CONVERT(varchar(30), @Placed, 108) AS TimeOnly,  -- 14:30:45
       CONVERT(varchar(30), @Placed, 110) AS USDashes,  -- 03-15-2024
       CONVERT(varchar(30), @Placed, 111) AS Japan;     -- 2024/03/15
-- In code, write date literals as 'yyyymmdd' or 'yyyy-mm-ddThh:mi:ss':
-- SQL Server reads those the same way in every language setting.
GO
