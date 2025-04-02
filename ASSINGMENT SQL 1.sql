CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18 AND age <= 65),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    employed_date DATE,
    status VARCHAR(20) CHECK (status IN ('Active', 'Inactive', 'On Leave'))
);

INSERT INTO employees (name, age, department, salary, employed_date, status)
VALUES 
    ('Olawoye Taofeek', 30, 'Engineering', 85000.00, '2020-06-15', 'Active'),
    ('Tonye LawsonJack', 27, 'Finance', 72000.50, '2018-09-12', 'Active'),
    ('Gloria George', 35, 'HR', 69000.00, '2017-04-23', 'Inactive'),
    ('Chidi Malachi', 40, 'IT', 95000.75, '2015-02-01', 'Active'),
    ('Azeez Adigun', 45, 'Marketing', 88000.00, '2012-11-30', 'On Leave'),
    ('Ayobami Alalade', 33, 'Legal', 92000.20, '2016-05-10', 'Active'),
    ('Nmesoma Ohakwe', 29, 'Operations', 74000.00, '2019-07-20', 'Active'),
    ('Ibrahim Bello', 38, 'IT', 97000.60, '2014-01-18', 'Inactive'),
    ('Fatima Suleiman', 31, 'Sales', 68000.00, '2021-03-15', 'Active'),
    ('Emmanuel Chukwu', 36, 'Finance', 83000.50, '2015-08-10', 'Active'),
    ('Sarah Iwobi', 28, 'Marketing', 72000.00, '2022-06-01', 'Active'),
    ('Biodun Kayode', 34, 'Engineering', 91000.00, '2016-03-25', 'On Leave'),
    ('Tolu Akinyele', 26, 'Finance', 77000.00, '2020-07-13', 'Active'),
    ('Victor Okoye', 39, 'HR', 66000.00, '2013-09-30', 'Inactive'),
    ('Blessing Adewale', 42, 'IT', 98000.00, '2011-12-05', 'Active'),
    ('Joseph Olamide', 24, 'Sales', 64000.00, '2023-02-20', 'Active'),
    ('Grace Udo', 30, 'Legal', 90000.00, '2018-11-08', 'Inactive'),
    ('Stephen Chukwuma', 33, 'Operations', 73000.00, '2017-05-22', 'Active'),
    ('Mary Amadi', 37, 'Marketing', 86000.00, '2015-01-14', 'Active'),
    ('John Mensah', 41, 'Finance', 94000.00, '2010-08-03', 'Inactive'),
    ('Paulina Agyeman', 29, 'Engineering', 87000.00, '2019-06-27', 'Active'),
    ('Henry Adeboye', 36, 'Legal', 93000.00, '2014-10-30', 'Active'),
    ('Daniel Yusuf', 31, 'Sales', 65000.00, '2021-12-18', 'On Leave'),
    ('Ifeanyi Eze', 28, 'IT', 97000.00, '2022-04-25', 'Active'),
    ('Damilola Akande', 45, 'Operations', 78000.00, '2009-03-10', 'Inactive'),
    ('Michael Okonkwo', 38, 'HR', 71000.00, '2016-08-15', 'Active'),
    ('Fatou Jallow', 26, 'Finance', 82000.00, '2023-01-10', 'Active'),
    ('Collins Ekene', 32, 'Engineering', 92000.00, '2015-12-11', 'Active'),
    ('Musa Danladi', 44, 'Marketing', 74000.00, '2012-07-08', 'On Leave'),
    ('Angela Adebayo', 40, 'Legal', 96000.00, '2013-05-19', 'Active'),
    ('Philip Chima', 29, 'Sales', 68000.00, '2020-09-01', 'Active'),
    ('Funmi Adeyemi', 33, 'Operations', 75000.00, '2017-10-22', 'Inactive'),
    ('Peter Osei', 50, 'HR', 60000.00, '2007-06-15', 'Inactive'),
    ('Joy Nkanta', 35, 'IT', 99000.00, '2012-04-29', 'Active'),
    ('Samuel Obinna', 30, 'Finance', 89000.00, '2018-02-14', 'Active'),
    ('Beatrice Otu', 42, 'Marketing', 77000.00, '2010-11-25', 'On Leave'),
    ('Kelvin Lawson', 31, 'Engineering', 88000.00, '2019-05-30', 'Active'),
    ('Oluwaseun Ajayi', 28, 'Legal', 91000.00, '2022-09-13', 'Inactive'),
    ('Adamu Garba', 39, 'Operations', 78000.00, '2016-07-18', 'Active'),
    ('Yetunde Olawale', 37, 'Finance', 93000.00, '2015-03-22', 'Active'),
    ('Chinedu Mba', 34, 'IT', 94000.00, '2013-08-07', 'Active'),
    ('Emeka Uche', 41, 'HR', 67000.00, '2011-09-20', 'Inactive'),
    ('Amaka Eze', 27, 'Marketing', 72000.00, '2023-06-10', 'Active'),
    ('Adebola Kazeem', 31, 'Sales', 69000.00, '2020-12-05', 'Active'),
    ('Ibrahim Musa', 36, 'Engineering', 95000.00, '2015-04-15', 'On Leave'),
    ('Habiba Bello', 25, 'Operations', 73000.00, '2022-08-28', 'Active'),
    ('Taiwo Folami', 29, 'Legal', 87000.00, '2021-10-02', 'Active');

	SELECT *
	FROM employees;

	--QUESTION 1
	SELECT *
	FROM employees
	WHERE department = 'IT';

	--Question 2
	SELECT *
	FROM employees
	WHERE salary > 90000;

	--Question 3
	SELECT *
	FROM employees
	WHERE employed_date < '2015-01-01';

	--Question 4
	SELECT *
	FROM employees
	WHERE status = 'On Leave';

	--Question 5
	SELECT *
	FROM employees
	WHERE department = 'Finance'
	OR department ='Marketing';

	--Question 6
	SELECT *
	FROM employees
	WHERE salary 
	BETWEEN 70000 AND 85000;

	--Question 7
	SELECT *
	FROM employees
	WHERE name like 'A%';

	--Question 8
	SELECT *
	FROM employees
	WHERE employed_date <= CURRENT_DATE - interval '10 years'
	ORDER BY employed_date; 

	--Question 9
	SELECT *
	FROM employees
	WHERE age< 30;

	--Question 10
	SELECT *
	FROM employees
	WHERE status = 'Inactive'
	ORDER BY salary DESC;

	--Question 11
	SELECT *
	FROM employees
	ORDER BY salary DESC
	LIMIT 1;

	SELECT *
	FROM employees
	ORDER BY salary
	LIMIT 1;

	
	--new class
	SELECT COUNT (*) AS number_of_rows
	FROM employees;