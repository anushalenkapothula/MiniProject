DECLARE
   	acc_num number:=&your_account_number;
    	passwd varchar2(100):='&your_password';
   	amt number:=&amount_to_be_withdrawn;
	c number;
        b number;
PROCEDURE show(acc_num  number,passwd varchar2)
 IS
  	CURSOR cur IS
   	SELECT account_number,user_name,balance FROM USER_DETAILS WHERE account_number = acc_num and password=passwd;
   	c_cur cur%rowtype;
   	BEGIN
                   		OPEN cur;
                   		LOOP
                   		FETCH cur INTO c_cur;
                   		EXIT WHEN cur%NOTFOUND;
                           	dbms_output.put_line(chr(13)||chr(10));
                                        dbms_output.put_line('Amount withdrawn successfully.');
                                         dbms_output.put_line(chr(13)||chr(10));
                                        dbms_output.put_line('Your updated balance is:');
                                        dbms_output.put_line(chr(13)||chr(10));
                           	DBMS_OUTPUT.PUT_LINE('      Account_Number       ||     User_name           ||   Updated_balance');
                            	dbms_output.put_line(chr(13)||chr(10));
                           	DBMS_OUTPUT.put_line(acc_num   ||'                  '|| c_cur.user_name||'                   '|| c_cur.balance);
                            	END loop;
                           	CLOSE cur;
   	END;
PROCEDURE updated(acc_num number,passwd varchar2,amt number)
 IS
   	BEGIN
                   		UPDATE USER_DETAILS SET balance=balance - amt WHERE account_number=acc_num and password=passwd;
				UPDATE ADMIN_USER_DETAILS SET balance=balance - amt WHERE account_number=acc_num and password=passwd;
                            	show(acc_num,passwd);
    	END;
BEGIN
    SELECT count(account_number) INTO c 
    FROM   user_details WHERE account_number=acc_num AND password= passwd;
    dbms_output.put_line(chr(13)||chr(10));
    	IF(c = 1 ) THEN
          	SELECT balance INTO b FROM   user_details WHERE account_number=acc_num AND password= passwd;
          	IF(amt<=b) THEN
	    		updated(acc_num,passwd,amt);
          	ELSE
	    		dbms_output.put_line('The withdraw amount is greater than existing amount');
          	END IF;
    	ELSE
    	  	dbms_output.put_line('1.Error in account number(10 digits)/password');
    	END IF;
END;
/
