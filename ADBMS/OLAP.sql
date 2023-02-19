
CREATE TABLE analytical_query_vikrant(
    empId NUMBER(5),
    dept NUMBER(5),
    bday DATE,
    salary NUMBER(10),
    commission NUMBER(5),
    job_desc  VARCHAR2(10)
);

INSERT INTO analytical_query_vikrant VALUES(1,10,'8-Aug-2000',23000,3000,'Executive');
INSERT INTO analytical_query_vikrant VALUES(2,11,'5-Jul-1997',46000,6000,'Director');
INSERT INTO analytical_query_vikrant VALUES(3,11,'10-Aug-1990',54000,6000,'Manager');
INSERT INTO analytical_query_vikrant VALUES(4,10,'8-Aug-1978',23000,3000,'Executive');
INSERT INTO analytical_query_vikrant VALUES(5,11,'5-Jul-1997',46000,6000,'Director');
INSERT INTO analytical_query_vikrant VALUES(6,10,'10-Aug-1982',54000,6000,'Manager');
INSERT INTO analytical_query_vikrant VALUES(7,10,'8-Aug-2000',23000,3000,'Executive');
INSERT INTO analytical_query_vikrant VALUES(8,11,'5-Jul-1997',46000,6000,'Director');



--ROLLUP
SELECT dept, job_desc, COUNT(*), SUM(salary) from analytical_query_vikrant GROUP BY ROLLUP(dept, job_desc);

--CUBE
SELECT dept, job_desc, COUNT(*), SUM(salary) from analytical_query_vikrant GROUP BY CUBE(dept, job_desc);

--RANK
SELECT empId, dept, salary, commission, RANK() OVER(PARTITION BY dept ORDER BY salary) AS rank FROM analytical_query_vikrant;

--UPDATE
UPDATE analytical_query_vikrant SET salary = 24500 WHERE empId=7;
UPDATE analytical_query_vikrant SET salary = 43500 WHERE empId=3;
SELECT * FROM analytical_query_vikrant;

--RANK
SELECT empId, dept, salary, commission, RANK() OVER(PARTITION BY dept ORDER BY salary) AS rank FROM analytical_query_vikrant;

SELECT empId, dept, salary, commission, DENSE_RANK() OVER(PARTITION BY dept ORDER BY salary) AS rank FROM analytical_query_vikrant;\

--LEAD
SELECT empId, bday, LEAD(bday, 1) OVER (ORDER BY bday) AS "next" FROM analytical_query_vikrant;

SELECT empId, bday, LEAD(bday, 1) OVER (ORDER BY bday) AS "next" FROM analytical_query_vikrant WHERE dept=10;

--LAG
SELECT empId, bday, LAG(bday, 1) OVER (ORDER BY bday) AS "previous" FROM analytical_query_vikrant WHERE dept=10;

SELECT empId, bday, LAG(bday, 1) OVER (ORDER BY bday) AS "previous" FROM analytical_query_vikrant;

--FIRST
SELECT dept, salary, MAX(salary) KEEP (DENSE_RANK FIRST ORDER BY salary DESC) OVER (PARTITION BY dept) "max" FROM analytical_query_vikrant;

--LAST
SELECT dept, salary, MIN(salary) KEEP (DENSE_RANK LAST ORDER BY salary DESC) OVER (PARTITION BY dept) "min" FROM analytical_query_vikrant;

