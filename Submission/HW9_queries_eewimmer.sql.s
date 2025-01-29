-- Q1: List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e
	JOIN salaries s on e.emp_no = s.emp_no
	
-- Q2: List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	e.first_name,
	e.last_name,
	e.hire_date
FROM
	employees e
WHERE
	extract (year from hire_date) = 1986
ORDER BY
	e.hire_date ASC, e.last_name ASC, e.first_name ASC;
	
--Q3: List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	d.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM
	departments d
	JOIN dept_manager dm on d.dept_no = dm.dept_no
	JOIN employees e on dm.emp_no = e.emp_no;

--Q4:List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
	d.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no;
	
--Q5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name,
	last_name,
	sex
FROM
	employees
	WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';


-- Q6: List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_no
FROM
	employees e
	JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales'
ORDER BY
	e.last_name ASC, e.first_name ASC;

-- Q7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_no
FROM
	employees e
	JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales' or d.dept_name = 'Development';


-- Q8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	e.last_name,
	count(e.emp_no) as frq_last_name
FROM 
	employees e
GROUP BY
	e.last_name
ORDER BY
	frq_last_name desc;

