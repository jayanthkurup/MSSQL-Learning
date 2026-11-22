/* 05-partition-by.sql
   Shows:    PARTITION BY: a separate ranking per age group.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    2:54

   Run 01-setup-race-results.sql first, in the same query window. */

-- Expected: Masters Eli 1, Fay 2, Gus 2, Hal 4; Open Ana 1, Ben 1, Cara 3, Dev 4
SELECT AgeGroup, Runner, FinishTime,
       RANK() OVER (PARTITION BY AgeGroup
                    ORDER BY FinishTime) AS Rnk
FROM #Results
ORDER BY AgeGroup, Rnk, Runner;
