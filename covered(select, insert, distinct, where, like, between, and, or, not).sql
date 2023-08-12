create table emp(
e_id int not null,
ename varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20),

primary key(e_id)
);

insert into emp values (
1, 'Saksham', 95000, 20, 'M', 'Operations'	
);

insert into emp values(
2, 'Rohan', 101010, 21, 'M', 'Support'
);
insert into emp values (3, 'Anne', 23408, 20, 'F', 'Software');
insert into emp values(4, 'Julia', 132129, 21, 'F', 'Sales');
insert into emp values (
5, 'Shushant', 95000, 20, 'M', 'Operations'	
);
insert into emp values(6, 'Jeff', 78980, 21, 'M', 'Hardware');

select ename, e_age from emp;
select * from emp;
#selecting distinct values
select distinct e_gender from emp;
#where clause used to select only those records that satisfy a given condition
select *from emp where e_gender = 'F';
#AND operator
select * from emp where e_age <= 20 and e_salary >= 90000;
#OR operator
select *from emp where e_age <= 20 or e_gender = 'F' or e_salary >= 80000;
#NOT operator
select * from emp where not (e_dept = 'Software' );
#LIKE Operator: used to extract those records where a particular pattern in present
# example extract JOHN pattern from johnny johnathan john etc from table
select * from emp where ename like 'S%';
select * from emp where e_age like '_1';
#between operator: used to select values b/w a given range
select * from emp where e_salary between 90000 and 110000;



