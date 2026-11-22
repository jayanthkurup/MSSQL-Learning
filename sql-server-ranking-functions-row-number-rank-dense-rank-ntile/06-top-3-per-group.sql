/* 06-top-3-per-group.sql
   Shows:    Top 3 per group: rank in a CTE, then filter (ties share the podium).
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    3:19

   Run 01-setup-race-results.sql first, in the same query window. */

-- A window function can't go in WHERE (WHERE runs before SELECT),
-- so rank inside a CTE, then filter.
-- Expected 6 rows: Masters Eli 1, Fay 2, Gus 2; Open Ana 1, Ben 1, Cara 3
WITH Ranked AS
(
    SELECT AgeGroup, Runner, FinishTime,
           RANK() OVER (PARTITION BY AgeGroup
                        ORDER BY FinishTime) AS Medal
    FROM #Results
)
SELECT AgeGroup, Runner, FinishTime, Medal
FROM Ranked
WHERE Medal <= 3
ORDER BY AgeGroup, Medal, Runner;
