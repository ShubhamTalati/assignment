--Q-1 Print total number of boys and girls within a single record.
--	Fields : Boys, Girls

--	Required Output:
--	================
--	Boys	Girls
--	5	3

SELECT
COUNT(CASE WHEN FLAGSEX = "MALE" THEN "BOYS" END) AS "BOYS",
COUNT(CASE WHEN FLAGSEX = "FEMALE" THEN "GIRLS" END) AS "GIRLS"
FROM Shubham_studentdetail1;



--Q-2 Find total number of Hours for Boys and Girls. 
--	Fields : Gender, Present(Hrs)
--	Required Output:
--	================
--	Gender	Present(Hrs)
--	Boys	100
--	Girls	120

select a.flagsex as Gender,sum(b.hours) as 'present(hrs)'
from Shubham_studentdetail1 a
inner join Shubham_studenthours1 b
on a.rec_id=b.rec_id group by flagsex;




--Q-3 Find all latest prices for each code for each product.
--	Fields : Product Name, Code, Date, Price

--	Required Output:
--	================
--	Product Name	Code	Date		Price
--	Computer	COMP	2007-01-01	Rs. 24,000/-

select a.name,b.code,b.EFF_DATE,b.price
from Shubham_product1 a
natural join Shubham_productprice1 b
group by a.name having max(b.EFF_DATE) ;