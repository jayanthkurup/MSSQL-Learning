# sql-server-running-totals-window-functions

Companion scripts for a 5-minute video on **running totals in SQL Server with window functions**:
`SUM() OVER (ORDER BY … ROWS UNBOUNDED PRECEDING)`, per-group totals with `PARTITION BY`,
3-row moving averages, and the default-`RANGE` gotcha. They're for anyone who writes T-SQL
reports and wants to follow along with the video, one script per chapter.

Watch the video: <VIDEO_LINK>

## Requirements

SQL Server 2012 or later, or Azure SQL (Azure SQL Database or Azure SQL Managed Instance).
The demo uses a 6-row temp table, so no database setup is needed and nothing is left behind.

## How to run

1. Open a query window in **SSMS** or **Azure Data Studio**, connected to any database.
2. Run `01-setup-sample-data.sql`.
3. In **the same query window**, run the other scripts in order. Paste each one in, or replace the
   window's contents. `#Sales` is a session temp table, so a new tab or connection won't see it.
   Run `01` again there if you need it in another session.
4. Each script lists its expected results in a comment, so you can check your output.

## Contents

| Script | What it shows | Min. version | Video |
|--------|---------------|--------------|-------|
| [`01-setup-sample-data.sql`](01-setup-sample-data.sql) | The `#Sales` demo table (6 rows, East/West) | 2008 (series: 2012) | 1:32 |
| [`02-old-way-correlated-subquery.sql`](02-old-way-correlated-subquery.sql) | The old way: correlated subquery | any | 0:57 |
| [`03-running-total.sql`](03-running-total.sql) | `SUM() OVER (ORDER BY … ROWS UNBOUNDED PRECEDING)` | 2012 | 1:50 |
| [`04-running-total-by-region.sql`](04-running-total-by-region.sql) | Running total per group with `PARTITION BY` | 2012 | 2:35 |
| [`05-moving-average.sql`](05-moving-average.sql) | 3-row moving average, `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` | 2012 | 3:00 |
| [`06-rows-vs-range.sql`](06-rows-vs-range.sql) | Gotcha: default `RANGE` frame vs explicit `ROWS` | 2012 | 3:28 |

The video shows the old way (0:57) before the demo table (1:32). The setup script is numbered
first anyway, because every other script needs it.

Video chapters: 0:00 Running totals in SQL Server · 0:24 The problem · 0:57 The old way ·
1:32 Demo table · 1:50 The new way · 2:35 PARTITION BY · 3:00 Moving average ·
3:28 Gotcha: the default RANGE frame · 4:14 Recap

## License

MIT. See the [repository LICENSE](../LICENSE).
