

--TABLE 1:
create table Shubham_Student
(
    REC_ID int PRIMARY KEY Not NULL,
    NAME VARCHAR(30)
);

DESC Shubham_Student;

insert into Shubham_Student
Values(1, "Shubham"),
    (2, "Maulik"),
    (3, "Dev"),
    (4, "Kiara"),
    (5, "Soham"),
    (6, "Sapna");

select *
from Shubham_Student;



--TABLE 2:
create table Shubham_studentdetail
(
    REC_ID int,
    STUDENT_ID int PRIMARY KEY Not NULL,
    STANDARD VARCHAR(30) ,
    FLAGSEX VARCHAR(10),
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student(REC_ID)
);
DESC Shubham_studentdetail;

insert into Shubham_studentdetail
Values(1, 101, "MCA", "MALE"),
    (2, 102, "MSc-IT", "MALE"),
    (3, 103, "10", "MALE"),
    (4, 104, "12", "FEMALE"),
    (5, 105, "MSc-IT", "MALE"),
    (6, 106, "6", "FEMALE");

SELECT *
FROM Shubham_studentdetail;




--TABLE 3:
create table Shubham_studentpresent
(
    REC_ID int,
    STUDENT_ID int,
    MONTH_DISP VARCHAR(10),
    PRESENT int(10),
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student(REC_ID),
    FOREIGN KEY(STUDENT_ID) REFERENCES Shubham_studentdetail(STUDENT_ID)
);

DESC Shubham_studentpresent;

insert into Shubham_studentpresent
Values(1, 101, "JAN", 20),
    (2, 102, "FEB", 15),
    (3, 103, "JAN", 02),
    (4, 104, "MARCH", 20),
    (5, 105, "OCT", 15),
    (6, 106, "AUG", 10);
SELECT *
FROM Shubham_studentpresent;


--TABLE 3:
create table Shubham_studenthours
(
    REC_ID int,
    STUDENT_ID int,
    DATEX DATE,
    HOURS int(10),
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student(REC_ID),
    FOREIGN KEY(STUDENT_ID) REFERENCES Shubham_studentdetail(STUDENT_ID)
);

DESC Shubham_studenthours;

insert into Shubham_studenthours
Values(1, 101, "2000-12-31", 10),
    (2, 102, "2023-02-18", 05),
    (3, 103, "2022-08-09", 08),
    (4, 104, "2020-11-29", 11),
    (5, 105, "2019-09-17", 10),
    (6, 106, "2022-08-09", 06);

insert into Shubham_studenthours
Values(1, 101, "2000-01-31", 10),
    (2, 102, "2023-05-18", 05),
    (3, 103, "2022-11-09", 01),
    (4, 104, "2020-12-29", 03),
    (5, 105, "2019-03-17", 06),
    (6, 106, "2022-04-09", 06);


SELECT *
FROM Shubham_studenthours;

--  Display following details for each student:
--   Name
--   Standard
--   Sex
--NOTE : The same above headers should be displayed in the query & apply sorting on Name.

SELECT A.NAME, B.STANDARD, B.FLAGSEX
FROM Shubham_Student A JOIN Shubham_studentdetail B ON (A.REC_ID = B.REC_ID)
ORDER BY A.NAME ASC;

--Find SUM of student hours.	Fields : Name, TotalHours
SELECT A.NAME, SUM(B.HOURS) AS "TotalHours"
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;

--Find Average Present of each student.Fields : Name, Present
SELECT A.NAME, AVG(B.HOURS) AS "Presentage"
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;

--Find Minimum present among all students.Fields : MinPresent

SELECT A.NAME, MIN(B.HOURS) AS "MinPresent"
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;

--Find Maximum present among all students.Fields : MaxPresent
SELECT A.NAME, MAX(B.HOURS) AS "MaxPresent"
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;

--Display fields like Name, Date, Hours from "studenthours" table where Date should be in following format :

--DD/MM/YY
SELECT A.NAME, DATE_FORMAT(B.DATEX, '%d/%m/%y') as "Date", B.HOURS
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;


--MM/DD/YY
SELECT A.NAME, DATE_FORMAT(B.DATEX, '%m/%d/%y') as "Date", B.HOURS
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;

--MM/DD/Day
SELECT A.NAME, DATE_FORMAT(B.DATEX, '%m/%d/%w') as "Date", B.HOURS
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;


--YYYY-MM-DD
SELECT A.NAME, DATE_FORMAT(B.DATEX, '%Y/%m/%d') as "Date", B.HOURS
FROM Shubham_Student A JOIN Shubham_studenthours B ON(A.REC_ID = B.REC_ID)
GROUP BY A.NAME;