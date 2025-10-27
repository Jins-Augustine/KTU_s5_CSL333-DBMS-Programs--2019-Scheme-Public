-- factorial of a number using PL/SQL--

set serveroutput on;
show serveroutput;

DECLARE
    num int;
    i int;
BEGIN
    num:= :num;
    i:=num-1;
    if(num=0)
    then
    dbms_output.put_line('FACTORIAL IS: 1');
    else
    while(i>0)
    loop
    num:=num*i;
    i:=i-1;
    end loop;
    dbms_output.put_line('Factorial is:' || num);
    end if;
END;
/

-- Greatest of 3 numbers --
DECLARE
    numa int;
    numb int;
    numc int;
BEGIN
    numa:= :numa;
    numb:= :numb;
    numc:= :numc;
    if(numa>numb AND numa>numc)
    then
    dbms_output.put_line(numa || ' is greatest');
    elsif(numb>numa AND numb>numc)
    then
    dbms_output.put_line(numb || ' is the greatest');
    else
    dbms_output.put_line(numc || ' is the greatest');
    end if;
END;
/

-- Calculator --

DECLARE     numa int;
    numb int;
    sumOf int;
    sub int;
    mul int;
    div int;
    operatorOf int;
BEGIN
    numa:= :numa;
    numb:= :numb;
    sumOf:= numa+numb;
    sub:=numa-numb;
    mul:=numa*numb;
    if(numb!=0)
    then
    div:=numa/numb;
    end if;
    operatorOf:= :operatorOf;
    case operatorOf
    when 1
    then dbms_output.put_line('sum is: '|| sumOf);
    when 2
    then dbms_output.put_line('Difference is: '|| sub);
    when 3
    then dbms_output.put_line('Product is: '|| mul);
    when 4
    then dbms_output.put_line('Quotient is '|| div);
    else dbms_output.put_line('Enter correct choice');
    end case;
END;


/

DECLARE
    a int;
    b int;
    c int;
    num int;
BEGIN
    a:= 0;
    b:= 1;
    c:= 0;
    num:=:num;
    num:=num-2;
    dbms_output.put_line('FIBONACCI SEREIS IS:');
    dbms_output.put_line(a);
    dbms_output.put_line(b);
    while(num>0)
    loop
    c:=a+b;
    a:=b;
    b:=c;
    dbms_output.put_line(c);
    num:=num-1;
    end loop;
END;

   

    