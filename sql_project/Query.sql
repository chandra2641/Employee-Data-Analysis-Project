
use employees;

show tables;

-- 1. List of Employees by Department
-- Question: Write a query to list all employees along with their respective department names. 
--  Include employee number, first name, last name, department number, and department name.

select ep.emp_no,ep.first_name,ep.last_name,
dp.dept_no,dp.dept_name 
from employees as ep
join dept_emp as de on ep.emp_no = de.emp_no
join departments as dp on de.dept_no = dp.dept_no;


-- 2. Current and Past Salaries of an Employee
-- Question: Write a query to retrieve all the salary records of a given employee (by employee number '10044'). 
-- Include employee number, salary, from_date, and to_date.

SELECT * FROM salaries
WHERE emp_no = '10044' order by salary desc 
LIMIT 1;


-- 3. Employees with Specific Titles
-- Question: Write a query to find all employees who have held a specific title (e.g., 'Engineer').
--  Include employee number, first name, last name, and title.

select emp.emp_no , emp.first_name, emp.last_name,
tt.title
from employees as emp
join titles as tt on emp.emp_no = tt.emp_no
where title ="Engineer" ;

-- 4. Departments with Their Managers
-- Question: Write a query to list all departments along with their current managers.
-- Include department number, department name, manager's employee number, first name, and last name.

select dp.dept_no, dp.dept_name,
mg.emp_no ,ep.first_name,ep.last_name
from departments as dp 
join dept_manager as mg on dp.dept_no = mg.dept_no 
join employees as ep on mg.emp_no = ep.emp_no;


-- 5. Count of employees by Department
-- question :-  Write a query to count the employees by departments
-- include dept_no , dept_name and count of employee

select dd.dept_no,dd.dept_name ,count(emp_no) as count_emp
from departments as dd
join  dept_emp as de on dd.dept_no = de.dept_no
group by dd.dept_no,dd.dept_name;


--  6. Employees' Birthdates in a Given Year
-- Question: Write a query to find all employees born in a specific year (e.g., 1953).
-- Include employee number, first name, last name, and birth date.


select emp_no , first_name, 
last_name , birth_date
from employees 
where year(birth_date) = "1953";

-- 8. Average Salary by Department
-- Question: Write a query to calculate the average salary for each department. 
-- Include department number, department name, and average salary.


select dp.dept_no , dp.dept_name,
round(avg(se.salary),2) as avg_salary from departments as dp
join dept_emp as de on dp.dept_no = de.dept_no
join salaries as se on de.emp_no = se.emp_no
group by dp.dept_no , dp.dept_name;


-- 9.Gender Distribution in Each Department
-- Question: Write a query to find the gender distribution (number of males and females) in each department. 
-- Include department number, department name, count of males, and count of females.

select dp.dept_no ,dp.dept_name, 
sum( case when ep.gender = "m" then 1 end) as male_count,
sum( case when ep.gender = "f" then 1 end) as female_count
from departments as dp
join dept_emp as de on dp.dept_no = de.dept_no
join employees as ep on ep.emp_no = de.emp_no
group by  dp.dept_no ,dp.dept_name;

-- 10. Longest Serving Employees
-- Question: Write a query to find the employees who have served the longest in the company. 
-- Include employee number, first name, last name, and number of years served.

SELECT emp_no, first_name , last_name,
timestampdiff(year,hire_date,curdate()) as Long_Serving 
FROM employees
ORDER BY Long_Serving  DESC
LIMIT 5;
