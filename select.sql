 -- Part 2.3 select.sql
--
-- Submitted by: <Michael Jacob>, <1625998>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 


-- 1. Average Female Salary
SELECT AVG(dailySalary)
FROM Participant
WHERE gender = 'F';


-- 2. Coaching Report.
SELECT c.*, COUNT(idParticipant) AS participantsCoached			-- count all the actual participants for each coach
FROM Coach c left outer join (Contender co natural join Participant) on c.idCoach = co.idCoach 	-- make sure all coaches appear in the result
GROUP BY idCoach;

-- 3. Coach Monthly Attendance Report
SELECT c.idCoach, firstName, surname, COUNT(*) AS appearances, MONTH(t.showDate) AS calendarMonth
FROM Coach c, TVShow t, CoachInShow a
WHERE c.idCoach = a.idCoach AND a.idShow = t.idShow
GROUP BY idCoach, calendarMonth;

-- 4. Most Expensive Contender

-- this view has each contender's id with their total daily salary
CREATE VIEW ContenderSalaries AS
SELECT c.idContender, SUM(dailySalary) AS contenderSalary		-- total salary of all participants in contender
FROM Contender c, Participant p
WHERE c.idContender = p.idContender
GROUP BY c.idContender;


SELECT stageName
FROM Contender c, ContenderSalaries cs 
WHERE c.idContender = cs.idContender AND contenderSalary = (SELECT MAX(contenderSalary)
FROM ContenderSalaries 
);

DROP VIEW ContenderSalaries;

-- 5. March Payment Report
CREATE VIEW MarchPayment AS
SELECT firstName, surname, COUNT(*) AS marchAppearances, dailySalary, COUNT(*)*dailySalary AS marchSalary
FROM Coach c, TVShow t, CoachInShow a
WHERE c.idCoach = a.idCoach AND a.idShow = t.idShow AND MONTH(t.showDate) = 3
GROUP BY c.idCoach
UNION
SELECT firstName, surname, COUNT(*) AS marchAppearances, dailySalary, COUNT(*)*dailySalary AS marchSalary
FROM Contender c, Participant p, TVShow t, ContenderInShow a
WHERE c.idContender = a.idContender AND c.idContender = p.idContender AND a.idShow = t.idShow AND MONTH(t.showDate) = 3
GROUP BY idParticipant;
SELECT *
FROM MarchPayment
;
SELECT SUM(marchSalary)			-- the total amount to be paid in March
FROM MarchPayment;


-- 6. Well Formed Groups!
SELECT IF( NOT EXISTS( SELECT *
FROM Contender c, Participant p
WHERE c.idContender = p.idContender AND contenderType = 'G'
GROUP BY c.idContender
HAVING COUNT(*) < 2), 
TRUE,FALSE) AS result		-- true if there are no groups < 2 members
;

-- Test add a group contender with only one member
INSERT INTO Contender VALUES (008, 'Jordan', 'G', 01);
INSERT INTO Participant VALUES(0010, 'Jordan', 'Hale', '1995-03-31', '99223450989', 366.90, 'M', 008);

-- Rerun to check that a false condition will be returned
SELECT IF( NOT EXISTS( SELECT *
FROM Contender c, Participant p
WHERE c.idContender = p.idContender AND contenderType = 'G'
GROUP BY c.idContender
HAVING COUNT(*) < 2), 
TRUE,FALSE) AS result
;
