-- List the department, sex, frequency of sex 
-- for employees who were hired in 1980s
SELECT dtt.dept_name, e.sex, COUNT(e.sex) AS frequency
FROM departments AS dtt 
INNER JOIN dept_emp AS de ON dtt.dept_no=de.dept_no
LEFT JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN salaries AS s on s.emp_no = e.emp_no
WHERE e.hire_date BETWEEN '01/01/1980' AND '12/31/1989'
GROUP BY dtt.dept_name, e.sex;

-- List the department, sex, frequency of sex 
-- for employees who were hired in 1990s
SELECT dtt.dept_name, e.sex, COUNT(e.sex) AS frequency
FROM departments AS dtt 
INNER JOIN dept_emp AS de ON dtt.dept_no=de.dept_no
LEFT JOIN employees AS e ON de.emp_no = e.emp_no
WHERE e.hire_date BETWEEN '01/01/1990' AND '12/31/1999'
GROUP BY dtt.dept_name, e.sex;

-- Top 10 most paid employees in the company
SELECT CONCAT(e.first_name, ' ', e.last_name) AS name, t.title, e.sex, s.salary
FROM employees AS e INNER JOIN titles AS t ON e.emp_title=t.title_id
INNER JOIN salaries AS s ON e.emp_no=s.emp_no
ORDER BY s.salary DESC LIMIT 10;

-- Top 10 least paid employees in the company
SELECT CONCAT(e.first_name, ' ', e.last_name) AS name, t.title, e.sex, s.salary
FROM employees AS e INNER JOIN titles AS t ON e.emp_title=t.title_id
INNER JOIN salaries AS s ON e.emp_no=s.emp_no
ORDER BY s.salary ASC LIMIT 10;

-- How many employee are paid over the average in each department?
SELECT dtt.dept_name, e.sex, s.salary, AVG(s.salary) OVER (PARTITION BY dtt.dept_name) as avg_salary_by_department,
CASE WHEN s.salary > (AVG(s.salary) OVER (PARTITION BY dtt.dept_name)) THEN 'Y' ELSE 'N' END as above_avg
FROM departments AS dtt 
INNER JOIN dept_emp AS de ON dtt.dept_no=de.dept_no
LEFT JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN salaries AS s on s.emp_no = e.emp_no
INNER JOIN titles as t ON e.emp_title=t.title_id;
