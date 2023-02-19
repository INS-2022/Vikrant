CREATE TABLE emp_hash_vikrant (
    emp_id NUMBER(5),
    emp_name VARCHAR2(20),
    dept VARCHAR2(10),
    location VARCHAR2(10),
    doj DATE
) PARTITION BY HASH(emp_id);

INSERT INTO emp_hash_vikrant VALUES 
(100,'Employee 1','dept1','Chembur',TO_DATE('01/01/2022','DD/MM/YYYY'));
INSERT INTO emp_hash_vikrant VALUES 
(100,'Employee 2','dept1','Borivali',TO_DATE('02/02/2022','DD/MM/YYYY'));
INSERT INTO emp_hash_vikrant VALUES 
(100,'Employee 3','dept1','Andheri',TO_DATE('03/03/2022','DD/MM/YYYY'));
INSERT INTO emp_hash_vikrant VALUES 
(100,'Employee 4','dept2','Kurla',TO_DATE('04/04/2022','DD/MM/YYYY'));
INSERT INTO emp_hash_vikrant VALUES 
(100,'Employee 5','dept2','Diva',TO_DATE('05/05/2022','DD/MM/YYYY'));

SELECT * FROM emp_hash_vikrant;

SELECT TABLE_NAME,PARTITION_NAME FROM USER_TAB_PARTITIONS WHERE TABLESPACE_NAME='USERS';

--FETCH Partition from select stmt
SELECT * FROM emp_hash_vikrant PARTITION(SYS_P92);