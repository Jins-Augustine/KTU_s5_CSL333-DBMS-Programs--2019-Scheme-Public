-- Procedure and Functions--

--1 1. Create a function factorial to find the factorial of a number. Use this function in PL/SQL Program to display the factorial of a number read from the user

create or replace function factorial( n int)
return int as
fact int :=1;
begin
    for i in 1..n loop
        fact:=fact*i;
    end loop;
    return fact;
end;
/
set serveroutput on;
declare 
 c int;
begin
    c:=factorial(5);
    dbms_output.put_line('factorial is ' || c);
end;
/

-- 2: 2. Create a table student_details (roll int, marks int, phone int). Create a procedure pr1 to update all rows in the database. Boost the marks of all students by 5%. 

create table student_details(
     roll int,
     marks int,
     phone int
     );
insert into student_details values(1,70,9876543234);
insert into student_details values(2,47,9876543234);
insert into student_details values(3,48,9883638393);
insert into student_details values(4,48,9876764646);

select * from student_details;
/
create or replace procedure pr1 as
begin
    update student_details
    set marks=marks+(marks*0.05);
    commit;
end;
/

begin
    pr1;
end;
/

-- 3 3. Create a table student (id, name, m1, m2, m3, total, grade). Create a function f1 to calculate
 --grade. Create a procedure p1 to update the total and grade.
--• Read: id, name, m1, m2, m3 from the user
--•Insert the tuple into the database
--•Using function f1 calculate the grade
--•Using procedure p1, update the grade value for the tuple

create table students(
id int,
name varchar(20),
m1 int,
m2 int,
m3 int,
total int,
grade varchar(1));
/
declare
    id int;
    name varchar(20);
    m1 int;
    m2 int;
    m3 int;
    t int;
begin
    id:= :id;
    name:= :name;
    m1:= :m1;
    m2:= :m2;
    m3:= :m3;
    t:=m1+m2+m3;
    insert into students(id,name,m1,m2,m3,total)
    values(id,name,m1,m2,m3,t);
end;
/
select * from students;
/

create or replace function f1(total in int)
return varchar as
g varchar(2);
begin
    if total>270
    then g:= 'A';
    elsif total>=240 
    then g:='B';
    elsif total>=200 
    then g:='C';
    else g:='F';
    end if;
    return g;
end;
/
create or replace procedure p1 as
begin
    update students
    set grade = f1(total);
    dbms_output.put_line('Total and grdae updated.');
end;
/
exec p1;
/
create table customer_details(
    cust_id number unique,
    cust_name varchar(20),
    address varchar(30));
INSERT INTO customer_details VALUES (101, 'Ravi Kumar',
'Chennai');
INSERT INTO customer_details VALUES (102, 'Sneha Patel',
'Mumbai');
INSERT INTO customer_details VALUES (103, 'Arjun Das',
'Kolkata');

create table emp1_details(
empid number unique,
empname varchar(20),
salary number);
INSERT INTO emp1_details VALUES (201, 'Rahul Mehta', 18000);
INSERT INTO emp1_details VALUES (202, 'Priya Sharma', 17000);
INSERT INTO emp1_details VALUES (203, 'Karan Singh', 19500);
    
create table cust_count(
count_row number);
INSERT INTO cust_count VALUES (0);
/

-- 1) Create a trigger whenever a new record is inserted in the customer_details table

create or replace trigger trg_new_customer
after insert on customer_details
for each row
begin
dbms_output.put_line('New customer record inserted successfully.');
end;
/
INSERT INTO customer_details VALUES (104, 'Neha Reddy',
'Hyderabad');
/

-- 2) Create a trigger to display a message when a user enters a value > 20000 in the salary field of emp_details table.

create or replace trigger  trg_salary_check
before insert or update on emp_details
for each row
when(NEW.salary>20000)
begin
dbms_output.put_line('Salary is greater than 20000');
end;
/
INSERT INTO emp_details VALUES (1, 'John Doe', 30000);
/

-- 3: Create a trigger w.r.t customer_details table. Increment the value of count_row (in
 --cust_count table) whenever a new tuple is inserted and decrement the value of
 --count_row when a tuple is deleted. Initial value of the count_row is set to

create or replace trigger trg_customer_count
after insert or delete on customer_details
for each row
begin
    if INSERTING then
    update cust_count set count_row = count_row + 1;
    elsif deleting then
    update cust_count set count_row = count_row - 1;
    end if;
end;
/
select * from emp1_details;
select * from cust_count;
select * from customer_details;
insert into customer_details values(106,'Jphn Wick','Delhi');
delete from customer_details where cust_id = 106;
/

--- 4: Create a trigger to insert the deleted rows from emp_details to another table and 
--updated rows to another table. (Create the tables deleted and updated --


create table deleted(empid int ,empname varchar(20),salary number);
create table updated(empid int,empname varchar(20),salary number);
/
create or replace trigger trig
after delete or update on emp1_details
for each row
begin
    if deleting then
    insert into deleted values(:old.empid,:old.empname,:old.salary);
    dbms_output.put_line('Deleted record moved to deleted table');
    elsif updating then
    insert into updated values(:old.empid,:old.empname,:old.salary);
    dbms_output.put_line('old record moved to updated  table');
    end if;
end;
/
select * from emp1_details;
delete from emp1_details where empid = 202;
select * from deleted;
    
