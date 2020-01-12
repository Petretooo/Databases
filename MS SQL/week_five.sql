/*�������� ������� �� ���������� � ������ ����������, � ����� �� ���� ��������, ���� � ��������� �� �������� ���� ����������, ����� �� �������� � ���� ���������� > 1000. ��������� ��������� �� ���� ���������� ���������*/

SELECT NAME, SUM(QUANTITY) AS TOTAL

FROM PRODUCTS P JOIN ORDER_ITEMS OI

ON P.PRODUCT_ID = OI.PRODUCT_ID

GROUP BY NAME

HAVING SUM(QUANTITY) > 1000

ORDER BY 2 DESC

/*�������� ������� �� ����������� � ������� �� ������� ����� ���������*/

SELECT E.FNAME, E.LNAME, M.FNAME, M.LNAME

FROM EMPLOYEES E JOIN EMPLOYEES M

ON E.MANAGER_ID = M.EMPLOYEE_ID

/*�������� ������� �� ����������� � ������� �� ������� ����� ���������, ���� � ��������� �� �������� � �����������, ����� ����� ����� ���������*/

SELECT E.FNAME, E.LNAME, M.FNAME, M.LNAME

FROM EMPLOYEES E LEFT JOIN EMPLOYEES M

ON E.MANAGER_ID = M.EMPLOYEE_ID

/*�������� ������� �� �����������, ����� ��������� ������� ��-������ �� ��������� �� �������� Peter Hall*/

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

/*�������� ������� �� �����������, ����� ��������� ������� ��-������ �� ��������� �� ����� �� �����������, ����� ������ � ����� 100*/

SELECT FNAME, LNAME, SALARY

FROM EMPLOYEES

WHERE SALARY > ANY (SELECT SALARY

FROM EMPLOYEES

WHERE DEPARTMENT_ID = 100)

/*�������� ������� �� �����������, ����� ��������� ������� ��-������ �� ��������� �� ����� �� �����������, ����� ������ � ����� 100*/

SELECT FNAME, LNAME, SALARY

FROM EMPLOYEES

WHERE SALARY > ALL (SELECT SALARY

FROM EMPLOYEES

WHERE DEPARTMENT_ID = 100)

/*�������� ��-���� � ������ �� ������ �������, ����� �� ��������� ���� 12.04.2008*/

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

/*�������� ������� � ������ �� ����������� �� �����������, ���� �������� ������ � ���� 109*/

SELECT FNAME, LNAME, CONVERT(VARCHAR, HIRE_DATE, 109) AS DATE---------------------------------------������ �� �� ����� �� ������ CONVERT-----------------------------------------------

FROM EMPLOYEES

/*�������� �������, ������ �� ����������� � ������, � ����� � ��� �������� ����� ���� ��������*/

SELECT FNAME, LNAME, HIRE_DATE, DATENAME(MONTH, HIRE_DATE) AS MONTH_NAME

FROM EMPLOYEES

/*�������� ������� � ��������� �� ������ ���������, ����� ������� ������� � ������� �*/

SELECT FNAME + ' ' + LNAME

FROM EMPLOYEES

WHERE FNAME LIKE 'M%'

/*�������� ������� � ��������� �� ������ ���������, ����� ��� �������� � ������� l*/

SELECT FNAME + ' ' + LNAME

FROM EMPLOYEES

WHERE LNAME LIKE '%l'

/*�������� ������� � ��������� �� ������ ���������, ����� ������� ������� �� ������� � �� �������*/

SELECT FNAME + ' ' + LNAME

FROM EMPLOYEES

WHERE LNAME LIKE '%a%'

SELECT FNAME

FROM EMPLOYEES

UNION

SELECT FNAME

FROM CUSTOMERS
