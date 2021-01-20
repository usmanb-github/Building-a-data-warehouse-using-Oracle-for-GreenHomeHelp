--Create table
CREATE TABLE DW_TEMP_REQUEST(
TEMPREQUESTID	INT NOT NULL,
LOCALCOUNCIL_ID	INT NOT NULL,
REQUEST_DATE	DATE NOT NULL,
START_DATE	DATE NOT NULL, 
END_DATE	DATE NOT NULL,
MONDAY_AM	VARCHAR2(5) NOT NULL,
MONDAY_PM	VARCHAR2(5) NOT NULL,
TUESDAY_AM	VARCHAR2(5) NOT NULL,
TUESDAY_PM	VARCHAR2(5) NOT NULL,
WEDNESDAY_AM	VARCHAR2(5) NOT NULL,
WEDNESDAY_PM	VARCHAR2(5) NOT NULL,
THURSDAY_AM	VARCHAR2(5) NOT NULL,
THURSDAY_PM	VARCHAR2(5) NOT NULL,
FRIDAY_AM	VARCHAR2(5) NOT NULL,
FRIDAY_PM	VARCHAR2(5) NOT NULL,
SATURDAY_AM	VARCHAR2(5) NOT NULL,
REQUEST_STATUS	INT NOT NULL,
NUMBER_OF_WEEKS	INT NOT NULL,
COMMENTS	VARCHAR2(10),
PRIMARY KEY(TEMPREQUESTID)
);
?
--Transferring
declare
Cursor c_client is
SELECT TEMPREQUESTID,
LOCALCOUNCIL_ID,
REQUEST_DATE,
START_DATE,
END_DATE,
MONDAY_AM,
MONDAY_PM,
TUESDAY_AM,
TUESDAY_PM,
WEDNESDAY_AM,
WEDNESDAY_PM,
THURSDAY_AM,
THURSDAY_PM,
FRIDAY_AM,
FRIDAY_PM,
SATURDAY_AM,
REQUEST_STATUS,
NUMBER_OF_WEEKS,
COMMENTS from ST_TEMP_REQUEST;
begin
for c_rec in c_client loop
insert into DW_TEMP_REQUEST values(c_rec.TEMPREQUESTID, c_rec.LOCALCOUNCIL_ID, c_rec.REQUEST_DATE, c_rec.START_DATE, c_rec.END_DATE, 
c_rec.MONDAY_AM,
c_rec.MONDAY_PM,
c_rec.TUESDAY_AM,
c_rec.TUESDAY_PM,
c_rec.WEDNESDAY_AM,
c_rec.WEDNESDAY_PM,
c_rec.THURSDAY_AM,
c_rec.THURSDAY_PM,
c_rec.FRIDAY_AM,
c_rec.FRIDAY_PM,
c_rec.SATURDAY_AM,
c_rec.REQUEST_STATUS,
c_rec.NUMBER_OF_WEEKS,
c_rec.COMMENTS);

end loop;
end;
--Transforming
--UPDATING NULLS
UPDATE ST_TEMP_REQUEST SET START_DATE = '01-DEC-00' WHERE  START_DATE IS NULL;
UPDATE ST_TEMP_REQUEST SET END_DATE = '01-DEC-00' WHERE  END_DATE IS NULL;
UPDATE ST_TEMP_REQUEST SET COMMENTS = 'No Comment' WHERE  END_DATE IS NULL;
--REPLACING NO IN TIMETABLE
UPDATE DW_TEMP_REQUEST SET MONDAY_AM = REPLACE(MONDAY_AM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET MONDAY_PM = REPLACE(MONDAY_PM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET TUESDAY_AM = REPLACE(TUESDAY_AM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET TUESDAY_PM = REPLACE(TUESDAY_PM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET WEDNESDAY_AM = REPLACE(WEDNESDAY_AM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET WEDNESDAY_PM = REPLACE(WEDNESDAY_PM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET THURSDAY_AM = REPLACE(THURSDAY_AM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET THURSDAY_PM = REPLACE(THURSDAY_PM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET FRIDAY_AM = REPLACE(FRIDAY_AM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET FRIDAY_PM = REPLACE(FRIDAY_PM,'0', 'No');
UPDATE DW_TEMP_REQUEST SET SATURDAY_AM = REPLACE(SATURDAY_AM,'0', 'No');
--DEFAULT SETTINGS
ALTER TABLE DW_TEMP_REQUEST MODIFY MONDAY_AM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY MONDAY_PM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY TUESDAY_AM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY TUESDAY_PM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY WEDNESDAY_AM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY WEDNESDAY_PM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY THURSDAY_AM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY THURSDAY_PM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY FRIDAY_AM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY FRIDAY_PM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY SATURDAY_AM DEFAULT 'No';
ALTER TABLE DW_TEMP_REQUEST MODIFY COMMENTS DEFAULT 'No Comment';
ALTER TABLE DW_TEMP_REQUEST MODIFY NUMBER_OF_WEEKS DEFAULT '0';
ALTER TABLE DW_TEMP_REQUEST MODIFY REQUEST_STATUS DEFAULT '0';
?