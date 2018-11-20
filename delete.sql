 DECLARE
user_name varchar2(100):='&admin_name';
passwd varchar2(100):='&admin_password';
 acc_num number:=&account_number_to_be_deleted;
name varchar2(100);
balance number;

 PROCEDURE updation(acc_num  number)
 IS
 	CURSOR cur IS
 		SELECT user_name,balance FROM USER_DETAILS WHERE account_number = acc_num;
 		c_cur cur%rowtype;
		 BEGIN
    			OPEN cur;
    			LOOP
    			FETCH cur INTO c_cur;
    			EXIT WHEN cur%NOTFOUND;
                 			INSERT INTO deleted_accounts values(acc_num,c_cur.user_name,c_cur.balance,sysdate);
                                                            END LOOP;
            			CLOSE cur;
 		END;


PROCEDURE deletion(acc_num  number)
IS
	BEGIN
 		DELETE FROM user_details WHERE account_number=acc_num;
                                        DELETE FROM admin_user_details WHERE account_number=acc_num;
                 		dbms_output.put_line(chr(13)||chr(10));
                    	DBMS_OUTPUT.PUT_LINE('Account removed successfully.');
                 		dbms_output.put_line(chr(13)||chr(10));
 	END;
 
BEGIN
                     IF user_name='admin' and passwd='admin'
                     THEN
                     	dbms_output.put_line(chr(13)||chr(10));
                                         updation(acc_num);
    		deletion(acc_num);
                    ELSE 
                              	dbms_output.put_line(chr(13)||chr(10));
		dbms_output.put_line('Invalid username or password.');
	END IF;
 END;
/