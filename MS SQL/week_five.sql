/*Изведете имената на продуктите и общото количество, в което са били поръчани, нека в резултата да участват само продуктите, които са поръчани в общо количество > 1000. Подредете резултата по общо количество низходящо*/

SELECT NAME, SUM(QUANTITY) AS TOTAL

FROM PRODUCTS P JOIN ORDER_ITEMS OI

ON P.PRODUCT_ID = OI.PRODUCT_ID

GROUP BY NAME

HAVING SUM(QUANTITY) > 1000

ORDER BY 2 DESC

/*Изведете имената на служителите и имената на техните преки началници*/

SELECT E.FNAME, E.LNAME, M.FNAME, M.LNAME

FROM EMPLOYEES E JOIN EMPLOYEES M

ON E.MANAGER_ID = M.EMPLOYEE_ID

/*Изведете имената на служителите и имената на техните преки началници, нека в резултата да участват и служителите, които нямат преки началници*/

SELECT E.FNAME, E.LNAME, M.FNAME, M.LNAME

FROM EMPLOYEES E LEFT JOIN EMPLOYEES M

ON E.MANAGER_ID = M.EMPLOYEE_ID

/*Изведете имената на служителите, които получават заплата по-голяма от заплатата на служител Peter Hall*/

SELECT FNAME, LNAME
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE FNAME = 'Peter' AND LNAME = 'Hall')



SELECT FNAME, LNAME

FROM EMPLOYEES

WHERE SALARY > (SELECT SALARY

					FROM EMPLOYEES

					WHERE FNAME ='Peter' AND LNAME = 'Hall')

SELECT E.FNAME, E.LNAME

FROM EMPLOYEES E JOIN EMPLOYEES PH

ON E.SALARY > PH.SALARY

WHERE PH.FNAME ='Peter' AND PH.LNAME = 'Hall'

SELECT E.FNAME, E.LNAME

FROM EMPLOYEES E, EMPLOYEES PH

WHERE E.SALARY > PH.SALARY AND PH.FNAME ='Peter' AND PH.LNAME = 'Hall'

/*Изведете имената на служителите, които получават заплата по-голяна от заплатата на някой от служителите, който работи в отдел 100*/

SELECT FNAME, LNAME, SALARY

FROM EMPLOYEES

WHERE SALARY > ANY (SELECT SALARY

FROM EMPLOYEES

WHERE DEPARTMENT_ID = 100)

/*Изведете имената на служителите, които получават заплата по-голяна от заплатата на всеки от служителите, който работи в отдел 100*/

SELECT FNAME, LNAME, SALARY

FROM EMPLOYEES

WHERE SALARY > ALL (SELECT SALARY

FROM EMPLOYEES

WHERE DEPARTMENT_ID = 100)

/*Изведете ид-тата и датите на всички поръчки, които са направени след 12.04.2008*/

SELECT ORDER_ID, ORDER_DATE

FROM ORDERS

WHERE ORDER_DATE > '12.04.2008'

ORDER BY ORDER_DATE

SELECT ORDER_ID, ORDER_DATE

FROM ORDERS

WHERE ORDER_DATE > CAST('12.04.2008' AS DATETIME)

ORDER BY 2

SELECT ORDER_ID, ORDER_DATE

FROM ORDERS

WHERE ORDER_DATE > CONVERT(DATETIME, '12.04.2008', 104)

ORDER BY 2

/*Изведете имената и датите на назначаване на служителите, като изведете датите в стил 109*/

SELECT FNAME, LNAME, CONVERT(VARCHAR, HIRE_DATE, 109) AS DATE---------------------------------------ВИНАГИ ЛИ ЗА МОДЕЛ НИ ТРЯБВА CONVERT-----------------------------------------------

FROM EMPLOYEES

/*Изведете имената, датите на назначаване и месаца, в който е бил назначен всеки един служител*/

SELECT FNAME, LNAME, HIRE_DATE, DATENAME(MONTH, HIRE_DATE) AS MONTH_NAME

FROM EMPLOYEES

/*Изведете имената и фамилиите на всички служители, чиято фамилия замочва с буквата М*/

SELECT FNAME + ' ' + LNAME

FROM EMPLOYEES

WHERE FNAME LIKE 'M%'

/*Изведете имената и фамилиите на всички служители, чието име завършва с буквата l*/

SELECT FNAME + ' ' + LNAME

FROM EMPLOYEES

WHERE LNAME LIKE '%l'

/*Изведете имената и фамилиите на всички служители, чиято фамилия съдържа по буквата а по средата*/

SELECT FNAME + ' ' + LNAME

FROM EMPLOYEES

WHERE LNAME LIKE '%a%'

SELECT FNAME

FROM EMPLOYEES

UNION

SELECT FNAME

FROM CUSTOMERS
