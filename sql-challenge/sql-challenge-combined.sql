-- code and order of tables were written with assistance from Eli/instructor.

-- all data table values were imported manually using import csv function--
CREATE TABLE titles (
title_id CHAR(5) NOT NULL PRIMARY KEY,
title VARCHAR);

SELECT * from titles;
-- drop table titles cascade;
-- drop table departments cascade;

CREATE TABLE departments(
dept_no CHAR(4) NOT NULL PRIMARY KEY--foreignkey, 
,dept_name VARCHAR NOT NULL);

SELECT * from departments;


-- drop table employees cascade;

CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id CHAR(5),
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date DATE,
	CONSTRAINT fk_title_no FOREIGN KEY (emp_title_id)
	REFERENCES titles(title_id)
);

select * from employees;

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT,
	CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no,emp_no) --created composite key due to duplications in emp_no
);

select * from dept_manager;

CREATE TABLE dept_emp(
    emp_no INT,
    dept_no CHAR(4),
    CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no,emp_no) --created composite key due to duplications in emp_no
);


select * from dept_emp;

CREATE TABLE salaries(
emp_no INT,
salary INT,
CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

SELECT * from salaries;

---------------------- QUERIES -------------------------
-- employee number, last name, first name, sex, and salary--
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

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
-- help from ChatGPT
WHERE dept_name IN ('Sales','Development');

-- list the frequency counts of all employee last names, written with help from ChatGPT--
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;