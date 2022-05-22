-- Get employees 
SELECT emp_no,first_name,last_name
FROM employees;

-- Get Titles 
SELECT title, from_date, to_date
FROM titles;

-- Join tables, filter from birth dates, ORDER BY employee numbers
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
	ON (t.emp_no=e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- retrieve the number of employees by their most recent job title  who are about to retire.
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

--Deliverable 2 
SELECT emp_no,first_name,last_name,birth_Date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title FROM titles;

-- Create mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
	LEFT JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	LEFT JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
WHERE(de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER by e.emp_no;

SELECT * FROM mentorship_eligibility;






