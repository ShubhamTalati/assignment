	
--Table Used: -   newstudent (recid, surname, firstname, middlename, gender, admitdate, endeffdt)

create table SHUBHAM_NEW(

REC_ID INT PRIMARY KEY NOT NULL,
S_NAME VARCHAR(20),
F_NAME VARCHAR(20),
M_NAME VARCHAR(20),
GENDER VARCHAR(10),
ADMIT_DATE DATE,
END_EFFDT DATE

);

INSERT INTO SHUBHAM_NEW VALUES
(1,'TALATI','SHUBHAM','DIPAKBHAI','MALE', '2006-01-01', '2010-11-29'),
(2, 'PATEL', 'NAMAN','SURAJBHAI','MALE', '2010-11-21', '2021-02-13'),
(3, 'SHAH', 'KANUBHAI','MAGANLALA','MALE', '1997-12-06', '2015-07-14'),
(4, 'PATEL', 'HETAL','NARESHBHAI','FEMALE', '2006-01-01', '2018-12-28'),
(5, 'SHAH', 'RITU','HASHMUKHDAS','FEMALE', '2018-07-15', '2020-12-31'),
(6, 'PATEL', 'MKUNDANT','ISHVARLAL','MALE', '2001-06-19', '2022-08-04');


NOTE :	[I] Please specify the CREATE query for above table as well.
	[II] In all below queries, fetch and display "Name" field in this format :  
	"Surname Firstname Middlename".
	[III] "endeffdt" represents date on which a particular student record was deleted. Hence fetch only active student records from above table.

--Q-1	List out the information of students whose surname is "Shah".
SELECT * FROM SHUBHAM_NEW WHERE S_NAME = 'SHAH';

--Q-2	List out the information of all the Male students.
SELECT * FROM SHUBHAM_NEW WHERE GENDER = 'MALE';

--Q-3	List out the information of all the Female students, whose surname is "Patel" or have been admitted after than 1-Jan-2006.
SELECT * FROM SHUBHAM_NEW WHERE GENDER = 'FEMALE' AND (S_NAME = 'PATEL' OR ADMIT_DATE >= '2006-01-01');

--Q-4	List out the information of all the students whose second name ends with "Bhai".
SELECT * FROM SHUBHAM_NEW WHERE F_NAME LIKE '%BHAI%';

--Q-5	List out the information of all the students whose first name starts with "M" and 	second name has "ant".
SELECT * FROM SHUBHAM_NEW WHERE F_NAME LIKE 'M%' OR F_NAME LIKE '___%ANT';

--Q-6	List out the information of all the students whose surname has "c" in the third place.
SELECT * FROM SHUBHAM_NEW WHERE S_NAME LIKE '__A%';

--Q-7	List the name's of the all the students in "Ekta R. Patel" format.
SELECT concat(F_NAME,' ',SUBSTR(M_NAME,1,1),'. ',S_NAME)  AS FULLNAME FROM SHUBHAM_NEW;

--Q-8	List out First Name as well as its respective length for all the students.
SELECT F_NAME, LENGTH(F_NAME) AS 'RESPECTIVE LENGTH' FROM SHUBHAM_NEW;

--Q-9	Append the First Name with "bhai" for all the male students whose First Name does not 	contain "bhai".
UPDATE SHUBHAM_NEW SET F_NAME = concat(F_NAME, 'BHAI') WHERE F_NAME NOT LIKE '%BHAI';

--Q-10List out First Name of all the male students with "Mr." before the First Name.
SELECT *FROM SHUBHAM_NEW WHERE F_NAME LIKE "MR.%";

--Q-11	List out First Name of all the students which sounds like "Mira".
SELECT * FROM SHUBHAM_NEW WHERE F_NAME SOUNDS LIKE 'Mira' ;