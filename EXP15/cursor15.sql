-- Cursor --
-- 1:Create bank_details (accno, name, balance, adate).
 --Calculate the interest of the amount  and insert into a new table with fields (accno, interest). Interest= 0.08*balance.

set serveroutput on;

create table bank_details(
    accno number,
    name varchar(20),
    balance number,
    adate date);

insert into bank_details values (1001,'aby',3005,to_date('10-10-2015','DD-MM-YYYY'));    
insert into bank_details values (1002,'alan',4000,TO_DATE('05-05-1995','DD-MM-YYYY'));  
insert into bank_details values (1003,'amal',5000,TO_DATE('16-03-1992','DD-MM-YYYY'));  
insert into bank_details values (1004,'jeffin',3500,TO_DATE('01-04-1950','DD-MM-YYYY'));  

select * from bank_details;

create table bank_new(
accno number,
intr number);
/

declare 
    cursor temp is select accno,name,balance,adate from bank_details;
    tempvar temp %rowtype;
    intr number;
begin
    open temp;
    loop
        fetch temp into tempvar;
        intr:=0.08*tempvar.balance;
        insert into bank_new values(tempvar.accno,intr);
        exit when temp%notfound;
    end loop;
    close temp;
end;
/
select * from bank_new;
        
    
    
    
    

