SELECT t.MONTH_NAME, s.TYPE, s.SESSIONID 
FROM DW_FACT_SESSION s, DW_TIME t 
where s.TYPE != 'Not Known'
order by t.MONTH_NAME, s.TYPE;

select t.WEEK_OF_YEAR as Week, c.LOCALCOUNCILNAME as Council, count(s.TEMPREQUESTID) As Requests
from DW_FACT_SESSION s , DW_TIME t, DW_LOCAL_COUNCIL c, DW_TEMP_REQUEST r
where s.TEMPREQUESTID = r.TEMPREQUESTID 
AND c.LOCALCOUNCIL_ID = r.LOCALCOUNCIL_ID
AND s.SESSIONID = t.DATE_ID
group by t.WEEK_OF_YEAR, c.LOCALCOUNCILNAME  
order by t.WEEK_OF_YEAR, c.LOCALCOUNCILNAME;


select t.MONTH_NO as month, c.county as County, count(s.TEMPREQUESTID) As Requests
from DW_FACT_SESSION s , DW_TIME t, DW_LOCAL_COUNCIL c, DW_TEMP_REQUEST r
where s.TEMPREQUESTID = r.TEMPREQUESTID 
AND c.LOCALCOUNCIL_ID = r.LOCALCOUNCIL_ID
AND s.sessionid = t.date_id
AND s.type != 'Not Known'
group by t.MONTH_NO, c.county  
order by t.MONTH_NO, c.county;


select t.week_of_year as Week, c.LOCALCOUNCILNAME as Council, count(s.TEMPREQUESTID) As Requests
from DW_FACT_SESSION s , DW_TIME t, DW_LOCAL_COUNCIL c, DW_TEMP_REQUEST r
where s.TEMPREQUESTID = r.TEMPREQUESTID 
AND c.LOCALCOUNCIL_ID = r.LOCALCOUNCIL_ID
AND s.sessionid = t.date_id
AND s.type != 'Not Known'
group by t.week_of_year, c.LOCALCOUNCILNAME
order by t.week_of_year, c.LOCALCOUNCILNAME;


select t.month_no, count(s.TEMPREQUESTID)
from DW_FACT_SESSION s , dw_time t, DW_TEMP_REQUEST r
where s.TEMPREQUESTID = r.TEMPREQUESTID 
AND s.sessionid = t.date_id
AND s.status = 'Temp Cancelled'
group by t.month_no
order by t.month_no;


