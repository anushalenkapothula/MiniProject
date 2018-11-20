
 CREATE OR REPLACE PROCEDURE information
 AS
 BEGIN
    dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('Welcome to bank database');
    dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('OPTIONS:');
    dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('1. To view your balance....type =>  @d:\my_balance');
                     dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('2. To create a new account...type =>  @d:\new_account');
                     dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('3. To deposit money in your account...type => @d:\deposit');
                     dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('4. To withdraw money from your account...type => @d:\withdraw');
                      dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('5. To transfer money from your account to another account...type => @d:\transfer');
                      dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('6. Admin....');
                      dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('	a)To view all present accounts....type => @d:\present_accounts');
	dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('	b)To view all deleted accounts....type => @d:\deleted_accounts');
	dbms_output.put_line(chr(13)||chr(10));
    dbms_output.put_line('	c)To remove an account....type => @d:\delete');
                      dbms_output.put_line(chr(13)||chr(10));
 END;
 /