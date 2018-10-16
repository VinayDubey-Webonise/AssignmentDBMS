
create table emp(
id integer,
name varchar(40),
age integer,
salary double,
primary key (id)
);


create TABLE dept(
id integer,
name varchar(40),
budget double,
manager_id integer,
    PRIMARY key (id),
    FOREIGN key(manager_id) REFERENCES emp(id) 
);

CREATE TABLE works(
emp_id integer,
dept_id integer,
pct_time integer,
    FOREIGN key (emp_id) REFERENCES emp(id),FOREIGN key (dept_id) REFERENCES dept(id)
);

