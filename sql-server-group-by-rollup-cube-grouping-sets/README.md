# sql-server-group-by-rollup-cube-grouping-sets

Companion scripts for a 5-minute video on **grouping and totals in SQL Server**:
`SELECT`, `WHERE`, `GROUP BY` and `HAVING`, then subtotals and grand totals with
`ROLLUP`, `CUBE` and `GROUPING SETS`, and labelling total rows with `GROUPING()` /
`GROUPING_ID()`. One script per chapter, for anyone who writes T-SQL reports.

Watch the video: <VIDEO_LINK>

## Requirements

SQL Server 2008 or later, or Azure SQL (Azure SQL Database or Azure SQL Managed Instance).
The demo uses a 9-row temp table, so no database setup is needed and nothing is left behind.

## How to run

1. Open a query window in **SSMS** or **Azure Data Studio**, connected to any database.
2. Run `01-setup-sample-data.sql`.
3. In **the same query window**, run the other scripts in order. `#Sales` is a session temp
   table, so a new tab or connection won't see it. Run `01` again there if you need it.
4. Each script lists its expected results in a comment, so you can check your output.

## Contents

| Script | What it shows | Min. version | Video |
|--------|---------------|--------------|-------|
| [`01-setup-sample-data.sql`](01-setup-sample-data.sql) | the demo table #Sales: 9 sales, 2 regions, 2 products, 2024-2025 | 2008 | 0:48 |
| [`02-select-where.sql`](02-select-where.sql) | SELECT + WHERE with a half-open date range (2025 only) | 2008 | 1:15 |
| [`03-group-by.sql`](03-group-by.sql) | GROUP BY Region, Product with COUNT(*) and SUM() | any | 1:45 |
| [`04-having.sql`](04-having.sql) | HAVING filters groups; WHERE filters rows | any | 2:14 |
| [`05-rollup.sql`](05-rollup.sql) | GROUP BY ROLLUP: per-region subtotals + grand total | 2008 | 2:36 |
| [`06-cube.sql`](06-cube.sql) | GROUP BY CUBE: every combination, adds per-product totals | 2008 | 3:08 |
| [`07-grouping-sets.sql`](07-grouping-sets.sql) | GROUP BY GROUPING SETS: only the totals you list | 2008 | 3:38 |
| [`08-grouping-labels.sql`](08-grouping-labels.sql) | GROUPING() / GROUPING_ID() to label total rows | 2008 | 4:04 |

Video chapters: 0:00 Intro · 0:18 Logical processing order · 0:48 Demo table · 1:15 SELECT + WHERE · 1:45 GROUP BY · 2:14 HAVING · 2:36 ROLLUP · 3:08 CUBE · 3:38 GROUPING SETS · 4:04 Gotcha: GROUPING() · 4:38 Recap

## License

MIT. See [LICENSE](LICENSE).
