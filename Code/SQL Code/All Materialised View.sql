--MATERIALISED VIEW
--EMPLOYEE_DETAILS_VIEW
DROP MATERIALIZED VIEW VIEW_EMPLOYEE_DETAILS;
Create Materialized view DW_VIEW_EMPLOYEE_DETAILS
Build deferred     
Refresh on demand 
Enable query rewrite
As select s.LOCAL_COUNCIL_ID, c.LOCALCOUNCILNAME, TITLE, FULL_NAME from DW_LOCAL_COUNCIL c, 
DW_EMPLOYEE_DETAILS s where  c.LOCALCOUNCIL_ID = s.LOCAL_COUNCIL_ID;
EXECUTE DBMS_MVIEW.REFRESH('DW_VIEW_EMPLOYEE_DETAILS', 'C');

DROP MATERIALIZED VIEW DW_REFERENCES_VIEW;
Create Materialized view DW_VIEWS_REFERENCES
Build deferred     
Refresh on demand 
Enable query rewrite
As select r.referenceid, FULL_NAME, r.date_reference_sent, r.date_reference_received, r.tempid, r.telephone_made 
from DW_REFERENCES r, DW_REFEREES_DETAILS d
where  r.REFEREEID = d.REFEREEID;
EXECUTE DBMS_MVIEW.REFRESH('DW_VIEWS_REFERENCES', 'C');


--temp comptability detail view
DROP MATERIALIZED VIEW DW_VIEW_TEMPCOMPATIBILITYDETAILS;
Create Materialized view DW_VIEW_TEMPCOMPATIBILITYDETAILS
Build deferred     
Refresh on demand 
Enable query rewrite
As select tc.TEMPCOMPATIBILITYDETAILS_ID, FIRST_NAME, LAST_NAME, tc.BRANCHID, tc.COMPATIBILITY from DW_TEMPCOMPATIBILITYDETAILS tc, DW_TEMP t
where  tc.TEMPID = t.TEMPID;
EXECUTE DBMS_MVIEW.REFRESH('DW_VIEW_TEMPCOMPATIBILITYDETAILS', 'C');

--DW_TEMP_REQUEST_VIEW
DROP MATERIALIZED VIEW DW_VIEW_TEMP_REQUEST;
Create Materialized view DW_VIEW_TEMP_REQUEST
Build deferred     
Refresh on demand 
Enable query rewrite
As select tr.TEMPREQUESTID, LOCALCOUNCILNAME,
tr.REQUEST_DATE, tr.START_DATE, tr.END_DATE, tr.REQUEST_STATUS, tr.NUMBER_OF_WEEKS
from DW_TEMP_REQUEST tr, DW_LOCAL_COUNCIL c
where  tr.LOCALCOUNCIL_ID = c.LOCALCOUNCIL_ID;
EXECUTE DBMS_MVIEW.REFRESH('DW_VIEW_TEMP_REQUEST', 'C');


--bonus
-- duration session
DROP MATERIALIZED VIEW DW_VIEW_SESSION_DURATION;
Create Materialized view DW_VIEW_SESSION_DURATION
Build deferred     
Refresh on demand 
disable query rewrite
As select s.SESSIONID, s.SESSIONDATE, s.SESSIONSTART,s.SESSIONEND, (TO_TIMESTAMP(s.SESSIONEND, 'hh24:mi:ss') - TO_TIMESTAMP(s.SESSIONSTART, 'hh24:mi:ss')) duration from DW_FACT_SESSION s;
EXECUTE DBMS_MVIEW.REFRESH('DW_VIEW_SESSION_DURATION', 'C');



--mv average month
DROP MATERIALIZED VIEW DW_VIEW_SESSION_AVERAGE_MONTH;
Create Materialized view DW_VIEW_SESSION_AVERAGE_MONTH
Build deferred     
Refresh on demand 
disable query rewrite
As select
trunc(to_date(s.SESSIONDATE, 'dd-mon-yy'), 'mm') mnt, 
numtodsinterval( avg(to_date(s.SESSIONEND, 'hh24:mi:ss') - to_date(s.SESSIONSTART, 'hh24:mi:ss')), 'day') avg_interval 
from DW_FACT_SESSION s  group by trunc(to_date(s.SESSIONDATE, 'dd-mon-yy'), 'mm');
EXECUTE DBMS_MVIEW.REFRESH('DW_VIEW_SESSION_AVERAGE_MONTH', 'C');

--works duration of time
select s.SESSIONID, s.SESSIONDATE, s.SESSIONSTART,s.SESSIONEND, (TO_TIMESTAMP(s.SESSIONEND, 'hh24:mi:ss') - TO_TIMESTAMP(s.SESSIONSTART, 'hh24:mi:ss')) duration from DW_FACT_SESSION s;

--average per month
select
trunc(to_date(s.SESSIONDATE, 'dd-mon-yy'), 'mm') mnt, 
numtodsinterval( avg(to_date(s.SESSIONEND, 'hh24:mi:ss') - to_date(s.SESSIONSTART, 'hh24:mi:ss')), 'day') avg_interval 
from DW_FACT_SESSION s  group by trunc(to_date(s.SESSIONDATE, 'dd-mon-yy'), 'mm');

--group by attempt failure 
select e.SESSIONID, e.SESSIONDATE, e.SESSIONSTART,e.SESSIONEND,
trunc(to_date(s.SESSIONDATE, 'dd-mon-yy'), 'mm') mnt, 
numtodsinterval( avg(to_date(s.SESSIONEND, 'hh24:mi:ss') - to_date(s.SESSIONSTART, 'hh24:mi:ss')), 'day') avg_interval, COUNT(*)
from DW_FACT_SESSION s, DW_FACT_SESSION e WHERE e.SESSIONID = s.SESSIONID and e.SESSIONDATE = s.SESSIONDATE and e.SESSIONSTART = s.SESSIONSTART and e.SESSIONEND = s.SESSIONEND 
group by trunc(to_date(s.SESSIONDATE, 'dd-mon-yy'), 'mm'), e.SESSIONID, e.SESSIONDATE, e.SESSIONSTART,e.SESSIONEND;
