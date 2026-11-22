# sql-server-ranking-functions-row-number-rank-dense-rank-ntile

Companion scripts for a 5-minute video on **ranking functions in SQL Server**:
`ROW_NUMBER`, `RANK`, `DENSE_RANK` and `NTILE`, with `PARTITION BY`, told through a race
finish line. Two runners tie: who gets the gold? Ends with the classic "top 3 per group"
query and the `ROW_NUMBER` tie-breaker gotcha. One script per chapter.

Watch the video: <VIDEO_LINK>

## Requirements

The ranking functions and CTEs need SQL Server 2005 or later. The setup script uses a
multi-row `INSERT ... VALUES`, which needs SQL Server 2008, so run the set on SQL Server 2008
or later, or Azure SQL (Azure SQL Database or Azure SQL Managed Instance). The demo uses an
8-row temp table, so no database setup is needed and nothing is left behind.

## How to run

1. Open a query window in **SSMS** or **Azure Data Studio**, connected to any database.
2. Run `01-setup-race-results.sql`.
3. In **the same query window**, run the other scripts in order. `#Results` is a session temp
   table, so a new tab or connection won't see it. Run `01` again there if you need it.
4. Each script lists its expected results in a comment, so you can check your output.

## Contents

| Script | What it shows | Min. version | Video |
|--------|---------------|--------------|-------|
| [`01-setup-race-results.sql`](01-setup-race-results.sql) | the demo table #Results: 8 runners, 2 age groups, 2 ties | 2008 | 0:54 |
| [`02-row-number.sql`](02-row-number.sql) | ROW_NUMBER: a unique place per row; RunnerID breaks the tie | 2005 | 1:23 |
| [`03-rank-and-dense-rank.sql`](03-rank-and-dense-rank.sql) | RANK (1, 1, 3) vs DENSE_RANK (1, 1, 2) on the same ties | 2005 | 1:52 |
| [`04-ntile.sql`](04-ntile.sql) | NTILE(4): split the field into 4 equal heats | 2005 | 2:28 |
| [`05-partition-by.sql`](05-partition-by.sql) | PARTITION BY: a separate ranking per age group | 2005 | 2:54 |
| [`06-top-3-per-group.sql`](06-top-3-per-group.sql) | Top 3 per group: rank in a CTE, then filter (ties share the podium) | 2005 | 3:19 |
| [`07-row-number-gotcha.sql`](07-row-number-gotcha.sql) | Gotcha: ROW_NUMBER with a non-unique ORDER BY is non-deterministic | 2005 | 3:55 |

Video chapters: 0:00 Intro · 0:26 The finish line · 0:54 Race results table · 1:23 ROW_NUMBER · 1:52 RANK vs DENSE_RANK · 2:28 NTILE · 2:54 PARTITION BY · 3:19 Top 3 per group · 3:55 Gotcha: unique ORDER BY · 4:23 Recap

## License

MIT. See [LICENSE](LICENSE).
