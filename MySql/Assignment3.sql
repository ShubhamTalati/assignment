--TABLE 1:
create table Shubham_Student1
(
    REC_ID int PRIMARY KEY Not NULL,
    NAME VARCHAR(30)
);

DESC  ;

insert into Shubham_Student1
Values(1, "Shubham"),
    (2, "Maulik"),
    (3, "Anmol"),
    (4, "Kiara"),
    (5, "Soham"),
    (6, "Arohi");

select *
from Shubham_Student1;



--TABLE 2:
create table Shubham_studentdetail1
(
    REC_ID int,
    STUDENT_ID int PRIMARY KEY Not NULL,
    STANDARD VARCHAR(30) ,
    FLAGSEX VARCHAR(10),
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student1(REC_ID)
);
DESC Shubham_studentdetail1;

insert into Shubham_studentdetail1
Values(1, 101, "MCA", "MALE"),
    (2, 102, "MSc-IT", "MALE"),
    (3, 103, "10", "MALE"),
    (4, 104, "12", "FEMALE"),
    (5, 105, "MSc-IT", "MALE"),
    (6, 106, "6", "FEMALE");

SELECT *
FROM Shubham_studentdetail1;




--TABLE 3:
create table Shubham_studentpresent1
(
    REC_ID int,
    STUDENT_ID int,
    MONTH_DISP VARCHAR(10),
    PRESENT int(10),
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student1(REC_ID),
    FOREIGN KEY(STUDENT_ID) REFERENCES Shubham_studentdetail1(STUDENT_ID)
);

DESC Shubham_studentpresent1;

insert into Shubham_studentpresent1
Values(1, 101, "JAN", 20),
    (2, 102, "FEB", 15),
    (3, 103, "JAN", 02),
    (4, 104, "MARCH", 20),
    (5, 105, "OCT", 15),
    (6, 106, "AUG", 10);
SELECT *
FROM Shubham_studentpresent1;


--TABLE 3:
create table Shubham_studenthours1
(
    REC_ID int,
    STUDENT_ID int,
    DATEX DATE,
    HOURS int(10),
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student1(REC_ID),
    FOREIGN KEY(STUDENT_ID) REFERENCES Shubham_studentdetail1(STUDENT_ID)
);

DESC Shubham_studenthours1;

insert into Shubham_studenthours1
Values(1, 101, "2000-12-31", 10),
    (2, 102, "2023-02-18", 03),
    (3, 103, "2022-08-09", 08),
    (4, 104, "2020-11-29", 11),
    (5, 105, "2019-09-17", 02),
    (6, 106, "2022-08-09", 02);

SELECT *
FROM Shubham_studenthours1;

--TABLE 4:
create table Shubham_product1
(
    REC_ID int,
    NAME VARCHAR(30),
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student1(REC_ID)

);

insert into Shubham_product1
Values(1, "Shubham"),
    (2, "Maulik"),
    (3, "Dev"),
    (4, "Kiara"),
    (5, "Soham"),
    (6, "Sapna");

SELECT *
FROM Shubham_product1;


--TABLE 5:
create table Shubham_productprice1
(
    REC_ID int,
    PRODUCT_ID int PRIMARY KEY NOT NULL,
    CODE VARCHAR(20),
    EFF_DATE DATE,
    PRICE FLOAT,
    FOREIGN KEY(REC_ID) REFERENCES Shubham_Student1(REC_ID)

);

insert into Shubham_productprice1
Values(1, 1001, "AB", "2023-12-31", 25.00),
    (2, 1002, "AA", "2020-01-28", 300.00),
    (3, 1003, "AC", "2010-10-12", 210.74),
    (4, 1004, "AB", "2021-07-18", 100.12),
    (5, 1005, "AA", "2022-03-20", 25.00),
    (6, 1006, "AD", "2020-01-28", 27.19);


SELECT *
FROM Shubham_productprice1;



--Change value of 'student.name' with any other value for student.recid = 3.
update Shubham_Student1 set NAME = "Aadarsh" where REC_ID = 3;


--Update all "student" records to append character " A." as the middle name for "student.name" field.
update Shubham_Student1 set CONCAT(NAME,'A'
)as 'M_NAME' from  Shubham_Student1;


--select * CONCAT(NAME,'A')as 'M_NAME' from  Shubham_Student1;
UPDATE Shubham_Student1 SET NAME = CONCAT(NAME,'A');

--Remove First Char in every row
update Shubham_Student1 set NAME=substr(NAME,-2);

--Remove Last Char where name is A
update Shubham_Student1 SET NAME = SUBSTRING(NAME, 1, CHAR_LENGTH(NAME) - 1)where NAME like '%A';


--Update all "productprice" records to add 25.00 in "price" field.
Update Shubham_productprice1 set PRICE = PRICE + 25.00;
SELECT *
FROM Shubham_productprice1;


--Update "product" table to add "A" in 'product.name' where related 'product.code = AB'.
UPDATE Shubham_product1 SET NAME = CONCAT(NAME, 'A') WHERE REC_ID IN(SELECT REC_ID
From Shubham_productprice1
WHERE CODE = 'AB');


--Update all "studentpresent" records to add 2 in 'studentpresentpresent' where related 'studenthours.hours >= 8'.
UPDATE Shubham_studentpresent1 SET present = present + 2 WHERE REC_ID IN (SELECT REC_ID
FROM Shubham_studenthours1
WHERE hours >= 8);

--Remove a record from "product" table where 'product.recid = 5'
DELETE from Shubham_product1 where REC_ID = 5;


--Remove all "student" records where the 'student.name' starts with character "A".
DELETE FROM Shubham_Student1 where NAME LIKE "A%";


--Remove all "studentdetails" record where related 'studenthours.hours <= 3'.
DELETE FROM Shubham_studentdetail1 where REC_ID IN(SELECT REC_ID
FROM Shubham_studenthours1
WHERE hours <= 8);







