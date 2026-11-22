/* 01-setup-race-results.sql
   Shows:    the demo table #Results: 8 runners, 2 age groups, 2 ties.
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    0:54

   Run this first. #Results is a session temp table: run 02-07 in the
   SAME query window. It disappears when you close the session. */

IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results;

CREATE TABLE #Results
(
    RunnerID   int IDENTITY(1,1) PRIMARY KEY,
    Runner     varchar(10)  NOT NULL,
    AgeGroup   varchar(10)  NOT NULL,
    FinishTime decimal(5,2) NOT NULL   -- seconds
);

INSERT INTO #Results (Runner, AgeGroup, FinishTime)
VALUES ('Ana',  'Open',    11.42),
       ('Ben',  'Open',    11.42),
       ('Cara', 'Open',    11.58),
       ('Dev',  'Open',    11.71),
       ('Eli',  'Masters', 12.05),
       ('Fay',  'Masters', 12.30),
       ('Gus',  'Masters', 12.30),
       ('Hal',  'Masters', 12.44);
