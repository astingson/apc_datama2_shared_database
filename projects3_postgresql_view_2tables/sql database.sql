CREATE DATABASE tokai_rika_ph;

SHOW TABLES;

SELECT * FROM employee;

CREATE TABLE person (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, first_name VARCHAR(45) NOT NULL,
	middle_name VARCHAR(45), last_name VARCHAR(45) NOT NULL, contact_number VARCHAR(15),
    address VARCHAR(80) NOT NULL, age INT(3) NOT NULL, birthdate VARCHAR(45) NOT NULL);

INSERT INTO person
	VALUES(1, 'Alana', 'Gay', 'Lara', 09187635601, '135 Andover Street
		Canal Winchester, OH 43110', 20, 'July 06, 1999');
        
INSERT INTO person
	VALUES(2, 'Steve', 'Grave', 'Frank', 09256632901, '380 High Ave.
		Chevy Chase, MD 20815', 36, 'November 28, 1983');
        
INSERT INTO person
	VALUES(3, 'Zain', 'Cole', 'Wiley', 09094567872, '9697 North Heather Drive
		Lake Villa, IL 60046', 25, 'March 06, 1994');
        
INSERT INTO person
	VALUES(4, 'Jayden', 'Moss', 'Park', 09983216791, '7436 Adams Dr.
		Severn, MD 21144', 40, 'October 20, 1979');

INSERT INTO person
	VALUES(5, 'Ricky', 'Joe', 'Ruiz', 09220923119, '749 County St.
		Buckeye, AZ 85326', 23, 'August 13, 1996');
    
CREATE TABLE employee (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, emp_idn VARCHAR(45) NOT NULL
	UNIQUE, person_id INT, position_id INT, FOREIGN KEY (person_id) REFERENCES person(id), 
    FOREIGN KEY (position_id) REFERENCES position (id));
    
INSERT INTO employee
	VALUES(1, '2015-000020', 3, 1);
    
INSERT INTO employee
	VALUES(2, '2005-000100', 2, 3);
    
INSERT INTO employee
	VALUES(3, '2019-100002', 4 ,5);
    
INSERT INTO employee
	VALUES(4, '2010-300450',2, 3);
    
INSERT INTO employee
	VALUES(5, '2014-204055',5,3);
    

SELECT employee.id, person.last_name, position.ranking
	FROM employee
		INNER JOIN person ON employee.person_id = person.id
        INNER JOIN position ON employee.position_id = position.id;
    
CREATE TABLE position (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, ranking VARCHAR(45), credentials VARCHAR(45));

INSERT INTO position
	VALUES(1, 'Intern', 'High School Diploma');
    
INSERT INTO position
	VALUES(2, 'Director', 'Doctorate Degree');

INSERT INTO position
	VALUES(3, 'Team Leader', 'College Degree');
    
INSERT INTO position
	VALUES(4, 'CEO', 'Doctorate Degree');
    
INSERT INTO position
	VALUES(5, 'Manager', 'College Degree');
	
CREATE VIEW employee_details;

SELECT
    last_name,
    contact_number,
    address,
    emp_idn,
    credentials
FROM
	employee
INNER JOIN
	person USING (id)
INNER JOIN
	position USING (id);

CREATE TABLE department (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, codename VARCHAR(45));

INSERT INTO department
	VALUES(1, 'TRP-QC');
    
INSERT INTO department
	VALUES(2, 'SUJI-TOSHI');
    
INSERT INTO department
	VALUES(3, 'PPAP');
    
INSERT INTO department
	VALUES(4, 'TRP-IN HOUSE');
    