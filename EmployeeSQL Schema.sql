-- Create tables and import data
-- Drop table if exists
DROP TABLE IF EXISTS titles;

-- Create new table
CREATE TABLE titles (
  	title_id VARCHAR PRIMARY KEY,
  	title VARCHAR NOT NULL
);

-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- Create new table
CREATE TABLE employees (
  	emp_no INT PRIMARY KEY,
  	emp_title_id VARCHAR,
  	birth_date DATE,
  	first_name VARCHAR NOT NULL,
  	last_name VARCHAR NOT NULL,
  	sex VARCHAR,
 	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Drop table if exists
DROP TABLE IF EXISTS salaries;

-- Create new table
CREATE TABLE salaries (
  	emp_no INT,
 	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- Create new table
CREATE TABLE departments (
  	dept_no VARCHAR PRIMARY KEY,
  	dept_name VARCHAR
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;

-- Create new table
CREATE TABLE dept_emp (
  	emp_no INT,
  	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- Create new table
CREATE TABLE dept_manager (
  	dept_no VARCHAR,
  	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);