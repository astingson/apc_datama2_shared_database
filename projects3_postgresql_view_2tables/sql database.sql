--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-02 14:09:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 15 (class 2615 OID 16733)
-- Name: astingson; Type: SCHEMA; Schema: -; Owner: datama2mi182
--

CREATE SCHEMA astingson;


ALTER SCHEMA astingson OWNER TO datama2mi182;

--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 15
-- Name: SCHEMA astingson; Type: COMMENT; Schema: -; Owner: datama2mi182
--

COMMENT ON SCHEMA astingson IS 'dfdfwdaf
';


SET default_tablespace = '';

--
-- TOC entry 277 (class 1259 OID 19974)
-- Name: department; Type: TABLE; Schema: astingson; Owner: datama2mi182
--

CREATE TABLE astingson.department (
    id integer NOT NULL,
    codename character varying(45)
);


ALTER TABLE astingson.department OWNER TO datama2mi182;

--
-- TOC entry 278 (class 1259 OID 19979)
-- Name: employee; Type: TABLE; Schema: astingson; Owner: datama2mi182
--

CREATE TABLE astingson.employee (
    id integer NOT NULL,
    emp_idn character varying(45) NOT NULL,
    person_id integer,
    position_id integer,
    department_id integer
);


ALTER TABLE astingson.employee OWNER TO datama2mi182;

--
-- TOC entry 275 (class 1259 OID 19888)
-- Name: person; Type: TABLE; Schema: astingson; Owner: datama2mi182
--

CREATE TABLE astingson.person (
    id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    middle_name character varying(45),
    last_name character varying(45) NOT NULL,
    contact_number character varying(15),
    address character varying(80) NOT NULL,
    age integer NOT NULL,
    birthdate character varying(45) NOT NULL
);


ALTER TABLE astingson.person OWNER TO datama2mi182;

--
-- TOC entry 276 (class 1259 OID 19952)
-- Name: position; Type: TABLE; Schema: astingson; Owner: datama2mi182
--

CREATE TABLE astingson."position" (
    id integer NOT NULL,
    ranking character varying(45),
    credentials character varying(45)
);


ALTER TABLE astingson."position" OWNER TO datama2mi182;

--
-- TOC entry 282 (class 1259 OID 20025)
-- Name: employee_details; Type: VIEW; Schema: astingson; Owner: datama2mi182
--

CREATE VIEW astingson.employee_details AS
 SELECT person.last_name,
    person.contact_number,
    person.address,
    employee.emp_idn,
    "position".credentials
   FROM ((astingson.employee
     JOIN astingson.person USING (id))
     JOIN astingson."position" USING (id));


ALTER TABLE astingson.employee_details OWNER TO datama2mi182;

--
-- TOC entry 4055 (class 0 OID 19974)
-- Dependencies: 277
-- Data for Name: department; Type: TABLE DATA; Schema: astingson; Owner: datama2mi182
--

COPY astingson.department (id, codename) FROM stdin;
1	TRP-QC
2	SUJI-TOSHI
3	PPAP
4	TRP-IN HOUSE
\.


--
-- TOC entry 4056 (class 0 OID 19979)
-- Dependencies: 278
-- Data for Name: employee; Type: TABLE DATA; Schema: astingson; Owner: datama2mi182
--

COPY astingson.employee (id, emp_idn, person_id, position_id, department_id) FROM stdin;
1	2015-000020	3	1	1
2	2005-000100	2	3	2
3	2019-100002	4	5	4
4	2010-300450	2	3	4
5	2014-204055	5	3	3
\.


--
-- TOC entry 4053 (class 0 OID 19888)
-- Dependencies: 275
-- Data for Name: person; Type: TABLE DATA; Schema: astingson; Owner: datama2mi182
--

COPY astingson.person (id, first_name, middle_name, last_name, contact_number, address, age, birthdate) FROM stdin;
1	Alana	Gay	Lara	9187635601	135 Andover Street\n\t\tCanal Winchester, OH 43110	20	July 06, 1999
2	Steve	Grave	Frank	9256632901	380 High Ave.\n\t\tChevy Chase, MD 20815	36	November 28, 1983
3	Zain	Cole	Wiley	9094567872	9697 North Heather Drive\n\t\tLake Villa, IL 60046	25	March 06, 1994
4	Jayden	Moss	Park	9983216791	7436 Adams Dr.\n\t\tSevern, MD 21144	40	October 20, 1979
5	Ricky	Joe	Ruiz	9220923119	749 County St.\n\t\tBuckeye, AZ 85326	23	August 13, 1996
\.


--
-- TOC entry 4054 (class 0 OID 19952)
-- Dependencies: 276
-- Data for Name: position; Type: TABLE DATA; Schema: astingson; Owner: datama2mi182
--

COPY astingson."position" (id, ranking, credentials) FROM stdin;
1	Intern	High School Diploma
2	Director	Doctorate Degree
3	Team Leader	College Degree
4	CEO	Doctorate Degree
5	Manager	College Degree
\.


--
-- TOC entry 3886 (class 2606 OID 19978)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- TOC entry 3888 (class 2606 OID 19985)
-- Name: employee employee_emp_idn_key; Type: CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson.employee
    ADD CONSTRAINT employee_emp_idn_key UNIQUE (emp_idn);


--
-- TOC entry 3890 (class 2606 OID 19983)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3882 (class 2606 OID 19892)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3884 (class 2606 OID 19956)
-- Name: position position_pkey; Type: CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- TOC entry 3893 (class 2606 OID 19996)
-- Name: employee employee_department_id_fkey; Type: FK CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson.employee
    ADD CONSTRAINT employee_department_id_fkey FOREIGN KEY (department_id) REFERENCES astingson.department(id);


--
-- TOC entry 3891 (class 2606 OID 19986)
-- Name: employee employee_person_id_fkey; Type: FK CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson.employee
    ADD CONSTRAINT employee_person_id_fkey FOREIGN KEY (person_id) REFERENCES astingson.person(id);


--
-- TOC entry 3892 (class 2606 OID 19991)
-- Name: employee employee_position_id_fkey; Type: FK CONSTRAINT; Schema: astingson; Owner: datama2mi182
--

ALTER TABLE ONLY astingson.employee
    ADD CONSTRAINT employee_position_id_fkey FOREIGN KEY (position_id) REFERENCES astingson."position"(id);


-- Completed on 2019-12-02 14:09:23

--
-- PostgreSQL database dump complete
--

