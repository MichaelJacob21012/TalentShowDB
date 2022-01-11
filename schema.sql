-- Part 2.1 schema.sql
--
-- Submitted by: <Michael Jacob>, <1625998>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- Coach in show
CREATE TABLE Coach (
	idCoach INT(2) NOT NULL,                 -- Do not expect more than 99 coaches
    firstName VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    DoB DATE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    dailySalary DECIMAL(5,2) NOT NULL,       -- Do not expect salary >999.99
    gender CHAR(1) NOT NULL,
    PRIMARY KEY (idCoach)
    );
-- Contestant in show (individuals or groups)
CREATE TABLE Contender (
	idContender INT(3) NOT NULL,                -- Do not expect more than 999 contenders
    stageName VARCHAR(20) NOT NULL,
    contenderType CHAR(1) NOT NULL,
    idCoach INT(2) NOT NULL,
    PRIMARY KEY (idContender),
    FOREIGN KEY (idCoach) REFERENCES Coach(idCoach) ON UPDATE RESTRICT ON DELETE CASCADE
    );
-- Every individual participating   
CREATE TABLE Participant (
	idParticipant INT(4) NOT NULL,               -- Do not expect more than 9999 participants
    firstName VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    DoB DATE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    dailySalary DECIMAL(5,2) NOT NULL,
    gender CHAR(1) NOT NULL,
    idContender INT(3) NOT NULL,
    PRIMARY KEY (idParticipant),
    FOREIGN KEY (idContender) REFERENCES Contender(idContender)  ON UPDATE RESTRICT ON DELETE CASCADE
    );
 -- For use - only valid contenders with at least one participant   
    CREATE VIEW ValidContender AS (
    SELECT *
    FROM Contender
	WHERE idContender IN (SELECT idContender
    FROM Participant)
    );    
-- Each TV show  
CREATE TABLE TVShow (
	idShow INT(3) NOT NULL,                     -- Do not expect more than 999 shows
    showDate Date NOT NULL,
    startTime TIME NOT NULL,
    endTime TIME NOT NULL,
    showLocation varChar(20) NOT NULL DEFAULT 'TVStudio',
    PRIMARY KEY (idShow)
    );
-- The appearances of coaches in shows  
CREATE TABLE CoachInShow (
	idCoach INT(2) NOT NULL,
    idShow INT(3) NOT NULL,
    PRIMARY KEY (idCoach, idShow),
    FOREIGN KEY (idCoach) REFERENCES Coach(idCoach) ON UPDATE RESTRICT ON DELETE CASCADE,
    FOREIGN KEY (idShow) REFERENCES TVShow(idShow) ON UPDATE RESTRICT ON DELETE CASCADE
    );
-- The appearances of contenders in the show 
CREATE TABLE ContenderInShow (
	idContender INT(3) NOT NULL,
    idShow INTEGER(3) NOT NULL,
    PRIMARY KEY (idContender, idShow),
    FOREIGN KEY (idContender) REFERENCES Contender(idContender) ON UPDATE RESTRICT ON DELETE CASCADE,
    FOREIGN KEY (idShow) REFERENCES TVShow(idShow) ON UPDATE RESTRICT ON DELETE CASCADE
    );