select ceil(8.29) from dual;
select ceil(-3.9) from dual;
select ceil(17/3) from dual;
select floor(9.76) from dual;
select sqrt(625) from dual;
select abs(8.29) from dual;
select abs(-3.14) from dual;
select sysdate as now from dual;
select to_char(sysdate,'DD-MM-YY HH:MI:SS') FROM DUAL;
select systimestamp from dual;
select least('apple','cherry','banana') from dual;
select greatest('apple','cherry','banana') from dual;
select LTRIM('  Trim me') from dual;
select RTRIM('i love india    ') from dual;
select rpad('JOHN',15,'X') from dual;
select rpad(123,6,0) from dual;
select reverse('uoy evol l') from dual;

select
CASE
    when 'racecar'=reverse('racecar')
    Then 'Racecar is palindrome'
    else 'Racecar is not a palindrome'
END as palindrome_check
from dual;

select length('oracle database') from dual;
select('oracle'||' '||'is'||' '||'powerful') from dual;
select concat('John ','Dustin') from dual;
select substr('India is my country', 7,2) from dual;
select substr('Substring',1,3) from dual;