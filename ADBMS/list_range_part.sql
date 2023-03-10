CREATE TABLE emp_range_vikrant(
    emp_id NUMBER(10),
    emp_name VARCHAR2(30),
    emp_address VARCHAR2(55)
)
PARTITION BY RANGE (emp_id)(
    PARTITION p1 VALUES LESS THAN (100),
    PARTITION p2 VALUES LESS THAN (200),
    PARTITION p3 VALUES LESS THAN (300)
);

SELECT TABLE_NAME, PARTITION_NAME FROM USER_TAB_PARTITIONS WHERE TABLESPACE_NAME='USERS';

--INSERT COMMANDS

SELECT * FROM emp_range_vikrant;
SELECT * FROM emp_range_vikrant PARTITION(p2);


-- LIST Partitioning

CREATE TABLE emp_list_vikrant(
    emp_id NUMBER(10),
    emp_name VARCHAR2(30),
    emp_address VARCHAR2(55)
)
PARTITION BY LIST (emp_address)(
    PARTITION p1 VALUES  ('China','Vietnam'),
    PARTITION p2 VALUES  ('India','Nepal'),
    PARTITION p3 VALUES  ('USA','Canada')
);

SELECT TABLE_NAME, PARTITION_NAME FROM USER_TAB_PARTITIONS WHERE TABLESPACE_NAME='USERS';

--INSERT COMMANDS

SELECT * FROM emp_list_vikrant;
SELECT * FROM emp_list_vikrant PARTITION(p2);

