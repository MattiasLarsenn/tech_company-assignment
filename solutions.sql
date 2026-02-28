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

-- 8. List departments sorted by location.

-- 9. Find name of the department located in New York.

-- 10. You have proven your worth at the company. Your colleague comes to you trying to remember what's-his-name. It starts with a J and ends with S. Can you help her?

-- 11. Maybe that wasn't helpful. "Oh yeah, I remember now!" they say and tell you that he is a manager.

-- 12. How many employees are there in each department?
