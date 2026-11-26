/* 01-current-date-and-time.sql
   Shows:    the clock: GETDATE, SYSDATETIME, GETUTCDATE, SYSUTCDATETIME, SYSDATETIMEOFFSET, CURRENT_TIMESTAMP (and CURRENT_DATE, 2025+).
   Requires: SQL Server 2008+, or Azure SQL Database / Managed Instance
   Video:    0:23

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

-- These return a different value every run.
SELECT GETDATE()           AS [GETDATE],           -- datetime
       CURRENT_TIMESTAMP   AS [CURRENT_TIMESTAMP], -- datetime (ANSI name)
       SYSDATETIME()       AS [SYSDATETIME],       -- datetime2(7)
       GETUTCDATE()        AS [GETUTCDATE],        -- datetime, UTC
       SYSUTCDATETIME()    AS [SYSUTCDATETIME],    -- datetime2(7), UTC
       SYSDATETIMEOFFSET() AS [SYSDATETIMEOFFSET]; -- datetimeoffset(7)
-- SYSDATETIME, SYSUTCDATETIME, SYSDATETIMEOFFSET: SQL Server 2008+.
-- GETDATE, GETUTCDATE, CURRENT_TIMESTAMP: every version.
GO

-- CURRENT_DATE (date only): SQL Server 2025+, Azure SQL Database, Azure SQL Managed Instance.
-- SELECT CURRENT_DATE AS [CURRENT_DATE];
-- CURRENT_TIMEZONE() and CURRENT_TIMEZONE_ID(): SQL Server 2022+ (see section 6).
