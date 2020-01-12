/*Изведете всички колони и всички редове от таблицата със служителите*/

SELECT *

FROM EMPLOYEES

/*Изведете всички служители, които получават заплата > 10000*/

SELECT *

FROM EMPLOYEES

WHERE SALARY > 10000

/*Изведете имената и мениджърите на всички служители*/

SELECT FNAME, LNAME, MANAGER_ID

FROM EMPLOYEES

--ПРЕМАХВА СЛУЖИТЕЛИТЕ, КОИТО НЯМАТ МЕНИДЖЪРИ

SELECT FNAME, LNAME, MANAGER_ID

FROM EMPLOYEES

WHERE MANAGER_ID IS NOT NULL

/*Изведете имената и цените на всички продукти, които имат цена >= 500 и <=1000*/

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE >= 500 AND PRICE <= 1000

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE BETWEEN 500 AND 1000

/*Изведете имената и цените на всички продукти, които имат цена >= 500 и <=1000 подредени по възходящ ред спрямо цената*/

--низходящо DESC

--възходящо ASC

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE >= 500 AND PRICE <= 1000

ORDER BY PRICE ASC

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE BETWEEN 500 AND 1000

ORDER BY 2

/*Изведете броя служители във фирмата*/

SELECT COUNT(EMPLOYEE_ID) AS COUNT_EMP

FROM EMPLOYEES

SELECT COUNT(*) AS COUNT_EMP

FROM EMPLOYEES

SELECT * FROM EMPLOYEES

SELECT COUNT(MANAGER_ID) AS COUNT_MANAGER

FROM EMPLOYEES

SELECT COUNT(EMPLOYEE_ID) AS EMP, COUNT(*) AS EMP_2, COUNT(DEPARTMENT_ID) AS DEP

FROM EMPLOYEES

/*Изведете сумата на заплатите в отдел 50*/

SELECT SUM(SALARY) AS TOTAL

FROM EMPLOYEES

WHERE DEPARTMENT_ID = 50

/*Изведете датата, на която е бил назначен

първият слжител във фирмата и съответният служител*/

SELECT FNAME, LNAME, HIRE_DATE

FROM EMPLOYEES

WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE)

FROM EMPLOYEES)

SELECT TOP 1 FNAME, LNAME, HIRE_DATE

FROM EMPLOYEES

ORDER BY 3

/*Изведет датата, на която е назначен последният служител във фирмата и съответния служите*/

SELECT FNAME, LNAME, HIRE_DATE

FROM EMPLOYEES

WHERE HIRE_DATE = (SELECT MAX(HIRE_DATE)

FROM EMPLOYEES)

SELECT TOP 1 FNAME, LNAME, HIRE_DATE

FROM EMPLOYEES

ORDER BY 3 DESC

SELECT TOP 1 WITH TIES FNAME, LNAME, HIRE_DATE-------------------------------------ties-------------------------------------------------------------

FROM EMPLOYEES

ORDER BY 3 DESC

/*Изведете стойността на поръчка 2355*/

SELECT SUM(UNIT_PRICE * QUANTITY) AS TOTAL

FROM ORDER_ITEMS

WHERE ORDER_ID = 2355

/*Изведете номерата и стойността на всияки поръчки*/

SELECT ORDER_ID, SUM(UNIT_PRICE * QUANTITY) AS TOTAL

FROM ORDER_ITEMS

GROUP BY ORDER_ID

/*Изведете номерата на отделите, броя служители в тях и съответната средна заплата */

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS COUNT_EMP, AVG(SALARY) AS AVG_SALARY

FROM EMPLOYEES

GROUP BY DEPARTMENT_ID

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS COUNT_EMP, AVG(SALARY) AS AVG_SALARY

FROM EMPLOYEES

WHERE DEPARTMENT_ID IS NOT NULL

GROUP BY DEPARTMENT_ID

/*Изведете номера на продуктите и общото количество, в което са били поръчани*/

SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL

FROM ORDER_ITEMS

GROUP BY PRODUCT_ID

ORDER BY 2 DESC