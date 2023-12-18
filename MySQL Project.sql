-- 1.	Retrieve the names of all employees.
SELECT first_name, last_name FROM employee; 
-- 2.	Get the list of all branches.
SELECT branch_name FROM branch; 
-- 3.	Display the names of clients.
SELECT client_name FROM client; 
-- 4.	List all employees who have a supervisor.
SELECT first_name, last_name FROM employee WHERE super_id IS NOT NULL; 
-- 5.	Find the total number of clients.
SELECT COUNT(*) AS total_clients FROM client; 
-- 6.	Retrieve the branch name where employee with emp_id 107 works.
SELECT branch_name FROM branch 
WHERE branch_id = (SELECT branch_id FROM employee 
WHERE emp_id = 107); 
-- 7.	Get the names of employees who were born in 1970.
SELECT first_name, last_name FROM employee 
WHERE YEAR(birth_day) = 1970;
-- 8.	List all clients along with the branch names they are associated with.
SELECT client.client_name, branch.branch_name FROM client
 JOIN branch ON client.branch_id = branch.branch_id; 
-- 9.	Calculate the average salary of all employees.
SELECT AVG(salary) AS average_salary FROM employee; 
-- 10.	Find the employee with the highest salary.
SELECT emp_id, first_name, last_name, salary FROM employee ORDER BY salary DESC LIMIT 1; 
-- 11.	Count the number of employees in each branch.
SELECT branch_id, COUNT(*) AS employee_count FROM employee GROUP BY branch_id; 
-- 12.	Retrieve the names of employees who work with the client "FedEx."
SELECT first_name, last_name FROM employee 
JOIN works_with ON employee.emp_id = works_with.emp_id 
JOIN client ON works_with.client_id = client.client_id 
WHERE client.client_name = 'FedEx'; 
-- 13.	Display the branch names and the total number of employees in each branch.
SELECT branch_name, COUNT(*) AS total_employees FROM branch 
JOIN employee ON branch.branch_id = employee.branch_id 
GROUP BY branch_name; 
-- 14.	Retrieve the names of employees who do not have a supervisor.
SELECT first_name, last_name FROM employee 
WHERE super_id IS NULL; 
-- 15.	Identify the employee with the highest total sales.
SELECT emp_id, first_name, last_name, SUM(total_sales) AS total_sales FROM employee 
LEFT JOIN works_with ON employee.emp_id = works_with.emp_id GROUP BY emp_id, first_name, last_name 
ORDER BY total_sales DESC LIMIT 1; 
-- 16.	Find the branch that has the highest average salary among its employees.
SELECT branch_id, AVG(salary) AS avg_salary FROM employee GROUP BY branch_id 
ORDER BY avg_salary DESC LIMIT 1; 
-- 17.	Retrieve the names of employees who work with more than one client.
SELECT first_name, last_name FROM employee 
JOIN works_with ON employee.emp_id = works_with.emp_id GROUP BY employee.emp_id 
HAVING COUNT(works_with.client_id) > 1; 
-- 18.	List the names of employees who were born before their supervisors.
SELECT e1.first_name, e1.last_name FROM employee e1 
JOIN employee e2 ON e1.super_id = e2.emp_id 
WHERE e1.birth_day < e2.birth_day; 
-- 19.	Calculate the total sales for each client.
SELECT client_id, client_name, SUM(total_sales) AS total_client_sales FROM works_with 
JOIN client ON works_with.client_id = client.client_id 
GROUP BY client_id, client_name;
-- 20.	Identify the branch with the highest total sales.
SELECT employee.emp_id, employee.first_name, employee.last_name, SUM(works_with.total_sales) AS total_sales
FROM employee
LEFT JOIN works_with ON employee.emp_id = works_with.emp_id
GROUP BY employee.emp_id, employee.first_name, employee.last_name
ORDER BY total_sales DESC
LIMIT 1;

