create database stu;
use stu;

--TABLE 1:
use trainee;
create table Shubham_Student_Details
(
    NAME VARCHAR(30) PRIMARY KEY Not NULL,
    STANDARD VARCHAR(30) ,
    SEX VARCHAR(10),
    MONTHLY_PRESENT VARCHAR(10),
    DAILYHOURS VARCHAR(10)
);


insert into Shubham_Student_Details
Values("Shubham", "MCA", "MALE", "yes", 8),
    ("Maulik", "MSc-IT", "MALE", "Yes", 9),
    ("Dev", "10", "MALE", "No", 7),
    ("Kiara", "12", "FEMALE", "yes", 9),
    ("Soham", "MSc-IT", "MALE", "no", 9),
    ("Sapna", "6", "FEMALE", "yes", 5);


select *
from Shubham_Student_Details;


--TABLE 2:
create table SHUBHAM_PRODUCTS
(
    NAME VARCHAR(30) PRIMARY KEY NOT NULL,
    PRICE VARCHAR(20)
);

insert into SHUBHAM_PRODUCTS
VALUES
    ("Mobile", "Rs.10,000"),
    ("Laptop", "Rs.50,000"),
    ("Charger", "Rs.250"),
    ("Hands-free", "Rs.50"),
    ("Tv", "Rs.30,000");

select *
from SHUBHAM_PRODUCTS;



--TABLE 3:
create table SHUBHAM_MATERIALS
(
    NAME VARCHAR(30) PRIMARY KEY NOT NULL,
    PRICE VARCHAR(20),
    Effective_Date DATE
);

insert into SHUBHAM_MATERIALS
VALUES
    ("Mobile", "Rs.10,000", "2000-12-31"),
    ("Laptop", "Rs.50,000", "2023-02-18"),
    ("Charger", "Rs.250", "2022-08-09"),
    ("Hands-free", "Rs.50", "2020-11-29"),
    ("Tv", "Rs.30,000", "2019-09-17");

select *
from SHUBHAM_MATERIALS;

--Delete One Recored
Delete from  Shubham_Student_Details where NAME = "soham";

--Delete All Recoreds
Delete From SHUBHAM_PRODUCTS;

--Delete All Recoreds Without delete , USE TRUNCATE
TRUNCATE TABLE SHUBHAM_MATERIALS;

--Delete TABLE
DROP TABLE SHUBHAM_MATERIALS;
  