/* 06-time-zones.sql
   Shows:    AT TIME ZONE (with daylight saving), TODATETIMEOFFSET, SWITCHOFFSET, sys.time_zone_info.
   Requires: SQL Server 2016+, or Azure SQL Database / Managed Instance
   Video:    3:06

   Standalone: each batch declares the variables it uses.
   Expected results are in the comments (default us_english language). */

--    AT TIME ZONE and sys.time_zone_info (2016+), TRY_CONVERT (2012+),
--    CURRENT_TIMEZONE (2022+). This batch needs SQL Server 2016+. ------
DECLARE @Placed datetime2(0) = '2024-03-15T14:30:45';  -- stored as UTC

SELECT @Placed AT TIME ZONE 'UTC'
               AT TIME ZONE 'India Standard Time'               AS CustomerTime, -- 2024-03-15 20:00:45 +05:30
       TODATETIMEOFFSET(@Placed, '+00:00')                      AS Labelled,     -- 2024-03-15 14:30:45 +00:00
       SWITCHOFFSET(TODATETIMEOFFSET(@Placed, '+00:00'), '+05:30') AS Switched,  -- 2024-03-15 20:00:45 +05:30
       TRY_CONVERT(date, '2024-02-30')                          AS Bad;          -- NULL (there is no 30 February)

-- AT TIME ZONE knows daylight saving; a fixed offset doesn't.
-- US daylight saving began on 10 March 2024, so on 15 March Pacific time is UTC-7:
SELECT @Placed AT TIME ZONE 'UTC'
               AT TIME ZONE 'Pacific Standard Time' AS SeattleTime; -- 2024-03-15 07:30:45 -07:00
-- Every time zone name the server knows:
SELECT name, current_utc_offset, is_currently_dst FROM sys.time_zone_info;
-- SQL Server 2022+: the server's own time zone.
-- SELECT CURRENT_TIMEZONE() AS TimeZoneName, CURRENT_TIMEZONE_ID() AS TimeZoneId;
GO
