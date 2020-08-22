-- DATA ANALYSIS

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	emp.sex AS "Sex",
	salaries.salary AS "Salary"
	FROM employees AS emp
	INNER JOIN salaries ON
	emp.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Sex"
	FROM employees
	WHERE date_part('year',hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
	dept.dept_no AS "Department Number",
	dept.dept_name AS "Department Name",
	emp.emp_no AS "Manager´s Employee Number",
	emp.last_name AS "Manager´s Last Name",
	emp.first_name AS "Manager´s First Name"
	FROM departments AS dept
	INNER JOIN dept_manager ON
	dept.dept_no = dept_manager.dept_no
	INNER JOIN employees AS emp ON
	dept_manager.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	depts.dept_name AS "Department Name"
	FROM employees AS emp
	INNER JOIN dept_emp ON
	emp.emp_no = dept_emp.emp_no
	INNER JOIN departments AS depts ON
	dept_emp.dept_no = depts.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Sex"
	FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	depts.dept_name AS "Department Name"
	FROM employees AS emp
	INNER JOIN dept_emp ON
	emp.emp_no = dept_emp.emp_no
	INNER JOIN departments AS depts ON
	dept_emp.dept_no = depts.dept_no
	WHERE dept_name = 'Sales';

-- 8. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	depts.dept_name AS "Department Name"
	FROM employees AS emp
	INNER JOIN dept_emp ON
	emp.emp_no = dept_emp.emp_no
	INNER JOIN departments AS depts ON
	dept_emp.dept_no = depts.dept_no
	WHERE dept_name IN ('Sales', 'Development') ;

-- 9. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(emp_no) AS "Employees per Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Employees per Last Name" DESC;
