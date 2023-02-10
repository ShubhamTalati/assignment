--Implement following queries:

--Q-1 Write a query which will return value '5.0' for input value of '4.1' as well as '4.8'.
SELECT CEIL(4.1);
SELECT CEIL(4.8);



--Q-2 Write a query which will return value '4.0' for input value of '4.1' as well as '4.8'.
SELECT FLOOR(4.1);
SELECT FLOOR(4.8);

--Q-3 What will be the output of following query:
	SELECT MOD(11,3);
=>2
	SELECT 11 % 3;
=>2

--Q-4 Write a query to find 2 raise to power 3.
SELECT POWER(2,3);


--Q-5 Write a query to generate random number using MySQL function.
SELECT RAND();

--Q-6 Write a query to supply seed to the function generating random number.
SELECT RAND(1),RAND(),RAND();


--Q-7 Write a query which will return value '4' for '3.5' and '3' for '3.4'.
SELECT CEIL(3.5);
SELECT FLOOR(3.4);


--Q-8 Write a query so that output will be '15.75' for the value '15.7463847'.
SELECT ROUND(15.7463847,2);


--Q-9 Write a query to find square root of given value. What will be the output if the provided value is negative?
SELECT SQRT(36);
SELECT SQRT(36); => NULL

--Q-10 Write a query so that output will be '15.74' for the value '15.7463847'.
SELECT  TRUNCATE(15.7463847,2);

--Q-11 Write a query which will output '15.2500' for provided value '15.25'.
SELECT ROUND(15.25,4);



-   Tables Used:=
    
    -	student  (recid, name)

    -   studentdetail (recid, studentid, standard, flagsex)

    -   studentpresent (recid, studentid, month, present)

    -   studenthours (recid, studentid, datex, hours)

    -   product (recid, name)

    -   productprice (recid, productid, code, effdt, price)


	--Write a query to display all the product names with code in bracket in one column and 2 decimal significant price in second column, 
	--e.g. : MySql book (MS09210) | 10.99
--Here 'MySql book' is product name and 'MS09210' is the product code while '10.99' is the 2 decimal significant price.

select concat(a.name," "," (",b.code,") "," "," | "," ",round(b.price,2))as data
from Shubham_product1 a
natural join Shubham_productprice1 b;
	
--Write a query to display following information separated by comma in a single row for the students who have atleast one 'a' in their name. 
--The column heading should be STUDENTINFO.
--student name, standard, flag_sex
		
select concat(a.name,",", b.standard ,",", b.flagsex)as STUDENTINFO
from Shubham_studentdetail1 b
natural join Shubham_Student1 a
where a.name like '%a%';