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

-- JOIN Assignments

-- 1. Create an INNER JOIN between employees and departments to get the department name for each employee. Show all columns.

SELECT *
FROM employees
JOIN departments
ON employees.department_number = departments.department_number;

-- 2. Continue from the last task. Show two columns. The employee_name and their corresponding department_name. Oh, and can you sort them alphabetically (A-Z)?

SELECT employee_name, department_name
FROM employees
INNER JOIN departments
ON employees.department_number = departments.department_number
ORDER BY employee_name;

-- 3. Now is the time to make a LEFT JOIN. Let's look at employee_name and department_name only. There is one more person this time who didn't show in the previous query. Who is it and why?

SELECT employee_name, department_name
FROM employees
LEFT JOIN departments
ON employees.department_number = departments.department_number
ORDER BY employee_name;

-- Det er King der dukker op, han dukkede ikke op før fordi han ikke har et department number, som er det vi joiner dem på, men fordi vi laver left join, tager den alt med employees og putter det i resultat alligevel.

-- 4. One department is missing. Which one and why? (Look in the database).

-- Det er OPERATIONS, da der er en ingen employee som har department nummer 40, som er det nummer OPERATIONS har, man ville skulle bruge RIGHT JOIN, for at få den med.

-- 5. To get the missing department change the previous query to use a RIGHT JOIN.

-- Se ovenstående.

-- 6. SCOTT sends you this query and asks you to run it. In order to assess whether it is information that SCOTT is privy to, you must first understand it. Describe in technical terms what this query does:

-- Den giver et resultat som er et par af employees og deres manager, altså hvis employee manager ID passer en employee ID, så skal den med i resultat, og det bliver vist alfabetisk i employee name.

-- 7. Get two columns: employees and their managers.

SELECT employee.employee_name AS employee,
        manager.employee_name AS manager
FROM employees employee
JOIN employees manager
ON employee.manager_id = manager.employee_number;

-- 8. Use the HAVING keyword (feel free to look it up) to show the departments with more than 3 employees. 

SELECT employees.department_number, COUNT(employees.department_number) as number_of_employees
FROM employees
GROUP BY department_number
HAVING number_of_employees > 3;

-- 9. Subquery time! Select the name and salary of employees whose salary is above average: WHERE salary > (SELECT AVG(salary) FROM employees)

SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Join Table (Many-to-many)

-- 1. Create a new table called leaders and insert rows into it.

CREATE table leaders(
    leader_id INT PRIMARY KEY,
    leader_name VARCHAR(100)
);
INSERT INTO leaders VALUES (1, 'SMITH');
INSERT INTO leaders VALUES (2, 'JOHNSON');
INSERT INTO leaders VALUES (3, 'WILLIAMS');
INSERT INTO leaders VALUES (4, 'BROWN');
INSERT INTO leaders VALUES (5, 'DAVIS');

-- 2. Create a new table called employees_leaders that should link the employees and leaders tables. This is called a join table. It will enable you to create a many-to-many relationship between employees and leaders

CREATE TABLE employees_leaders (
    employee_number INT,
    leader_id INT,
    PRIMARY KEY (employee_number, leader_id),
    FOREIGN KEY (employee_number)
    REFERENCES employees(employee_number),
    FOREIGN KEY (leader_id)
    REFERENCES leaders(leader_id));

-- 3. Create rows in employees_leaders that link employees to their respective leaders.

INSERT into employees_leaders VALUES (7499, 2);
INSERT into employees_leaders VALUES (7521, 3);
INSERT into employees_leaders VALUES (7566, 4);
INSERT into employees_leaders VALUES (7654, 5);

--4. Create a many-to-many query between employees and leaders. It requires two JOIN statements. First you select from employees, then you join with employees_leaders, and finally you join again with leaders.

SELECT employee_name, leader_name
FROM employees
JOIN employees_leaders
ON employees.employee_number = employees_leaders.employee_number
JOIN leaders
ON employees_leaders.leader_id = leaders.leader_id;
