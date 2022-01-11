-- Part 2.4 update.sql
--
-- Submitted by: <Michael Jacob>, <1625998>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- Coaches and participants work 4 hours a day . Divide daily salary by 4 and change to hourly salary
UPDATE Coach
SET dailySalary = dailySalary/4;       -- values are rounded
ALTER TABLE Coach CHANGE dailySalary hourlySalary DECIMAL(5,2);
UPDATE Participant
SET dailySalary = dailySalary/4;       -- values are rounded
ALTER TABLE Participant CHANGE dailySalary hourlySalary DECIMAL(5,2);

-- Add new fields in the appearance tables
ALTER TABLE CoachInShow ADD arrivalTime TIME;
ALTER TABLE CoachInShow ADD departureTime TIME;
ALTER TABLE ContenderInShow ADD arrivalTime TIME;
ALTER TABLE ContenderInShow ADD departureTime TIME;

-- Set new arrival and departure times to be 1 hour before start and 1 hour after start respectively
UPDATE CoachInShow c, TVShow t
SET arrivalTime = subTime(startTime, '01:00:00'), departureTime = addTime(endTime, '01:00:00')
WHERE c.idShow = t.idShow;
UPDATE ContenderInShow c, TVShow t
SET arrivalTime = subTime(startTime, '01:00:00'), departureTime = addTime(endTime, '01:00:00')
WHERE c.idShow = t.idShow;
