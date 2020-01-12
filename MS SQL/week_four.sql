/*Изведете ид-тата на длъжностите и средната работна заплата за тях*/
SELECT JOB_ID, AVG(SALARY) AS AVG_SALARY

FROM EMPLOYEES

GROUP BY JOB_ID

/*Изведете номерата на клиентите и броя поръчки, които са направили, подредете резултата по брой поръчки низходящо*/

SELECT CUSTOMER_ID, COUNT(ORDER_ID) AS TOTAL

FROM ORDERS

GROUP BY CUSTOMER_ID

ORDER BY 2 DESC

SELECT * FROM REGIONS

SELECT * FROM COUNTRIES

/*Изведете имената на държавите и имената на регионите, в които се намират*/

SELECT R.NAME AS REGION_NAME, C.NAME AS COUNTRY_NAME

FROM REGIONS R 

JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

SELECT R.NAME AS REGION_NAME, C.NAME AS COUNTRY_NAME

FROM REGIONS R, COUNTRIES C

WHERE R.REGION_ID = C.REGION_ID

/*Изведете имената на държавите и имената на регионите, в които се намират, нека в резултата да участват регионите, в които няма държави*/

SELECT R.NAME, C.NAME

FROM REGIONS R LEFT JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

SELECT R.NAME, C.NAME

FROM COUNTRIES C RIGHT JOIN REGIONS R

ON R.REGION_ID = C.REGION_ID

/*Изведете имената на държавите и имената на регионите, в които се намират, нека в резултата участват държавите, които нямат региони*/

SELECT R.NAME, C.NAME

FROM REGIONS R RIGHT JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

SELECT R.NAME, C.NAME

FROM COUNTRIES C LEFT JOIN REGIONS R

ON R.REGION_ID = C.REGION_ID

/*Изведете имената на държавите и имената на регионите, в които се намират, нека в резултата участват държавите, които нямат региони и регионите, в които няма държави*/

SELECT R.NAME, C.NAME

FROM REGIONS R FULL OUTER JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

/*Изведете имената на клиентите и броя поръчки, които са правили, подредете резултата по брой поръчки низходящо*/

SELECT FNAME, LNAME, COUNT(ORDER_ID) AS COUNT_ORDER

FROM CUSTOMERS C JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

GROUP BY C.CUSTOMER_ID,FNAME, LNAME

ORDER BY COUNT_ORDER DESC

/*Изведете имената на клиентите и броя поръчки, които са направили, нека в резултата да участват и клиентите, които не са правили поръчки до момента, подредете по брой поръчки низходящо*/

SELECT C.CUSTOMER_ID, FNAME + ' ' + LNAME AS NAME, COUNT(ORDER_ID) AS ORDER_COUNT

FROM CUSTOMERS C LEFT JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

GROUP BY C.CUSTOMER_ID, FNAME + ' ' + LNAME

ORDER BY ORDER_COUNT DESC

/*Изведете имената на служителите и наименованието на длъжността им*/

SELECT FNAME, LNAME, JOB_TITLE

FROM EMPLOYEES E JOIN JOBS J

ON E.JOB_ID = J.JOB_ID

/*Изведете имената на клиентите, имената на държавите, в които се намират и имената на регионите на съответните държави*/

SELECT FNAME, LNAME, CO.NAME, R.NAME

FROM CUSTOMERS C 

JOIN COUNTRIES CO

ON C.COUNTRY_ID = CO.COUNTRY_ID

JOIN REGIONS R

ON R.REGION_ID = CO.REGION_ID

/*Изведете имената на клиентите и общата стойност на поръчките, които са направили*/

SELECT FNAME, LNAME, SUM(UNIT_PRICE*QUANTITY) AS TOTAL

FROM CUSTOMERS C JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

JOIN ORDER_ITEMS OI

ON O.ORDER_ID = OI.ORDER_ID

GROUP BY FNAME, LNAME

ORDER BY TOTAL

/*Изведете имената на клиентите и общата стойност на поръчките, които са направили, нека в резултата да участват само клиентите с обща стойност на поръчките над 10000*/

SELECT FNAME, LNAME, SUM(UNIT_PRICE*QUANTITY) AS TOTAL

FROM CUSTOMERS C JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

JOIN ORDER_ITEMS OI

ON O.ORDER_ID = OI.ORDER_ID

GROUP BY FNAME, LNAME

HAVING SUM(UNIT_PRICE*QUANTITY) > 10000

ORDER BY TOTAL

/*Изведете имената на отделите и броя служители в тях, нека в резултата участват само отдели с повече от 5 назначени служители*/

SELECT NAME, COUNT(EMPLOYEE_ID) AS NUM_EMP

FROM DEPARTMENTS D JOIN EMPLOYEES E

ON D.DEPARTMENT_ID = E.DEPARTMENT_ID

GROUP BY NAME

HAVING COUNT(EMPLOYEE_ID) > 5

ORDER BY 2 DESC

/*Изведете имената на отделите и броя служители в тях, нека в резултата участват само отдели с повече от 5 назначени служители и отдели, които се намират в държавите US или DE*/



SELECT d.NAME, COUNT(e.EMPLOYEE_ID) AS count_employees
FROM DEPARTMENTS d
JOIN EMPLOYEES e
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE COUNTRY_ID = 'US' OR COUNTRY_ID = 'DE'
GROUP BY d.NAME
HAVING COUNT(e.EMPLOYEE_ID) > 5
ORDER BY d.NAME













SELECT NAME, COUNT(EMPLOYEE_ID) AS NUM_EMP, D.COUNTRY_ID

FROM DEPARTMENTS D JOIN EMPLOYEES E

ON D.DEPARTMENT_ID = E.DEPARTMENT_ID

WHERE D.COUNTRY_ID = 'US' OR D.COUNTRY_ID = 'DE'

GROUP BY NAME, D.COUNTRY_ID

HAVING COUNT(EMPLOYEE_ID) > 5

ORDER BY 2 DESC