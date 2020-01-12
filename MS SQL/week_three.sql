/*�������� ������ ������ � ������ ������ �� ��������� ��� �����������*/

SELECT *

FROM EMPLOYEES

/*�������� ������ ���������, ����� ��������� ������� > 10000*/

SELECT *

FROM EMPLOYEES

WHERE SALARY > 10000

/*�������� ������� � ����������� �� ������ ���������*/

SELECT FNAME, LNAME, MANAGER_ID

FROM EMPLOYEES

--�������� �����������, ����� ����� ���������

SELECT FNAME, LNAME, MANAGER_ID

FROM EMPLOYEES

WHERE MANAGER_ID IS NOT NULL

/*�������� ������� � ������ �� ������ ��������, ����� ���� ���� >= 500 � <=1000*/

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE >= 500 AND PRICE <= 1000

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE BETWEEN 500 AND 1000

/*�������� ������� � ������ �� ������ ��������, ����� ���� ���� >= 500 � <=1000 ��������� �� �������� ��� ������ ������*/

--��������� DESC

--��������� ASC

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE >= 500 AND PRICE <= 1000

ORDER BY PRICE ASC

SELECT NAME, PRICE

FROM PRODUCTS

WHERE PRICE BETWEEN 500 AND 1000

ORDER BY 2

/*�������� ���� ��������� ��� �������*/

SELECT COUNT(EMPLOYEE_ID) AS COUNT_EMP

FROM EMPLOYEES

SELECT COUNT(*) AS COUNT_EMP

FROM EMPLOYEES

SELECT * FROM EMPLOYEES

SELECT COUNT(MANAGER_ID) AS COUNT_MANAGER

FROM EMPLOYEES

SELECT COUNT(EMPLOYEE_ID) AS EMP, COUNT(*) AS EMP_2, COUNT(DEPARTMENT_ID) AS DEP

FROM EMPLOYEES

/*�������� ������ �� ��������� � ����� 50*/

SELECT SUM(SALARY) AS TOTAL

FROM EMPLOYEES

WHERE DEPARTMENT_ID = 50

/*�������� ������, �� ����� � ��� ��������

������� ������� ��� ������� � ����������� ��������*/

SELECT FNAME, LNAME, HIRE_DATE

FROM EMPLOYEES

WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE)

FROM EMPLOYEES)

SELECT TOP 1 FNAME, LNAME, HIRE_DATE

FROM EMPLOYEES

ORDER BY 3

/*������� ������, �� ����� � �������� ���������� �������� ��� ������� � ���������� �������*/

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

/*�������� ���������� �� ������� 2355*/

SELECT SUM(UNIT_PRICE * QUANTITY) AS TOTAL

FROM ORDER_ITEMS

WHERE ORDER_ID = 2355

/*�������� �������� � ���������� �� ������ �������*/

SELECT ORDER_ID, SUM(UNIT_PRICE * QUANTITY) AS TOTAL

FROM ORDER_ITEMS

GROUP BY ORDER_ID

/*�������� �������� �� ��������, ���� ��������� � ��� � ����������� ������ ������� */

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS COUNT_EMP, AVG(SALARY) AS AVG_SALARY

FROM EMPLOYEES

GROUP BY DEPARTMENT_ID

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS COUNT_EMP, AVG(SALARY) AS AVG_SALARY

FROM EMPLOYEES

WHERE DEPARTMENT_ID IS NOT NULL

GROUP BY DEPARTMENT_ID

/*�������� ������ �� ���������� � ������ ����������, � ����� �� ���� ��������*/

SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL

FROM ORDER_ITEMS

GROUP BY PRODUCT_ID

ORDER BY 2 DESC