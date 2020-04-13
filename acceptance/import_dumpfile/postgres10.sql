--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 12.2

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

--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "integer" bigint NOT NULL,
    "float" double precision NOT NULL,
    money money NOT NULL,
    "varchar" character varying(20) NOT NULL,
    text text NOT NULL,
    binary_type bytea,
    date date NOT NULL,
    time_with_timezone time with time zone NOT NULL,
    timestamp_with_timezone timestamp without time zone NOT NULL,
    "interval" interval NOT NULL,
    "boolean" boolean NOT NULL,
    point point NOT NULL,
    line line NOT NULL,
    lseg lseg NOT NULL,
    path path NOT NULL,
    polygon polygon NOT NULL,
    circle circle NOT NULL,
    inet inet NOT NULL,
    macaddr8 macaddr8 NOT NULL,
    "bit" bit varying(5) NOT NULL,
    tsvector tsvector NOT NULL,
    tsquery tsquery NOT NULL,
    uuid uuid NOT NULL,
    xml xml NOT NULL,
    json json NOT NULL,
    jsonb jsonb NOT NULL,
    "null" integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, "integer", "float", money, "varchar", text, binary_type, date, time_with_timezone, timestamp_with_timezone, "interval", "boolean", point, line, lseg, path, polygon, circle, inet, macaddr8, "bit", tsvector, tsquery, uuid, xml, json, jsonb, "null") FROM stdin;
1	123456	1.23344999999999994	$20.10	hogehogehoge	fugafugafuga	\\xdeadbeef	2020-04-12	17:00:00+02	2004-10-19 10:23:54	1 year 2 mons 3 days 04:05:06	t	(100,299)	{1,2,3}	[(10,10),(-30.1000000000000014,-20)]	[(20,10),(-1,2.29999999999999982)]	((20,10),(1.16999999999999993,-2))	<(100,20),2.60000000000000009>	2001:4f8:3:ba:2e0:81ff:fe22:d1f1	08:00:2b:ff:fe:01:02:03	101	'a' 'and' 'ate' 'cat' 'fat' 'mat' 'on' 'rat' 'sat'	'fat' & ( 'rat' | 'cat' )	a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11	<book><title>Manual</title><chapter>...</chapter></book>	{"bar": "baz", "balance": 7.77, "active": false}	{"reading": 0.00001230}	\N
-3	-12345	-1000.22130000000004	-$20.00	+++pi\tyo"""12344	aaaa\thog""'ho'ge++. aaa	\\x616263206b6c6d202aa954	1920-01-10	00:00:00+09	2004-10-19 10:23:54	00:00:10	f	(-100,-299.100000000000023)	{1.10000000000000009,-2,3}	[(0,0),(0,0)]	[(20,10),(-1,2.29999999999999982),(0,0)]	((90,1),(-1.12000000000000011,2))	<(-100,-20),21>	192.168.100.128/16	08:00:2b:ff:fe:01:02:03	100	'a':1,6,10 'and':8 'ate':9 'cat':3 'fat':2,11 'mat':7 'on':5 'rat':12 'sat':4	'super':*	d3d20743-f44c-44f8-b413-a3a2d3c4579a	abc<foo>bar</foo><bar>foo</bar>	{"foo": [true, "bar"], "tags": {"a": 1, "b": null}}	{"reading": 0.00001230}	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

