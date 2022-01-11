-- Part 2.5 delete.sql
--
-- Submitted by: <Michael Jacob>, <1625998>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- this view has each contender's id with their total hourly salary
CREATE VIEW ContenderSalaries AS
SELECT c.stageName, SUM(hourlySalary) AS contenderSalary
FROM Contender c, Participant p
WHERE c.idContender = p.idContender
GROUP BY c.idContender;

-- stage name of lowest paid contender
CREATE VIEW LowestPaid AS
SELECT stageName
FROM ContenderSalaries cs 
WHERE contenderSalary = (SELECT MIN(contenderSalary)
FROM ContenderSalaries 
);

-- delete lowest paid contender. Since all relavent foreign keys are set to on delete cascade all related data will be deleted                         
DELETE FROM Contender
WHERE stageName IN (SELECT *
FROM LowestPaid);
                    
