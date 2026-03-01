-- Single Table Assignments

-- 1. Find the employee number for employees named MARTIN.
SELECT employee_number
FROM employees
WHERE employee_name = 'MARTIN';


-- 2. Find the employee(s) with a salary greater than 1500.
SELECT *
FROM employees
WHERE salary > 1500;

-- 3. List the names of salesmen that earn more than 1300.
SELECT employee_name
FROM employees
WHERE job_title = 'SALESMAN' AND salary > 1300;

-- 4. List the names of employees that are not salesmen.
SELECT employee_name
FROM employees
WHERE job_title <> 'SALESMAN';

-- 5. List the names of all clerks together with their salary with a deduction of 10%.
SELECT employee_name, salary * 0.9
FROM employees
WHERE job_title = 'CLERK';

-- 6. Find the name of employees hired before May 1981.
SELECT employee_name
FROM employees
WHERE hire_date < '1981-05-01';

-- 7. List employees sorted by salary in descending order (i.e. highest salary first).
SELECT *
FROM employees
ORDER BY salary DESC;

-- 8. List departments sorted by location.
SELECT *
FROM departments
ORDER BY office_location;

-- 9. Find name of the department located in New York.
SELECT department_name
FROM departments
WHERE office_location = 'NEW YORK';

-- 10. You have proven your worth at the company. Your colleague comes to you trying to remember what's-his-name. It starts with a J and ends with S. Can you help her?
SELECT employee_name
FROM employees
WHERE employee_name LIKE 'J%S';

-- 11. Maybe that wasn't helpful. "Oh yeah, I remember now!" they say and tell you that he is a manager.
SELECT employee_name
FROM employees
WHERE employee_name LIKE 'J%S' AND job_title = 'MANAGER';

-- 12. How many employees are there in each department?

SELECT department_number, COUNT(*)
FROM employees
GROUP BY department_number;

-- Aggregate functions

-- 1. List the number of employees.

SELECT COUNT(*) AS Total_employees
FROM employees;

-- 2. List the sum of all salaries (excluding commission which are bonuses added to the base salaries).

SELECT SUM(salary) AS Total_Salary
FROM employees;

-- 3. List the average salary for employees in department 20.

SELECT AVG(salary) AS Average_Salary
FROM employees
WHERE department_number = 20;

-- 4. List the unique job titles in the company.

SELECT DISTINCT job_title
FROM employees;

-- 5. List the number of employees in each department.

SELECT department_number, COUNT(*) AS Number_of_employees
FROM employees
GROUP BY department_number;

-- 6. List in decreasing order the maximum salary in each department together with the department number.

SELECT department_number, MAX(salary) AS best_paid
FROM employees
GROUP BY department_number
ORDER BY best_paid DESC;

-- 7. List total sum of salary and commission for all employees.

SELECT SUM(salary) + SUM(ifnull(commission, 0)) AS total_income
FROM employees;


