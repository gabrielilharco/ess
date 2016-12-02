--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: q1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q1 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q10; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q10 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q10_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q10_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q10_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q10_id_seq OWNED BY q10.id;


--
-- Name: q1_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q1_id_seq OWNED BY q1.id;


--
-- Name: q2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q2 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q2_id_seq OWNED BY q2.id;


--
-- Name: q3; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q3 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q3_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q3_id_seq OWNED BY q3.id;


--
-- Name: q4; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q4 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q4_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q4_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q4_id_seq OWNED BY q4.id;


--
-- Name: q5; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q5 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q5_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q5_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q5_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q5_id_seq OWNED BY q5.id;


--
-- Name: q6; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q6 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q6_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q6_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q6_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q6_id_seq OWNED BY q6.id;


--
-- Name: q7; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q7 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q7_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q7_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q7_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q7_id_seq OWNED BY q7.id;


--
-- Name: q8; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q8 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q8_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q8_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q8_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q8_id_seq OWNED BY q8.id;


--
-- Name: q9; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE q9 (
    id integer NOT NULL,
    key integer NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: q9_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE q9_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q9_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE q9_id_seq OWNED BY q9.id;


--
-- Name: survey; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE survey (
    id integer NOT NULL,
    "Q1_id" integer NOT NULL,
    "Q10_id" integer NOT NULL,
    "Q2_id" integer NOT NULL,
    "Q3_id" integer NOT NULL,
    "Q4_id" integer NOT NULL,
    "Q5_id" integer NOT NULL,
    "Q6_id" integer NOT NULL,
    "Q7_id" integer NOT NULL,
    "Q8_id" integer NOT NULL,
    "Q9_id" integer NOT NULL,
    cntry character varying(10) NOT NULL,
    dweight double precision NOT NULL,
    idno integer NOT NULL,
    name character varying(20) NOT NULL,
    pspwght double precision NOT NULL,
    pweight double precision NOT NULL
);


--
-- Name: survey_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE survey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE survey_id_seq OWNED BY survey.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: q1 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q1 ALTER COLUMN id SET DEFAULT nextval('q1_id_seq'::regclass);


--
-- Name: q10 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q10 ALTER COLUMN id SET DEFAULT nextval('q10_id_seq'::regclass);


--
-- Name: q2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q2 ALTER COLUMN id SET DEFAULT nextval('q2_id_seq'::regclass);


--
-- Name: q3 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q3 ALTER COLUMN id SET DEFAULT nextval('q3_id_seq'::regclass);


--
-- Name: q4 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q4 ALTER COLUMN id SET DEFAULT nextval('q4_id_seq'::regclass);


--
-- Name: q5 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q5 ALTER COLUMN id SET DEFAULT nextval('q5_id_seq'::regclass);


--
-- Name: q6 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q6 ALTER COLUMN id SET DEFAULT nextval('q6_id_seq'::regclass);


--
-- Name: q7 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q7 ALTER COLUMN id SET DEFAULT nextval('q7_id_seq'::regclass);


--
-- Name: q8 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q8 ALTER COLUMN id SET DEFAULT nextval('q8_id_seq'::regclass);


--
-- Name: q9 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY q9 ALTER COLUMN id SET DEFAULT nextval('q9_id_seq'::regclass);


--
-- Name: survey id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey ALTER COLUMN id SET DEFAULT nextval('survey_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: q10 q10_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q10
    ADD CONSTRAINT q10_key_key UNIQUE (key);


--
-- Name: q10 q10_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q10
    ADD CONSTRAINT q10_pkey PRIMARY KEY (id);


--
-- Name: q1 q1_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q1
    ADD CONSTRAINT q1_key_key UNIQUE (key);


--
-- Name: q1 q1_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q1
    ADD CONSTRAINT q1_pkey PRIMARY KEY (id);


--
-- Name: q2 q2_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q2
    ADD CONSTRAINT q2_key_key UNIQUE (key);


--
-- Name: q2 q2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q2
    ADD CONSTRAINT q2_pkey PRIMARY KEY (id);


--
-- Name: q3 q3_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q3
    ADD CONSTRAINT q3_key_key UNIQUE (key);


--
-- Name: q3 q3_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q3
    ADD CONSTRAINT q3_pkey PRIMARY KEY (id);


--
-- Name: q4 q4_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q4
    ADD CONSTRAINT q4_key_key UNIQUE (key);


--
-- Name: q4 q4_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q4
    ADD CONSTRAINT q4_pkey PRIMARY KEY (id);


--
-- Name: q5 q5_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q5
    ADD CONSTRAINT q5_key_key UNIQUE (key);


--
-- Name: q5 q5_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q5
    ADD CONSTRAINT q5_pkey PRIMARY KEY (id);


--
-- Name: q6 q6_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q6
    ADD CONSTRAINT q6_key_key UNIQUE (key);


--
-- Name: q6 q6_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q6
    ADD CONSTRAINT q6_pkey PRIMARY KEY (id);


--
-- Name: q7 q7_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q7
    ADD CONSTRAINT q7_key_key UNIQUE (key);


--
-- Name: q7 q7_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q7
    ADD CONSTRAINT q7_pkey PRIMARY KEY (id);


--
-- Name: q8 q8_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q8
    ADD CONSTRAINT q8_key_key UNIQUE (key);


--
-- Name: q8 q8_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q8
    ADD CONSTRAINT q8_pkey PRIMARY KEY (id);


--
-- Name: q9 q9_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q9
    ADD CONSTRAINT q9_key_key UNIQUE (key);


--
-- Name: q9 q9_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY q9
    ADD CONSTRAINT q9_pkey PRIMARY KEY (id);


--
-- Name: survey survey_idno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT survey_idno_key UNIQUE (idno);


--
-- Name: survey survey_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT survey_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: survey_1c9b76c3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_1c9b76c3 ON survey USING btree ("Q8_id");


--
-- Name: survey_40e47823; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_40e47823 ON survey USING btree ("Q6_id");


--
-- Name: survey_44ea2974; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_44ea2974 ON survey USING btree ("Q10_id");


--
-- Name: survey_6e11bb24; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_6e11bb24 ON survey USING btree ("Q9_id");


--
-- Name: survey_9f80470f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_9f80470f ON survey USING btree ("Q4_id");


--
-- Name: survey_adcbe815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_adcbe815 ON survey USING btree ("Q3_id");


--
-- Name: survey_b770e4e9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_b770e4e9 ON survey USING btree ("Q1_id");


--
-- Name: survey_c39f77d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_c39f77d4 ON survey USING btree ("Q2_id");


--
-- Name: survey_e9f09526; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_e9f09526 ON survey USING btree ("Q7_id");


--
-- Name: survey_ff95956a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX survey_ff95956a ON survey USING btree ("Q5_id");


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q10_id_f123e64b_fk_q10_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q10_id_f123e64b_fk_q10_id" FOREIGN KEY ("Q10_id") REFERENCES q10(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q1_id_7378c99e_fk_q1_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q1_id_7378c99e_fk_q1_id" FOREIGN KEY ("Q1_id") REFERENCES q1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q2_id_f39e2f18_fk_q2_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q2_id_f39e2f18_fk_q2_id" FOREIGN KEY ("Q2_id") REFERENCES q2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q3_id_eff54cb1_fk_q3_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q3_id_eff54cb1_fk_q3_id" FOREIGN KEY ("Q3_id") REFERENCES q3(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q4_id_7d1e5132_fk_q4_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q4_id_7d1e5132_fk_q4_id" FOREIGN KEY ("Q4_id") REFERENCES q4(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q5_id_e4e0a23f_fk_q5_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q5_id_e4e0a23f_fk_q5_id" FOREIGN KEY ("Q5_id") REFERENCES q5(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q6_id_78cd000d_fk_q6_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q6_id_78cd000d_fk_q6_id" FOREIGN KEY ("Q6_id") REFERENCES q6(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q7_id_8f070a0c_fk_q7_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q7_id_8f070a0c_fk_q7_id" FOREIGN KEY ("Q7_id") REFERENCES q7(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q8_id_7803f828_fk_q8_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q8_id_7803f828_fk_q8_id" FOREIGN KEY ("Q8_id") REFERENCES q8(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey survey_Q9_id_6f34afc0_fk_q9_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT "survey_Q9_id_6f34afc0_fk_q9_id" FOREIGN KEY ("Q9_id") REFERENCES q9(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

