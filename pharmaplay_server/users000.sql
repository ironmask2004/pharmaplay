--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users000; Type: TABLE; Schema: pharmaplay; Owner: pharmaadmin
--

CREATE TABLE pharmaplay.users000 (
    idx integer NOT NULL,
    id character varying(512) NOT NULL,
    firstname character varying(256) NOT NULL,
    lastname character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    password character varying(512) NOT NULL,
    salt character varying(256),
    mobile character varying(56),
    createdate numeric(20,0),
    updatedate numeric(20,0)
);


ALTER TABLE pharmaplay.users000 OWNER TO pharmaadmin;

--
-- Name: TABLE users000; Type: COMMENT; Schema: pharmaplay; Owner: pharmaadmin
--

COMMENT ON TABLE pharmaplay.users000 IS 'SELECT  createdate,  current_timestamp, 
TIMESTAMP WITHOUT TIME ZONE ''epoch'' + ( updatedate   * INTERVAL ''1 millisecond''  ), updatedate,
TIMESTAMP WITH TIME ZONE ''epoch''  -  86400000 *10 * INTERVAL ''1 millisecond''  , updatedate
FROM pharmaplay.users000;';


--
-- Name: users000__id_seq; Type: SEQUENCE; Schema: pharmaplay; Owner: pharmaadmin
--

ALTER TABLE pharmaplay.users000 ALTER COLUMN idx ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME pharmaplay.users000__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: users000; Type: TABLE DATA; Schema: pharmaplay; Owner: pharmaadmin
--

COPY pharmaplay.users000 (idx, id, firstname, lastname, email, password, salt, mobile, createdate, updatedate) FROM stdin;
15	618efa44a3a22765ecc20d25	khawled	flihwan	kfwlihan@gmail.com	c1538fcea1128aedcd3ad3043e2fb76c97791e388ada8b1b1b5b237ecf4a2aa7	tHbxzu4/mw+ruYtH7UcJ4VQHPJqOPFIfUaaXKnUsxEI=	093963f838	1636760132571	1636760132571
\.


--
-- Name: users000__id_seq; Type: SEQUENCE SET; Schema: pharmaplay; Owner: pharmaadmin
--

SELECT pg_catalog.setval('pharmaplay.users000__id_seq', 15, true);


--
-- Name: users000 users000_pkey; Type: CONSTRAINT; Schema: pharmaplay; Owner: pharmaadmin
--

ALTER TABLE ONLY pharmaplay.users000
    ADD CONSTRAINT users000_pkey PRIMARY KEY (idx);


--
-- Name: users_email_index_001; Type: INDEX; Schema: pharmaplay; Owner: pharmaadmin
--

CREATE UNIQUE INDEX users_email_index_001 ON pharmaplay.users000 USING btree (email);


--
-- Name: users_id_index_001; Type: INDEX; Schema: pharmaplay; Owner: pharmaadmin
--

CREATE UNIQUE INDEX users_id_index_001 ON pharmaplay.users000 USING btree (id);


--
-- Name: users_name_f_l_index_001; Type: INDEX; Schema: pharmaplay; Owner: pharmaadmin
--

CREATE UNIQUE INDEX users_name_f_l_index_001 ON pharmaplay.users000 USING btree (firstname, lastname);


--
-- Name: TABLE users000; Type: ACL; Schema: pharmaplay; Owner: pharmaadmin
--

GRANT ALL ON TABLE pharmaplay.users000 TO pharmauser;


--
-- PostgreSQL database dump complete
--

