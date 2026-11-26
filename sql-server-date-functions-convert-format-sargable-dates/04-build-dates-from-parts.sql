/* 04-build-dates-from-parts.sql
   Shows:    DATEFROMPARTS and the other *FROMPARTS functions.
   Requires: SQL Server 2012+, or Azure SQL Database / Managed Instance
   Video:    2:30

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

SELECT DATEFROMPARTS(2024, 3, 15)                         AS [date],           -- 2024-03-15
       TIMEFROMPARTS(14, 30, 45, 0, 0)                    AS [time],           -- 14:30:45
       DATETIMEFROMPARTS(2024, 3, 15, 14, 30, 45, 0)      AS [datetime],       -- 2024-03-15 14:30:45.000
       SMALLDATETIMEFROMPARTS(2024, 3, 15, 14, 30)        AS [smalldatetime],  -- 2024-03-15 14:30:00
       DATETIME2FROMPARTS(2024, 3, 15, 14, 30, 45, 0, 0)  AS [datetime2],      -- 2024-03-15 14:30:45
       DATETIMEOFFSETFROMPARTS(2024, 3, 15, 14, 30, 45, 0, 5, 30, 0)
                                                          AS [datetimeoffset]; -- 2024-03-15 14:30:45 +05:30
-- An impossible date raises an error: DATEFROMPARTS(2024, 2, 30) fails.
GO
