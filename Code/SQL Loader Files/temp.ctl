Load Data
infile 'G:\temp.dat'
into table dw_temp
fields terminated by "," optionally enclosed by '"'
(emp_id,lname,fname,salary)
