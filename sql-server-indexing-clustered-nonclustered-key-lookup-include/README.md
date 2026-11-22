# sql-server-indexing-clustered-nonclustered-key-lookup-include

Companion scripts for a 5-minute video on **SQL Server indexing**: clustered vs nonclustered
indexes, key lookups, and covering indexes with `INCLUDE`, told through one analogy: an index
is a book. One query (a customer's orders by date) goes from a full scan to a seek with key
lookups to a covering seek. One script per step.

Watch the video: <VIDEO_LINK>

## Requirements

`INCLUDE` columns, `DROP_EXISTING` and `ROW_NUMBER` need SQL Server 2005 or later. The setup
script uses the `date` type, which needs SQL Server 2008, so run the set on SQL Server 2008 or
later, or Azure SQL (Azure SQL Database or Azure SQL Managed Instance). The demo builds a
100,000-row temp table, so nothing is left behind.

In SSMS, turn on **Include Actual Execution Plan** (Ctrl+M) to see each plan, and read the
logical reads in the **Messages** tab (`01` turns on `SET STATISTICS IO`).

## How to run

1. Open a query window in **SSMS** or **Azure Data Studio**, connected to any database.
2. Run `01-setup-orders.sql`.
3. In **the same query window**, run the other scripts in order. `#Orders` is a session temp
   table, so a new tab or connection won't see it. Run `01` again there if you need it.
4. Each script's comments describe the plan shape to expect, so you can compare it with yours.

## Contents

| Script | What it shows | Min. version | Video |
|--------|---------------|--------------|-------|
| [`01-setup-orders.sql`](01-setup-orders.sql) | the demo table #Orders: 100,000 orders, 1,000 customers; turns on STATISTICS IO | 2008 | 0:52 |
| [`02-scan-without-index.sql`](02-scan-without-index.sql) | one customer's orders with only the clustered index: a Clustered Index Scan | 2005 | 1:28 |
| [`03-nonclustered-key-lookup.sql`](03-nonclustered-key-lookup.sql) | a nonclustered index: Index Seek plus a Key Lookup per row | 2005 | 2:00 |
| [`04-covering-index-include.sql`](04-covering-index-include.sql) | INCLUDE makes it covering: Index Seek only, no lookups, no sort | 2005 | 3:02 |

Video chapters: 0:00 Intro · 0:19 An index is a book · 0:52 Demo table: 100,000 orders · 1:28 Clustered index scan · 2:00 Nonclustered index + key lookup · 2:31 Too many lookups · 3:02 Covering index (INCLUDE) · 3:34 One query, three plans · 4:01 Gotcha: don't index everything · 4:31 Recap

## License

MIT. See [LICENSE](LICENSE).
