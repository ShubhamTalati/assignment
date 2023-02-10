--Q-1 Write a query which will output 123,456.78(as string datatype) for the input value of 123456.77912.
=> SELECT FORMAT(123456.77912, 2);

--Q-2 What will be the output of following query : (Explain the result)
 --	SELECT INSERT("newyork", 4, 4, "jercy");
=> ANS: 'newyjercy'
=>IT WILL BE FIRST FOUR WORD THAN JERCY AND THEN AFTER NEWY WORD DISPLAY.


--Q-3 Write a query to find position of letter 'd' in the string 'abcdefgh'.
=> SELECT POSITION('d' IN 'abcdefgh');

--Q-4 Write a query which will output "hello world" for input string "Hello World".
=> select LCASE('HELLO WORLD');
select LOWER('HELLO WORLD');

--Q-5 Write a query to find 3 characters from the left of any given string.
=> SELECT LEFT('SHUBHAM TALATI',3)

--Q-6 Write a query to find 3 characters from the right of any given string.
=> SELECT RIGHT('SHUBHAM TALATI',3)

--Q-7 Write a query which will return length of any given string.
=>SELECT LENGTH('SHUBHAM TALATI');

--Q-8 Write a query which will output "------abcd" for input string "abcd".
=>SELECT LPAD('abcd',10,'-');


--Q-9 Write a query which will output "abcd......" for input string "abcd".
=>SELECT RPAD('abcd',10,'.');

--Q-10 Write a query which will output "abcd  " for input string "  abcd  ".
=>SELECT TRIM('  abcd   ');

--Q-11 Write a query which will output "  abcd" for input string "  abcd  ".
=>SELECT RTRIM('    abcd     ');

--Q-12 Write a query which will output "is" for input string "The weather is very nice.".
=>SELECT SUBSTRING("The weather is very nice.",13,3);

--Q-13 Write a query which will output "hellohellohello" for input string "hello".
=>SELECT REPEAT('hello', 3);

--Q-14 Write a query which will output ".ecin yrev si rehtaew ehT" for input string "The weather is very nice.".
=>SELECT REVERSE('The weather is very nice.');

--Q-15 Explain the use of function SOUNDEX().
=>SOUNDEX() function returns a four- character code to evaluate the similarity of two expressions.
EX: SELECT SOUNDEX('Shubham');


--Q-16 Write a query which will output "is very nice." for input string "The weather is very nice.".
=>SELECT SUBSTRING("The weather is very nice.",13);

--Q-17 Explain the use of TRIM function.
=>It Will Be Remove leading and trailing spaces from a string:
EX:SELECT TRIM('  shubham   ');