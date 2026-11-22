/* 07-row-number-gotcha.sql
   Shows:    Gotcha: ROW_NUMBER with a non-unique ORDER BY is non-deterministic.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    3:55

   Run 01-setup-race-results.sql first, in the same query window. */

-- Ana and Ben tie on FinishTime, so this may number them 1/2 or 2/1:
SELECT Runner, FinishTime,
       ROW_NUMBER() OVER (ORDER BY FinishTime) AS Place
FROM #Results;

-- Fix: add a unique tie breaker, and the result is always the same.
SELECT Runner, FinishTime,
       ROW_NUMBER() OVER (ORDER BY FinishTime, RunnerID) AS Place
FROM #Results;
