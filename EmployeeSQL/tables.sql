-- Create a table for the departments
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(255) NOT NULL
);

-- import data into departments
SELECT * FROM departments



-- Create a table for the titles
CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(33)
);

-- import data into titles
SELECT * FROM titles

--create a table for the employees
CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30),
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

-- import data into employees
SELECT * FROM employees

--create a table for the department employees
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- import data into dept_emp
SELECT * FROM dept_emp

--create a table for the department managers
CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no))
	
-- import data into dept_manager
SELECT * FROM dept_manager

--create a table for salaries
CREATE TABLE salaries(
	emp_no INT,
	salary FLOAT,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

-- import data into salaries
SELECT * FROM salaries

