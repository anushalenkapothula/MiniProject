DECLARE
 
	name varchar2(50);
	date_of_birth date;
	contact number;
	email varchar2(100);
	account_type varchar2(30);
 	address varchar2(100);
	passwd varchar2(100);
                     acc_num varchar2(10);
	random number;
	length_contact number;

PROCEDURE bal_update(acc_num number)
IS
BEGIN
	IF account_type='savings'
                THEN
		update admin_user_details set balance=100 where account_number=acc_num;
		update user_details set balance=100 where account_number=acc_num;
        ELSE 
		update admin_user_details set balance=200 where account_number=acc_num;
		update user_details set balance=200 where account_number=acc_num;
	    	
	END IF;
END;

PROCEDURE updation(acc_num number,passwd varchar2)
IS
BEGIN
	update admin_user_details set account_number=acc_num where password=passwd;
	update admin_user_details set creation_date=sysdate where password=passwd;
END;

 
PROCEDURE show(paaswd varchar2)
IS
    	CURSOR cur
    	IS
                     	SELECT account_number FROM user_details WHERE password=passwd;
                      	c_cur cur%rowtype;
    		BEGIN
            			OPEN cur;
            			LOOP
           	 		FETCH cur INTO acc_num;
            			EXIT WHEN cur%NOTFOUND;
                            		dbms_output.put_line(chr(13)||chr(10));
                     		dbms_output.put_line('Your account has been created');
                     		dbms_output.put_line(chr(13)||chr(10));
                    		DBMS_OUTPUT.PUT_LINE('      Your Account_Number is:    ' );
                            		dbms_output.put_line(chr(13)||chr(10));
                    		DBMS_OUTPUT.put_line(acc_num);
                    		END loop;
                    		CLOSE cur;
                        updation(acc_num,passwd);
			bal_update(acc_num);
    		END;
 

PROCEDURE insertion(name varchar2,passwd varchar2,dob date,cont number,email1 varchar2,acc_type varchar2,addr varchar2)
 IS
 
BEGIN
    	INSERT INTO USER_DETAILS(ACCOUNT_NUMBER,user_name,password,date_of_birth,contact,email,account_type,address)
    	VALUES(DBMS_RANDOM.VALUE(3008125445,4756809123),name,passwd,dob,cont,email1,acc_type,addr);
                     INSERT INTO ADMIN_USER_DETAILS(user_name,password,date_of_birth,contact,email,account_type,address)
    	VALUES(name,passwd,dob,cont,email1,acc_type,addr);
                     show(passwd);
END;


BEGIN
	name:='&name';
        passwd:='&password';
    	date_of_birth:='&date_of_birth';
    	contact:=&contact;
    	email:='&email';
    	account_type:='&account_type';
    	address:='&address';

	dbms_output.put_line(chr(13)||chr(10));
	
	select length(contact) INTO length_contact from dual;
	
	IF(length_contact = 10)
	THEN
	        IF (account_type = 'savings' or account_type = 'current')
		THEN
		    	insertion(name,passwd,date_of_birth ,contact,email,account_type,address);
		ELSE
		    	dbms_output.put_line('Enter account_type only as either "savings" or "current" ');
		END IF;
	ELSE
		    
		    dbms_output.put_line('Enter contact with 10 digits only');
		    
	END IF;	
    	dbms_output.put_line(chr(13)||chr(10));
EXCEPTION
WHEN OTHERS THEN
		    dbms_output.put_line(chr(13)||chr(10));
		    dbms_output.put_line('Date format should be only "DD-MMM-YYYY"(i.e., 11-JAN-1997) ');
END;

/