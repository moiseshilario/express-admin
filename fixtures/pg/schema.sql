--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: sofisa_schema; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA sofisa_schema;


ALTER SCHEMA sofisa_schema OWNER TO root;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: FormFields; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE "FormFields" (
    form_field_id character varying(255) NOT NULL,
    label character varying(255),
    form_id character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE "FormFields" OWNER TO root;

--
-- Name: FormSubmissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE "FormSubmissions" (
    loan_id character varying(255) NOT NULL,
    current_page integer,
    user_id uuid,
    form_id character varying(255),
    fields jsonb[],
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE "FormSubmissions" OWNER TO root;

--
-- Name: Forms; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE "Forms" (
    form_id character varying(255) NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE "Forms" OWNER TO root;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE "SequelizeMeta" OWNER TO root;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE "Users" (
    user_id uuid NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE "Users" OWNER TO root;

SET search_path = sofisa_schema, pg_catalog;

--
-- Name: form; Type: TABLE; Schema: sofisa_schema; Owner: root
--

CREATE TABLE form (
    form_id character varying NOT NULL
);


ALTER TABLE form OWNER TO root;

SET search_path = public, pg_catalog;

--
-- Name: FormFields FormFields_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "FormFields"
    ADD CONSTRAINT "FormFields_pkey" PRIMARY KEY (form_field_id);


--
-- Name: FormSubmissions FormSubmissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "FormSubmissions"
    ADD CONSTRAINT "FormSubmissions_pkey" PRIMARY KEY (loan_id);


--
-- Name: Forms Forms_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "Forms"
    ADD CONSTRAINT "Forms_pkey" PRIMARY KEY (form_id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


SET search_path = sofisa_schema, pg_catalog;

--
-- Name: form pk_form_form_id; Type: CONSTRAINT; Schema: sofisa_schema; Owner: root
--

ALTER TABLE ONLY form
    ADD CONSTRAINT pk_form_form_id PRIMARY KEY (form_id);


SET search_path = public, pg_catalog;

--
-- Name: FormFields FormFields_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "FormFields"
    ADD CONSTRAINT "FormFields_form_id_fkey" FOREIGN KEY (form_id) REFERENCES "Forms"(form_id);


--
-- Name: FormSubmissions FormSubmissions_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "FormSubmissions"
    ADD CONSTRAINT "FormSubmissions_form_id_fkey" FOREIGN KEY (form_id) REFERENCES "Forms"(form_id);


--
-- Name: FormSubmissions FormSubmissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "FormSubmissions"
    ADD CONSTRAINT "FormSubmissions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "Users"(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: Hilario
--

GRANT ALL ON SCHEMA public TO root;


--
-- PostgreSQL database dump complete
--

