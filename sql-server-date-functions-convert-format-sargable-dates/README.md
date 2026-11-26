# sql-server-date-functions-convert-format-sargable-dates

Companion scripts for a 7-minute video on **SQL Server date and time functions**, told
through one parcel: ordered on Friday 15 March 2024 at 14:30:45, due five days later,
delivered a day late. The scripts are also a **reference for every date and time function**,
each with a runnable example, its expected result and the minimum SQL Server version it needs.
They finish with formatting output (`CAST`, `CONVERT`, `FORMAT`) and with **sargable date
filters**: why `WHERE YEAR(OrderDate) = 2024` scans and a half-open range seeks.

Watch the video: <VIDEO_LINK>

## Requirements

The scripts use `datetime2`, so they need **SQL Server 2008 or later**, or Azure SQL
(Azure SQL Database or Azure SQL Managed Instance). Newer functions are in their own batches,
labelled with the version they need: 2012+ (`EOMONTH`, `*FROMPARTS`, `FORMAT`, `TRY_CONVERT`),
2016+ (`DATEDIFF_BIG`, `AT TIME ZONE`), 2022+ (`DATETRUNC`, `DATE_BUCKET`) and 2025+
(`CURRENT_DATE`). On an older server, a newer batch fails and the rest still run.

The expected results assume the default `us_english` language (`SET DATEFIRST 7`).

## How to run

1. Open a query window in **SSMS** or **Azure Data Studio**, connected to any database.
2. Run any script: `01` to `09` stand alone and create nothing.
3. `10` builds a 100,000-row temp table, `#Orders`. Turn on **Include Actual Execution Plan**
   (Ctrl+M) to compare the index scan and the index seek. The table disappears when you close
   the session.

## Contents

| Script | What it shows | Min. version | Video |
|--------|---------------|--------------|-------|
| [`01-current-date-and-time.sql`](01-current-date-and-time.sql) | the clock: GETDATE, SYSDATETIME, GETUTCDATE, SYSUTCDATETIME, SYSDATETIMEOFFSET, CURRENT_TIMESTAMP (and CURRENT_DATE, 2025+) | 2008 | 0:23 |
| [`02-date-parts.sql`](02-date-parts.sql) | YEAR, MONTH, DAY, DATEPART, DATENAME, and how SET DATEFIRST changes the weekday number | 2008 | 0:49 |
| [`03-date-arithmetic.sql`](03-date-arithmetic.sql) | DATEADD, DATEDIFF (counts boundaries), EOMONTH, and DATEDIFF_BIG (2016+) | 2012 | 1:41 |
| [`04-build-dates-from-parts.sql`](04-build-dates-from-parts.sql) | DATEFROMPARTS and the other *FROMPARTS functions | 2012 | 2:30 |
| [`05-datetrunc-date-bucket.sql`](05-datetrunc-date-bucket.sql) | DATETRUNC and DATE_BUCKET: round dates down to a part or a bucket | 2022 | 2:30 |
| [`06-time-zones.sql`](06-time-zones.sql) | AT TIME ZONE (with daylight saving), TODATETIMEOFFSET, SWITCHOFFSET, sys.time_zone_info | 2016 | 3:06 |
| [`07-validate-dates.sql`](07-validate-dates.sql) | why to avoid ISDATE, and TRY_CONVERT / TRY_CAST / TRY_PARSE instead | 2012 | 3:06 |
| [`08-cast-and-convert-styles.sql`](08-cast-and-convert-styles.sql) | CAST, and CONVERT with style codes (101, 103, 23, 112, 120, 126 and more) | 2008 | 3:42 |
| [`09-format.sql`](09-format.sql) | FORMAT with .NET patterns and cultures, and the MM / mm trap | 2012 | 4:22 |
| [`10-sargable-date-filters.sql`](10-sargable-date-filters.sql) | YEAR()/MONTH() in WHERE vs a half-open range (index scan vs seek), and why not BETWEEN | 2008 | 4:55 |

Video chapters: 0:00 Intro: one parcel · 0:23 The clock · 0:49 Taking a date apart · 1:41 Date arithmetic · 2:30 Building and rounding dates · 3:06 Time zones · 3:42 CAST and CONVERT · 4:22 FORMAT · 4:55 YEAR() in WHERE: scan vs seek · 5:34 Months, and why not BETWEEN · 6:06 Recap

## License

MIT. See [LICENSE](LICENSE).
