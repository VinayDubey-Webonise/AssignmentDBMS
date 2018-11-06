/* Question 1 */

SELECT emp.name AS "Employee Name", emp.age AS "Age"
FROM works 
INNER JOIN emp ON emp.id=works.emp_id 
INNER JOIN dept ON dept.id=works.dept_id 
WHERE dept.name IN ("hardware","software") 
GROUP BY works.emp_id 
HAVING COUNT(*) = 2;

/* Question 2 */

SELECT dept.manager_id AS "Manager", GROUP_CONCAT(emp.name) AS "Employee"
FROM works 
INNER JOIN emp ON emp.id=works.emp_id 
INNER JOIN dept ON dept.id=works.dept_id
GROUP BY dept.manager_id;

/* Question 3 */

SELECT COUNT(emp.id) AS "No. of employee", SUM(works.pct_time) AS "Total work done"
FROM works 
INNER JOIN emp ON emp.id=works.emp_id 
INNER JOIN dept ON dept.id=works.dept_id
GROUP BY works.dept_id 
HAVING (SUM(works.pct_time)/100)>=10;

/* Question 4 */

SELECT emp.name AS "Employee Name",emp.salary AS Salary,SUM(dept.budget) AS Budget
FROM works 
INNER JOIN emp ON emp.id=works.emp_id 
INNER JOIN dept ON dept.id=works.dept_id 
GROUP BY works.dept_id
HAVING Salary>Budget;

/* Question 5 */

SELECT DISTINCT manager_id as "Manager Id"
FROM dept 
WHERE budget>1000000;

/* Question 6 */

SELECT emp.name AS "Manager Name", dept.budget AS Budget
FROM works
INNER JOIN emp ON emp.id=works.emp_id
INNER JOIN dept ON dept.id=works.dept_id
GROUP BY works.dept_id
HAVING Budget=MAX(dept.budget);


