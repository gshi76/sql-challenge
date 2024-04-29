CREATE TABLE departments(
dept_no VARCHAR UNIQUE--foreignkey, 
,dept_name VARCHAR PRIMARY KEY );

-- ALTER TABLE departments
-- ADD CONSTRAINT dept_no_unq UNIQUE (dept_no);

SELECT * from departments;

CREATE TABLE dept_emp (
    emp_no VARCHAR unique,
    dept_no VARCHAR,
    CONSTRAINT fk_dept_no
        FOREIGN KEY (dept_no)
        REFERENCES departments(dept_no)
);

select * from dept_emp;


-- CREATE TABLE dept_manager(
-- dept_no VARCHAR,
-- emp_no int,
-- 	CONSTRAINT fk_dept_num_man
-- 		FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no),
-- 	CONSTRAINT fk_emp_no
-- 		FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)	
-- );