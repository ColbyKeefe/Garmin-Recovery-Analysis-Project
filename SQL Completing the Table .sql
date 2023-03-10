-- ADDING A COLUMN THAT GIVES THE MAX VALUE FOR EACH DATE 
ALTER TABLE BODY_BATTERY 
ADD COLUMN MAX_VALUE NUMERIC;
-- ADDING THE NEW COLUMN TO THE ORIGINAL TABLE 
UPDATE BODY_BATTERY 
SET MAX_VALUE = (SELECT MAX(BODY_BATTERY) FROM BODY_BATTERY AS T2 WHERE T2.DATE = BODY_BATTERY.DATE);
--CHECKING TO SEE THAT IT WAS ADDED 
SELECT * FROM BODY_BATTERY;
-- CREATING A VIEW THAT COMBINES ALL OF THE NECESSARY DATE
CREATE VIEW FINAL_TABLE 
AS SELECT T1.DATE, T1.RESTING_HEART_RATE, T2.MAX_VALUE, T3.SLEEP, T4.STRESS 
FROM RHR T1
JOIN BODY_BATTERY T2 ON T1.DATE = T2.DATE 
JOIN SLEEP T3 ON T1.DATE = T3.DATE 
JOIN STRESS T4 ON T1.DATE = T4.DATE;
-- CHECKING TO SEE HOW IT CAME OUT (STILL WRONG)
SELECT * FROM FINAL_TABLE;
-- TRYING TO SELECT ONLY THE DISTINCT DATES AND THE REST OF THE VALUES 
SELECT DISTINCT(DATE), RESTING_HEART_RATE, MAX_VALUE, SLEEP, STRESS 
FROM FINAL_TABLE;
-- CREATING A NEW VIEW THAT USES THE STATEMENT ABOVE 
CREATE OR REPLACE VIEW FINAL_TALBE 
AS SELECT DISTINCT(DATE), RESTING_HEART_RATE, MAX_VALUE, SLEEP, STRESS 
FROM FINAL_TABLE;
-- CHECKING TO SEE THAT IT WORKED 
SELECT * FROM FINAL_TALBE;