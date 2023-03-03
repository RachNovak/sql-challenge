-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
From "Employees" As employees
JOIN "Salaries" AS salaries
ON Employees.emp_no = Salaries.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
From "Employees" As employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM "Departments" AS departments
JOIN "Department_Manager" AS  dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN "Employees" as employees
ON dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM "Employees" as Employees
JOIN "Department_Employees" as dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments" as departments
ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM "Employees" as Employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM "Employees" as Employees
JOIN "Department_Employees" as dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments" as departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM "Employees" as Employees
JOIN "Department_Employees" as dept_emp
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments" as departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name, COUNT(last_name) AS "last_name_count"
FROM "Employees" as Employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;