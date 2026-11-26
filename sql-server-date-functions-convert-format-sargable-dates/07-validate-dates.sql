/* 07-validate-dates.sql
   Shows:    why to avoid ISDATE, and TRY_CONVERT / TRY_CAST / TRY_PARSE instead.
   Requires: SQL Server 2012+, or Azure SQL Database / Managed Instance
   Video:    3:06

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

-- ISDATE only knows datetime (1753 onwards) and follows the session's
-- language and DATEFORMAT, so the same string can be 1 or 0.
SELECT ISDATE('2024-03-15')          AS IsDate1,  -- 1 in us_english; 0 after SET DATEFORMAT dmy
       ISDATE('1500-01-01')          AS IsDate2,  -- 0: valid for date and datetime2, not for datetime
       TRY_CONVERT(date, '1500-01-01') AS Tried,  -- 1500-01-01
       TRY_CAST('not a date' AS date)  AS Nope;   -- NULL
-- PARSE / TRY_PARSE (2012+) read culture-specific text through .NET, e.g.
-- TRY_PARSE('15/03/2024' AS date USING 'en-GB') = 2024-03-15. Slow, like FORMAT.
GO
