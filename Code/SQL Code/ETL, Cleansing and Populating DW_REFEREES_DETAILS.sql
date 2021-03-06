drop table DW_REFEREES_DETAILS; -- was only used for any issues with populating data to recreate table
--Creating Table
create table DW_REFEREES_DETAILS (
REFEREEID INT NOT NULL,
FULL_NAME VARCHAR(50) NOT NULL,
ADDRESS_LINE_1 VARCHAR(50) NOT NULL,
ADDRESS_LINE_2 VARCHAR(50),
TOWN VARCHAR(20),
COUNTY VARCHAR(20),
POSTCODE VARCHAR(10),
TELEPHONE VARCHAR(20),
PRIMARY KEY(REFEREEID)
);
--populating data
Create sequence DW_REFEREES_DETAILS_SEQ start with 3;
declare
Cursor c_client is
SELECT REFEREEID,
FIRST_NAME,
LAST_NAME,
ADDRESS_LINE_1,
ADDRESS_LINE_2,
TOWN,
COUNTY,
POSTCODE,
TEL from ST_REFEREES_DETAILS;
begin
for c_rec in c_client loop
insert into DW_REFEREES_DETAILS values(DW_REFEREES_DETAILS_SEQ.nextval, c_rec.FIRST_NAME || ' ' ||  c_rec.LAST_NAME, c_rec.ADDRESS_LINE_1, c_rec.ADDRESS_LINE_2, 
c_rec.TOWN, c_rec.COUNTY, c_rec.POSTCODE, c_rec.TEL);

end loop;
end;


-
--MOVING ADDRESS ONLY SOME
--UPDATING ADDRESS STATEMENTS GOT TOO LONG HENCE I DID ADD SOME
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '3';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Upper Norwood' WHERE REFEREEID = '3';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'London' WHERE REFEREEID = '3';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '4';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Oxford' WHERE REFEREEID = '4';
UPDATE ST_REFEREES_DETAILS SET TOWN = '' WHERE REFEREEID = '8';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'London' WHERE REFEREEID = '8';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '9';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'West Wickham' WHERE REFEREEID = '9';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '9'; 
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '14';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Streatham Hill' WHERE REFEREEID = '14';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'London' WHERE REFEREEID = '14';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '24';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Sidcup' WHERE REFEREEID = '24';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '24';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '25';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Sidcup' WHERE REFEREEID = '25';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '25';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '26';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'East Croydon' WHERE REFEREEID = '26';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Surrey' WHERE REFEREEID = '26';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '27';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Vanbrugh Hill' WHERE REFEREEID = '27';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Greenwich' WHERE REFEREEID = '27';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '30';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'London' WHERE REFEREEID = '30';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '32';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'West Wickham' WHERE REFEREEID = '32';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '32';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '41';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Childwall' WHERE REFEREEID = '41';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Liverpool' WHERE REFEREEID = '41';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '45';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'West Malling' WHERE REFEREEID = '45';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '45';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '50';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'West Wickham' WHERE REFEREEID = '50';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '50';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '52';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Sittingbourne' WHERE REFEREEID = '52';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '52';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '53';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Pembury' WHERE REFEREEID = '53';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '53';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '55';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Bromley' WHERE REFEREEID = '55';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '55';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '62';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Orpington' WHERE REFEREEID = '62';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '62';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '66';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Petts Wood' WHERE REFEREEID = '66';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '66';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '' WHERE REFEREEID = '69';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Mitcham' WHERE REFEREEID = '69';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Surrey' WHERE REFEREEID = '69';


--POSTCODE
--CHANGING CAPITALS
UPDATE ST_REFEREES_DETAILS SET FIRST_NAME = 'David' WHERE REFEREEID = '242';
UPDATE ST_REFEREES_DETAILS SET LAST_NAME = 'Masters' WHERE REFEREEID = '242';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_1 = 'Brook Lane Mission' WHERE REFEREEID = '242';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '198 Court Farm Road' WHERE REFEREEID = '242';
UPDATE ST_REFEREES_DETAILS SET TOWN = 'Mottingham' WHERE REFEREEID = '242';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'London' WHERE REFEREEID = '242';
UPDATE ST_REFEREES_DETAILS SET LAST_NAME = 'Camidoc' WHERE REFEREEID = '239';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'London' WHERE REFEREEID = '16';
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = '198 Court Farm Road' WHERE REFEREEID = '16';
UPDATE ST_REFEREES_DETAILS SET POSTCODE = 'BR1 5NJ' WHERE REFEREEID = '259';
UPDATE ST_REFEREES_DETAILS SET POSTCODE = 'BR1 5NJ' WHERE REFEREEID = '260';
UPDATE ST_REFEREES_DETAILS SET POSTCODE = 'S6V 0V7' WHERE REFEREEID = '111';

--SEPERATING DATA
UPDATE ST_REFEREES_DETAILS SET POSTCODE = 'BR3 4DG' WHERE REFEREEID = '7';
UPDATE ST_REFEREES_DETAILS SET COUNTY = 'Kent' WHERE REFEREEID = '7';
--REMOVING
UPDATE ST_REFEREES_DETAILS SET POSTCODE = REPLACE(POSTCODE,'`','');
--FINDING DUPLICATE KEY
SELECT
    FIRST_NAME, LAST_NAME, ADDRESS_LINE_1, COUNT(*)
FROM
    ST_REFEREES_DETAILS
GROUP BY
  FIRST_NAME, LAST_NAME, ADDRESS_LINE_1
HAVING COUNT(*) > 1;

--REPLACE COMMAS WITH BLANK
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_1 = REPLACE(ADDRESS_LINE_1,',','');
UPDATE ST_REFEREES_DETAILS SET ADDRESS_LINE_2 = REPLACE(ADDRESS_LINE_2,',','');
--DELETE NULL ROWS.
SELECT * FROM ST_REFEREES_DETAILS WHERE ADDRESS_LINE_1 IS NULL AND
ADDRESS_LINE_2 IS NULL AND TOWN IS NULL AND COUNTY IS NULL AND
POSTCODE IS NULL AND TEL IS NULL;

DELETE FROM ST_REFEREES_DETAILS WHERE refereeid = '131';
DELETE FROM ST_REFEREES_DETAILS WHERE refereeid = '233';
DELETE FROM ST_REFEREES_DETAILS WHERE refereeid = '243';
--DEFAULT DATA
UPDATE DW_REFEREES_DETAILS SET ADDRESS_LINE_2 = 'N/A' WHERE  ADDRESS_LINE_2 IS NULL;
UPDATE DW_REFEREES_DETAILS SET TOWN = 'N/A' WHERE  TOWN IS NULL;
UPDATE DW_REFEREES_DETAILS SET COUNTY = 'N/A' WHERE  COUNTY IS NULL;
UPDATE DW_REFEREES_DETAILS SET POSTCODE = 'N/A' WHERE  POSTCODE IS NULL;
UPDATE DW_REFEREES_DETAILS SET TELEPHONE = '00000000000' WHERE  TELEPHONE IS NULL;

--DEFAULT SETTING
ALTER TABLE DW_REFEREES_DETAILS MODIFY TOWN DEFAULT 'N/A';
ALTER TABLE DW_REFEREES_DETAILS MODIFY TOWN NOT NULL;
ALTER TABLE DW_REFEREES_DETAILS MODIFY ADDRESS_LINE_2 DEFAULT 'N/A';
ALTER TABLE DW_REFEREES_DETAILS MODIFY ADDRESS_LINE_2 NOT NULL;
ALTER TABLE DW_REFEREES_DETAILS MODIFY COUNTY DEFAULT 'N/A';
ALTER TABLE DW_REFEREES_DETAILS MODIFY COUNTY NOT NULL;
ALTER TABLE DW_REFEREES_DETAILS MODIFY POSTCODE DEFAULT 'N/A';
ALTER TABLE DW_REFEREES_DETAILS MODIFY POSTCODE NOT NULL;
ALTER TABLE DW_REFEREES_DETAILS MODIFY TELEPHONE DEFAULT '00000000000';
ALTER TABLE DW_REFEREES_DETAILS MODIFY TELEPHONE NOT NULL;
