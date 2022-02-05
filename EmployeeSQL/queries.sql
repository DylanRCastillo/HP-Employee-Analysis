-- list the employee number, last name, first name, sex, 
-- and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no
ORDER BY emp_no ASC;

-- List first name, last name, 
-- and hire date for employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'
ORDER BY hire_date ASC;

-- List the manager of each department with the 
-- following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager m
INNER JOIN employees e
ON m.emp_no = e.emp_no
INNER JOIN departments d
ON m.dept_no = d.dept_no;

-- List the department of each employee with employee number, 
-- last_name, first_name and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN  dept_emp  
ON e.emp_no = dept_emp.emp_no
INNER JOIN departments d
ON dept_emp.dept_no = d.dept_no;

-- List first name, last name 
-- and sex for employees whose first name is 'Hercules' and 
-- last names begin with 'B'
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, 
-- including their employee number, last name, first name, 
-- and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN  dept_emp  
ON e.emp_no = dept_emp.emp_no
INNER JOIN departments d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN  dept_emp  
ON e.emp_no = dept_emp.emp_no
INNER JOIN departments d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development');

--List the frequency count of employee's last name in desc order
SELECT last_name, COUNT(last_name) AS "Total Count"
FROM employees
GROUP BY last_name
ORDER BY "Total Count" DESC;

-- List the top 10 highest paid positions, people, and gender
SELECT t.title, CONCAT(e.first_name, ' ' , e.last_name) AS full_name, e.sex, s.salary 
FROM employees AS e 
INNER JOIN titles AS t ON e.emp_title = t.title_id 
INNER JOIN salaries AS s ON e.emp_no = s.emp_no 
ORDER BY s.salary DESC 
LIMIT 10;

-- List the top 10 lowest paid positions, people, and gender
SELECT t.title, CONCAT(e.first_name, ' ' , e.last_name) AS full_name, e.sex, s.salary 
FROM employees AS e 
INNER JOIN titles AS t ON e.emp_title = t.title_id 
INNER JOIN salaries AS s ON e.emp_no = s.emp_no 
ORDER BY s.salary ASC 
LIMIT 10;

-- List the total employees, total male/female, avg salary, total_salary in each department grouped by department and sex
SELECT dtt.dept_name, COUNT(de.emp_no) AS total_employees, AVG(s.salary) as avg_salary, SUM(s.salary) as total_salary, e.sex, COUNT(e.sex) as gender_count 
FROM departments AS dtt 
INNER JOIN dept_emp AS de ON dtt.dept_no = de.dept_no 
INNER JOIN employees AS e ON e.emp_no = de.emp_no 
INNER JOIN salaries AS s ON s.emp_no = e.emp_no 
GROUP BY dtt.dept_name, e.sex 
ORDER BY avg_salary DESC;


