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