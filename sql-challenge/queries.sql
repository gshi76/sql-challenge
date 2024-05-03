
---------------------- QUERIES -------------------------
-- employee number, last name, first name, sex, and salary--
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;
-- 
-- first name, last name, and hire date during 1986-- 
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees 
-- date extraction from ChatGPT
WHERE EXTRACT(YEAR FROM hire_date)=1986;

-- manager of each department with dep_no, dept_name, emp_no, last_name, first_name--

SELECT dept_manager.dept_no, departments.dept_name,dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON departments.dept_no=dept_manager.dept_no
LEFT JOIN employees ON employees.emp_no= dept_manager.emp_no;

-- dept_no, emp_no, last_name, first_name, and dept_name for all employees--
SELECT dept_emp.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON departments.dept_no=dept_emp.dept_no;

-- first name="Hercules", last name= "B", sex--
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name= 'Hercules' AND last_name LIKE 'B%';

-- each employee dept_name='Sales', emp_no, last_name, first_name, dept_name--
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no WHERE dept_name='Sales';

-- each employee dept_name='Sales'and 'Development', emp_no, last_name, first_name, dept_name--
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no 
WHERE dept_name IN ('Sales','Development');

-- list the frequency counts of all employee last names, written with help from ChatGPT--
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;