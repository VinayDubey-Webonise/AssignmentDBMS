SELECT emp.name as "Employee Name",emp.age as "Age" from emp,dept,works where emp.id=works.emp_id and works.dept_id=dept.id and dept.name='hardware' and dept.name='software';

SELECT dept.manager_id as "Manager", GROUP_CONCAT(emp.name) as "Employee" from emp,works,dept WHERE emp.id=works.emp_id and works.dept_id= dept.id GROUP BY dept.manager_id;

SELECT COUNT(emp.id) as "No. of employee", SUM(works.pct_time) as "Total work done" from dept,emp,works WHERE emp.id=works.emp_id and dept.id=works.dept_id GROUP BY works.dept_id HAVING  (SUM(works.pct_time)/100)>=10;

SELECT emp.name 
from emp,dept,works 
where emp.id=works.emp_id and works.dept_id=dept.id and 
emp.salary> all (select max(dept.budget) from dept where dept.id=dept.id);


SELECT manager_id from dept 
where budget >1000000;


SELECT emp.name,manager_id,budget from dept,emp,works where emp.id = works.emp_id and dept.id = works.dept_id order by budget desc limit 2;
