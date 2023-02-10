--Q-1 Write a query which will print name of each student, and his or her attendance report for current month. 
--Fields : Name, Attendance Report for Current Month

--Under "Attendance Report for Current Month"
--column:
--if 'studentpresent.present' is less than or equal to 7
--print "Poor"
--,
--if 'studentpresent.present' is more than 7 and less than or equals 15
--print "Good"
--,
--if 'studentpresent.present' is more than 15 and less than or equals 20
--print "Better"
--,
--if 'studentpresent.present' is more than 20
--print "Best".


SELECT NAME, PRESENT,
    CASE
WHEN PRESENT<7 OR PRESENT =7 AND MONTH_DISP ='FEB' THEN "POOR"
WHEN PRESENT>7 AND PRESENT<=15 AND MONTH_DISP ='FEB' THEN "GOOD"
WHEN PRESENT>15 AND PRESENT<=20 AND MONTH_DISP ='FEB' THEN "BETTER"
WHEN PRESENT >20 AND MONTH_DISP ='FEB' THEN "BEST"
END AS 'Attendance Report'
FROM Shubham_studentpresent1
NATURAL JOIN Shubham_Student1 
;






--Q-2 Write a query to print student name, total number of hours for Jan, Feb, March month. Information for each student should be printed in a single row.
--	Fields : Name, Working Hours for Jan, Working Hours for Feb, Working Hours for March
--See following
--example:
--Name		Working Hours for Jan	Working Hours for Feb	Working Hours for March
--	Minesh		80			70			90
--	Reena		70			80			90


SELECT NAME,
    CASE WHEN MONTH_DISP(date) = 2 THEN Hours
 END AS "Working hours for Feb",
    CASE WHEN MONTH_DISP(date) = 3 THEN Hours
 END AS "Working hours for March"
FROM Shubham_studenthours1
 NATURAL JOIN Shubham_Student1
 NATURAL JOIN Shubham_studentpresent1  
GROUP BY NAME;




--Q-3 Print information for the student having name like "Mira", "Kabir", "Om", "Manas"
--Fields: Name, Standard

SELECT A.NAME, B.STANDARD
FROM Shubham_Student1 A LEFT JOIN Shubham_studentdetail1 B ON A.REC_ID = B.REC_ID
where (A.NAME LIKE "%Shubham%"
    OR A.NAME LIKE "%Maulik%"
    OR A.NAME LIKE "%Kiara%");

--Q-4 Print information for the student having name other than "Mira", "Kabir", "Om", "Manas"
--Fields: Name, Standard
SELECT A.NAME, B.STANDARD
FROM Shubham_Student1 A LEFT JOIN Shubham_studentdetail1 B ON A.REC_ID = B.REC_ID
where (A.NAME NOT LIKE "%Shubham%"
    AND A.NAME NOT LIKE "%Maulik%"
    AND A.NAME NOT LIKE "%Kiara%");


--Q-5 Print information for the student having presence for Jananuary between 20 to 25.
--Fields: Name, Standard, Present										 
SELECT A.NAME, B.STANDARD, C.PRESENT
FROM Shubham_Student1 A JOIN Shubham_studentdetail1 B ON A.REC_ID = B.REC_ID
    JOIN Shubham_studentpresent1 C ON A.REC_ID = C.REC_ID
where (C.PRESENT BETWEEN 01 and 25) AND (MONTH_DISP = "JAN")
;


--Q-6 Print information for the student having charcter "r" at the third position of their name.
--	Fields: Name, Standard
--	Eg: It should print information for "Mira", "Gira" etc.
SELECT A.NAME, B.STANDARD
FROM Shubham_Student1 A JOIN Shubham_studentdetail1 B ON A.REC_ID = B.REC_ID
where A.NAME LIKE "__u%";


--Q-7 Print information for the student having "bhai" in their name. 
--Fields: Name, Standard
SELECT A.NAME, B.STANDARD
FROM Shubham_Student1 A LEFT JOIN Shubham_studentdetail1 B ON A.REC_ID = B.REC_ID
where A.NAME LIKE "%bhai%";


--Q-8 Print information for the student who do not have any presence in the college.
--	Fields: Name, Standard
SELECT A.NAME, B.STANDARD, C.PRESENT
FROM Shubham_Student1 A JOIN Shubham_studentdetail1 B ON A.REC_ID = B.REC_ID
    JOIN Shubham_studentpresent1 C ON A.REC_ID = C.REC_ID
where C.PRESENT = 02;



--Q-9 Write a query which will print name of each student, and his or her attendance report for current month.
--Fields : Name, Attendance Report for Current Month
--In "Attendance Report for Current Month" column
--if student has presence for that month then
--print "Present"
--else
--print "Not Present".


select a.name,
    case when b.present>0 then 'present'
ELSE "not present"
END AS "Attendance Report for Current Month"
from Shubham_Student1 as a
natural join Shubham_studentpresent1 as b
where b.MONTH_DISP=month
(curdate
())
group by a.name;


--Q-10 Execute following queries and evaluate the output by giving appropriate reason.
-- ==> It will be compare two two string.

--If string1 < string2, this function returns -1	
SELECT STRCMP('text', 'text2');
=>-1

--If string1 > string2, this function returns 1
SELECT STRCMP('text2', 'text');
=>1

--If string1 = string2, this function returns 0
SELECT STRCMP('text', 'text');
=> 0

--Q-11 Print the student information having average presence (in percentage) for Jan, Feb and March between 60 to 75.
--Fields: Name, Standard, Present


select a.name, b.standard, sum(c.present) AS "present"
from Shubham_Student1 as a
natural join Shubham_studentdetail1 as b
natural join Shubham_studentpresent1 as c group by  name
having sum
(c.present)*
(90/100) between 60 and 75



--Q-12 List information of the product having "Maximum Price" within date range 01-01-2006 to 15-01-2006	
SELECT A.NAME, MAX(B.PRICE)
FROM Shubham_product1 A
    LEFT JOIN Shubham_productprice1 B
    ON A.REC_ID = B.REC_ID
where EFF_DATE
"2006-01-01" BETWEEN "2006-01-15";
	