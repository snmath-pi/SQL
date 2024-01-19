create table employee (
	eid int,
    e_name varchar(20),
    e_salary int,
    e_age int,
    e_gender varchar(20),
    e_dept varchar(20)
);
drop table employee;
insert into employee values(1, 'Sam', 95000, 45, 'Male', 'Operations');
insert into employee values(2, 'Bob', 80000, 21, 'Male', 'Support');
insert into employee values(3, 'Anne', 125000, 25, 'Femlae', 'Analytics');
insert into employee values(4, 'Julia', 73000, 30, 'Female', 'Analytics');
insert into employee values(5, 'Matt', 159000, 33, 'Male', 'Sales');
insert into employee values(6, 'Jeff', 112000, 27, 'Male', 'Operations');
update employee set e_gender = 'Female' where e_name = 'Anne';
select * from employee;
create table department (d_id int, d_name varchar(20), d_location varchar(20));
insert into department values(1, 'Content', 'New York');
insert into department values(2, 'Support', 'Chicago');
insert into department values(3, 'Analytics', 'New York');
insert into department values(4, 'Sales', 'Boston');
insert into department values(5, 'Tech', 'Dallas');
insert into department values(6, 'Finance', 'Chicago');
select * from department;

#inner join gives intersection records common to table A and B

select employee.e_name, employee.e_dept, department.d_name, department.d_location 
from employee
inner join department
on employee.e_dept = department.d_name;

#left join all records from left and matched records from right table only

select *from employee;
select *from department;

select employee.e_name, employee.e_dept, department.d_name, department.d_location
from employee
left join department
on employee.e_dept = department.d_name;

select employee.e_name, employee.e_dept, department.d_name, department.d_location
from employee
right join department
on employee.e_dept = department.d_name;

select employee.e_name, employee.e_dept, department.d_name, department.d_location
from employee
full join department
on employee.e_dept = department.d_name;

#update employee
#set e_age = e_age + 10
#from employee
#join department on employee.e_dept = department.d_name
#where d_location = 'New York'; 
#UNION 

# no of row and column should be smame

create table student1 (sid int, s_name varchar(20), s_marks int);
create table student2 (sid int, s_name varchar(20), s_marks int);
insert into student1 values (1, 'Sam', 45), (2, 'Bob', 87), (3, 'Anne', 73), (4, 'Julia', 92);
insert into student2 values (3, 'Anne', 73), (4, 'Julia', 92), (5, 'Matt', 65);

select * from student1
union
select * from student2;

select * from student1
union all
select * from student2;

# A - B operator -> Except

select * from student1
except
select * from student2;

# A interseciton B -> intersect operator

select * from student1
intersect 
select * from student2;













