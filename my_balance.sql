 DECLARE
 acc_num NUMBER:=&your_account_number;
 passwd VARCHAR2(100):='&your_password';
 c NUMBER;

 PROCEDURE user_detail_info(acc_num  NUMBER)
 IS
 	CURSOR cur IS
 		SELECT user_name,balance FROM USER_DETAILS WHERE account_number = acc_num;
 		c_cur cur%rowtype;
		 BEGIN
    			OPEN cur;
    			LOOP
    			FETCH cur INTO c_cur;
    			EXIT WHEN cur%NOTFOUND;
                 			dbms_output.put_line(chr(13)||chr(10));
                    		DBMS_OUTPUT.PUT_LINE('      Account_Number       ||     User_name              ||        Balance');
                 			dbms_output.put_line(chr(13)||chr(10));
                    		DBMS_OUTPUT.put_line(acc_num   ||'                  '|| c_cur.user_name||'                         '|| c_cur.balance);
            			END loop;
            			CLOSE cur;
 		END;
 
 BEGIN
    SELECT count(account_number) INTO c FROM user_details WHERE account_number=acc_num AND password= passwd;
    dbms_output.put_line(chr(13)||chr(10));
    
     IF(c = 1) THEN
	user_detail_info(acc_num);
     ELSE
	dbms_output.put_line('Invalid account number(10 digits)/password');
     END IF;

 END;

/