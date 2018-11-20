 DECLARE
user_name varchar2(100):='&admin_name';
passwd varchar2(100):='&admin_password';

PROCEDURE display
IS
 		CURSOR cur IS
 		SELECT * FROM ADMIN_USER_DETAILS;
 		c_cur cur%rowtype;
		 BEGIN
    			OPEN cur;
                                                            dbms_output.put_line(chr(13)||chr(10));
                                                            DBMS_OUTPUT.PUT_LINE('      Account_Number       ||     User_name                   ||             Date_of_Birth              ||               Contact              ||          Email                       ||       Account_type             ||                Balance                ||                Date_of_creation');
    			LOOP
    			FETCH cur INTO c_cur;
    			EXIT WHEN cur%NOTFOUND;
                 			dbms_output.put_line(chr(13)||chr(10));
                    		DBMS_OUTPUT.put_line(c_cur.account_number||'                  '|| c_cur.user_name||'                             '|| c_cur.date_of_birth||'                                  '|| c_cur.contact||'                        '|| c_cur.email||'                             '|| c_cur.account_type||'                                       '||c_cur.balance||'                                       '||c_cur.creation_date);
            			END loop;
            			CLOSE cur;
 		END;

BEGIN
                     IF user_name='admin' and passwd='admin'
                     THEN
                     	dbms_output.put_line(chr(13)||chr(10));
    		display();
                    ELSE
                              	dbms_output.put_line(chr(13)||chr(10));
		dbms_output.put_line('Invalid username or password.');
	END IF;
 END;
/
