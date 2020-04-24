--1. List the following details of each employee: employee number, last name, first name, gender, and salary.--
SELECT emp.emp_no, last_name, first_name, gender, salary FROM "Employees" EMP
JOIN "Salaries" SLS ON
EMP.emp_no = SLS.emp_no
ORDER BY EMP.emp_no ASC

--2. List employees who were hired in 1986.--
SELECT last_name, first_name, hire_date FROM "Employees"
WHERE hire_date BETWEEN '1986/01/1' AND '1986/12/31'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.--
SELECT DM.dept_no, 
dept_name, 
DM.emp_no AS "Manager Employee No", 
last_name, 
first_name,
from_date,
to_date FROM "Dept_managers" DM
JOIN "Departments" DPT ON
DPT.dept_no = DM.dept_no
JOIN "Employees" EMP ON
EMP.emp_no = DM.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.--
SELECT EMDT.emp_no, last_name, first_name, DEPT.dept_name FROM "Employee_dept" EMDT
JOIN "Employees" EMP ON
EMP.emp_no = EMDT.emp_no
JOIN "Departments" DEPT ON
DEPT.dept_no = EMDT.dept_no
ORDER BY emp_no ASC

--5. List all employees whose first name is "Hercules" and last names begin with "B."--
SELECT first_name, last_name FROM "Employees"
WHERE first_name = 'Hercules' AND last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.--
SELECT EMDT.emp_no, last_name, first_name, DEPT.dept_name FROM "Employee_dept" EMDT
JOIN "Employees" EMP ON
EMP.emp_no = EMDT.emp_no
JOIN "Departments" DEPT ON
DEPT.dept_no = EMDT.dept_no
WHERE dept_name ='Sales'
ORDER BY emp_no ASC

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.--
SELECT EMDT.emp_no, last_name, first_name, DEPT.dept_name FROM "Employee_dept" EMDT
JOIN "Employees" EMP ON
EMP.emp_no = EMDT.emp_no
JOIN "Departments" DEPT ON
DEPT.dept_no = EMDT.dept_no
WHERE dept_name ='Sales' OR dept_name ='Development'
ORDER BY emp_no ASC

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.--
SELECT last_name, count(last_name) FROM "Employees"
GROUP BY last_name
ORDER BY count DESC
