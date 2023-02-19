
CREATE TYPE personal_detail AS OBJECT(name VARCHAR2(10), address VARCHAR2(10));

CREATE TABLE employee_vikrant(id NUMBER(3), detail personal_detail);

desc employee_vikrant;

INSERT INTO employee_vikrant VALUES(1, personal_detail ('Vikrant','Kalyan')); 
INSERT INTO employee_vikrant VALUES(2, personal_detail ('Barbara','Russia')); 
INSERT INTO employee_vikrant VALUES(3, personal_detail ('David','Japan')); 
INSERT INTO employee_vikrant VALUES(4, personal_detail ('Phoenix','France')); 
INSERT INTO employee_vikrant VALUES(5, personal_detail ('Dave','India')); 
INSERT INTO employee_vikrant VALUES(6, personal_detail ('Stuart','Europe')); 
INSERT INTO employee_vikrant VALUES(7, personal_detail ('Ramierez','USA')); 
INSERT INTO employee_vikrant VALUES(8, personal_detail ('Skyler','Australia')); 
INSERT INTO employee_vikrant VALUES(9, personal_detail ('Walter','UK')); 	
INSERT INTO employee_vikrant VALUES(10, personal_detail ('Peter','Russia')); 


UPDATE employee_vikrant e set e.detail.name = 'Jones' WHERE id=2;

SELECT * FROM employee_vikrant;

DELETE FROM employee_vikrant WHERE id = 4;

SELECT * FROM employee_vikrant;

ALTER TYPE personal_detail ADD ATTRIBUTE(street VARCHAR2(10)) CASCADE ;
ALTER TYPE personal_detail ADD ATTRIBUTE(city VARCHAR2(10)) CASCADE ;
ALTER TYPE personal_detail ADD ATTRIBUTE(state VARCHAR2(10)) CASCADE; 
ALTER TYPE personal_detail ADD ATTRIBUTE(pin NUMBER(6)) CASCADE ;
ALTER TYPE personal_detail ADD ATTRIBUTE(country VARCHAR2(10)) CASCADE; 

DESC personal_detail; 

ALTER TYPE personal_detail MODIFY ATTRIBUTE(country VARCHAR2(30)) CASCADE; 

DESC personal_detail; 

CREATE TYPE type_name AS OBJECT(
    fname VARCHAR2(20),
    mname VARCHAR2(20),
    lname VARCHAR2(20)
);

CREATE TYPE type_address AS OBJECT(
    street VARCHAR2(20),
    city VARCHAR2(20),
    pincode  NUMBER(10)
);

CREATE TABLE customer_vikrant(
    c_id NUMBER(5),
    c_name type_name,
    c_add type_address,
    c_phno NUMBER(10)
);

DESC customer_vikrant;

INSERT INTO customer_vikrant VALUES(1,
    type_name('Vikrant', 'Shiv', 'INS'),
    type_address('RNC Marg', 'Chembur',400071),
    9999999999);
INSERT INTO customer_vikrant VALUES(2,
    type_name('Ramesh', 'Suresh', 'Singh'),
    type_address('Navjeevan Society', 'Chembur',400071),
    9999999999);
INSERT INTO customer_vikrant VALUES(3,
    type_name('Suresh', 'Ram', 'Singh'),
    type_address('Chembur Colony', 'Chembur',400071),
    9999999999);
INSERT INTO customer_vikrant VALUES(4,
    type_name('Ram', 'Shyam', 'Singh'),
    type_address('Kamgar Society', 'Chembur',400070),
    9999999999);

SELECT * FROM customer_vikrant;

SELECT c.c_add.street FROM customer_vikrant c WHERE c_id=1;

SELECT c.c_name.fname FROM customer_vikrant c WHERE c_id=1;

SELECT c_name FROM customer_vikrant;

SELECT c.c_name.fname||' '||c.c_name.mname||' '||c.c_name.lname FROM customer_vikrant c;

CREATE OR REPLACE TYPE animal_type AS OBJECT(
    breed VARCHAR2(25),
    name VARCHAR2(25),
    birthday DATE
);

CREATE TABLE animal_vikrant of animal_type;

INSERT INTO animal_vikrant VALUES('Husky','Sam','24-Jul-2014');
INSERT INTO animal_vikrant VALUES('Labrador','Ronny','12-Jul-2017');
INSERT INTO animal_vikrant VALUES('Bulldog','Tom','01-Jul-2014');

SELECT * FROM animal_vikrant ;

SELECT REF(A) FROM animal_vikrant A;

CREATE TABLE keeper_vikrant(
    keeper_name VARCHAR2(25),
    animal_kept REF animal_type
);

DESC keeper_vikrant;

INSERT INTO keeper_vikrant SELECT 'CATHERINE', REF(A) FROM animal_vikrant A WHERE name='Tom';

SELECT * FROM keeper_vikrant;

SELECT keeper_name, DEREF(K.animal_kept) FROM keeper_vikrant K;

CREATE OR REPLACE TYPE AddressType AS OBJECT (
  street VARCHAR2(15),
  city   VARCHAR2(15),
  state  CHAR(2),
  zip    VARCHAR2(6)
);

CREATE OR REPLACE TYPE PersonType AS OBJECT (
  id         NUMBER,
  first_name VARCHAR2(10),
  last_name  VARCHAR2(10),
  dob        DATE,
  phone      VARCHAR2(12),
  address    AddressType
) NOT FINAL;

CREATE OR REPLACE TYPE business_PersonType UNDER PersonType (
  title   VARCHAR2(20),
  company VARCHAR2(20)
);

CREATE TABLE object_business_customers_pmi OF business_PersonType;

INSERT INTO object_business_customers_pmi VALUES (
  business_PersonType(1, 'John', 'Brown', '01-FEB-1933', '800-555-3333',
  AddressType('2 Ave', 'town', 'MA', '12345'),'Manager', 'XYZ Corp')
);

INSERT INTO object_business_customers_pmi VALUES (
  business_PersonType(1, 'Vikrant', 'INS', '01-FEB-2001', '800-555-3333',
  AddressType('RNC Marg', 'Chembur', 'MH', '400071'),'Manager', 'XYZ Corp')
);

SELECT * FROM object_business_customers_pmi;