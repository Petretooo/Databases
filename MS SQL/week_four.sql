/*�������� ��-���� �� ����������� � �������� ������� ������� �� ���*/
SELECT JOB_ID, AVG(SALARY) AS AVG_SALARY

FROM EMPLOYEES

GROUP BY JOB_ID

/*�������� �������� �� ��������� � ���� �������, ����� �� ���������, ��������� ��������� �� ���� ������� ���������*/

SELECT CUSTOMER_ID, COUNT(ORDER_ID) AS TOTAL

FROM ORDERS

GROUP BY CUSTOMER_ID

ORDER BY 2 DESC

SELECT * FROM REGIONS

SELECT * FROM COUNTRIES

/*�������� ������� �� ��������� � ������� �� ���������, � ����� �� �������*/

SELECT R.NAME AS REGION_NAME, C.NAME AS COUNTRY_NAME

FROM REGIONS R 

JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

SELECT R.NAME AS REGION_NAME, C.NAME AS COUNTRY_NAME

FROM REGIONS R, COUNTRIES C

WHERE R.REGION_ID = C.REGION_ID

/*�������� ������� �� ��������� � ������� �� ���������, � ����� �� �������, ���� � ��������� �� �������� ���������, � ����� ���� �������*/

SELECT R.NAME, C.NAME

FROM REGIONS R LEFT JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

SELECT R.NAME, C.NAME

FROM COUNTRIES C RIGHT JOIN REGIONS R

ON R.REGION_ID = C.REGION_ID

/*�������� ������� �� ��������� � ������� �� ���������, � ����� �� �������, ���� � ��������� �������� ���������, ����� ����� �������*/

SELECT R.NAME, C.NAME

FROM REGIONS R RIGHT JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

SELECT R.NAME, C.NAME

FROM COUNTRIES C LEFT JOIN REGIONS R

ON R.REGION_ID = C.REGION_ID

/*�������� ������� �� ��������� � ������� �� ���������, � ����� �� �������, ���� � ��������� �������� ���������, ����� ����� ������� � ���������, � ����� ���� �������*/

SELECT R.NAME, C.NAME

FROM REGIONS R FULL OUTER JOIN COUNTRIES C

ON R.REGION_ID = C.REGION_ID

/*�������� ������� �� ��������� � ���� �������, ����� �� �������, ��������� ��������� �� ���� ������� ���������*/

SELECT FNAME, LNAME, COUNT(ORDER_ID) AS COUNT_ORDER

FROM CUSTOMERS C JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

GROUP BY C.CUSTOMER_ID,FNAME, LNAME

ORDER BY COUNT_ORDER DESC

/*�������� ������� �� ��������� � ���� �������, ����� �� ���������, ���� � ��������� �� �������� � ���������, ����� �� �� ������� ������� �� �������, ��������� �� ���� ������� ���������*/

SELECT C.CUSTOMER_ID, FNAME + ' ' + LNAME AS NAME, COUNT(ORDER_ID) AS ORDER_COUNT

FROM CUSTOMERS C LEFT JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

GROUP BY C.CUSTOMER_ID, FNAME + ' ' + LNAME

ORDER BY ORDER_COUNT DESC

/*�������� ������� �� ����������� � �������������� �� ���������� ��*/

SELECT FNAME, LNAME, JOB_TITLE

FROM EMPLOYEES E JOIN JOBS J

ON E.JOB_ID = J.JOB_ID

/*�������� ������� �� ���������, ������� �� ���������, � ����� �� ������� � ������� �� ��������� �� ����������� �������*/

SELECT FNAME, LNAME, CO.NAME, R.NAME

FROM CUSTOMERS C 

JOIN COUNTRIES CO

ON C.COUNTRY_ID = CO.COUNTRY_ID

JOIN REGIONS R

ON R.REGION_ID = CO.REGION_ID

/*�������� ������� �� ��������� � ������ �������� �� ���������, ����� �� ���������*/

SELECT FNAME, LNAME, SUM(UNIT_PRICE*QUANTITY) AS TOTAL

FROM CUSTOMERS C JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

JOIN ORDER_ITEMS OI

ON O.ORDER_ID = OI.ORDER_ID

GROUP BY FNAME, LNAME

ORDER BY TOTAL

/*�������� ������� �� ��������� � ������ �������� �� ���������, ����� �� ���������, ���� � ��������� �� �������� ���� ��������� � ���� �������� �� ��������� ��� 10000*/

SELECT FNAME, LNAME, SUM(UNIT_PRICE*QUANTITY) AS TOTAL

FROM CUSTOMERS C JOIN ORDERS O

ON C.CUSTOMER_ID = O.CUSTOMER_ID

JOIN ORDER_ITEMS OI

ON O.ORDER_ID = OI.ORDER_ID

GROUP BY FNAME, LNAME

HAVING SUM(UNIT_PRICE*QUANTITY) > 10000

ORDER BY TOTAL

/*�������� ������� �� �������� � ���� ��������� � ���, ���� � ��������� �������� ���� ������ � ������ �� 5 ��������� ���������*/

SELECT NAME, COUNT(EMPLOYEE_ID) AS NUM_EMP

FROM DEPARTMENTS D JOIN EMPLOYEES E

ON D.DEPARTMENT_ID = E.DEPARTMENT_ID

GROUP BY NAME

HAVING COUNT(EMPLOYEE_ID) > 5

ORDER BY 2 DESC

/*�������� ������� �� �������� � ���� ��������� � ���, ���� � ��������� �������� ���� ������ � ������ �� 5 ��������� ��������� � ������, ����� �� ������� � ��������� US ��� DE*/



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