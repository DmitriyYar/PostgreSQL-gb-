--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    creator_id integer,
    created_at character varying(255)
);


ALTER TABLE public.communities OWNER TO dmitry;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO dmitry;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.communities_users (
    id integer NOT NULL,
    community_id integer,
    user_id integer,
    created_at character varying(255)
);


ALTER TABLE public.communities_users OWNER TO dmitry;

--
-- Name: communities_users_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.communities_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_users_id_seq OWNER TO dmitry;

--
-- Name: communities_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.communities_users_id_seq OWNED BY public.communities_users.id;


--
-- Name: friendship; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer,
    requested_to_user_id integer,
    status_id integer,
    requested_at character varying(255),
    confirmed_at character varying(255)
);


ALTER TABLE public.friendship OWNER TO dmitry;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO dmitry;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.friendship_statuses OWNER TO dmitry;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO dmitry;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer,
    to_user_id integer,
    body text,
    is_important character varying(255) DEFAULT NULL::character varying,
    is_delivered character varying(255) DEFAULT NULL::character varying,
    created_at character varying(255)
);


ALTER TABLE public.messages OWNER TO dmitry;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO dmitry;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(255),
    owner_id integer,
    description text,
    uploaded_at character varying(255),
    size integer
);


ALTER TABLE public.photo OWNER TO dmitry;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO dmitry;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT NULL::character varying,
    last_name character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    phone character varying(100) DEFAULT NULL::character varying,
    main_photo integer,
    created_at character varying(255)
);


ALTER TABLE public.users OWNER TO dmitry;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dmitry;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: dmitry
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(255),
    owner_id integer,
    description text,
    uploaded_at character varying(255),
    size integer
);


ALTER TABLE public.video OWNER TO dmitry;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitry
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO dmitry;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitry
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: communities_users id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.communities_users ALTER COLUMN id SET DEFAULT nextval('public.communities_users_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	Keiko Garner	94	2024-04-08 09:34:38
2	Natalie Pickett	11	2022-07-28 12:20:59
3	Judah Ray	71	2023-06-09 22:14:34
4	Shad Colon	89	2022-07-01 04:31:06
5	Martha Harding	35	2023-02-18 05:50:21
6	Tasha Rocha	34	2023-04-12 01:31:32
7	David Valdez	65	2024-01-08 19:41:35
8	Shelley Dyer	42	2022-07-12 08:06:13
9	Paula Mays	62	2023-03-12 18:23:18
10	Ian Page	48	2023-12-30 10:06:04
11	Kato Farley	78	2023-09-17 12:18:41
12	Beau Gentry	90	2023-02-25 12:26:04
13	Wanda Horn	26	2023-04-12 02:47:24
14	Julian Henderson	48	2023-12-24 02:38:14
15	Gwendolyn Baird	15	2022-06-08 21:42:58
16	Ross Wade	45	2023-12-17 03:37:58
17	Callum Rice	89	2023-03-02 21:39:35
18	Jared Becker	79	2023-04-06 06:20:53
19	Burton Bates	99	2023-02-12 22:30:33
20	Erasmus Hopkins	75	2023-03-09 15:14:59
21	Hillary White	43	2024-03-07 12:39:36
22	April Dalton	86	2024-02-12 05:50:47
23	Norman Daniel	96	2022-12-10 10:05:13
24	Nora Boyle	40	2024-02-08 19:41:45
25	Dennis Sharpe	40	2023-03-22 22:45:10
26	Emi Atkinson	12	2023-08-01 21:55:53
27	Nyssa Daniels	68	2024-03-01 20:48:55
28	Chaim Brennan	69	2023-12-17 09:23:21
29	Hop Long	8	2022-10-21 00:18:45
30	Matthew Glenn	28	2022-05-27 19:56:57
31	Yen Potter	93	2024-03-02 13:10:47
32	Chandler Taylor	15	2023-12-14 21:52:39
33	Levi Barlow	64	2023-03-03 21:40:51
34	Ulla Ferguson	9	2023-09-19 02:09:42
35	Griffith Ortiz	23	2023-09-14 09:29:09
36	Sebastian Cameron	30	2022-11-02 03:57:32
37	Akeem Hull	35	2024-02-28 14:07:21
38	Davis Williams	86	2024-02-02 22:17:07
39	Darryl Snow	37	2022-09-17 08:58:42
40	Melissa Mcgowan	63	2022-07-29 00:40:47
41	Oren Sanders	34	2023-06-05 20:04:21
42	Odysseus Rosales	80	2023-03-30 15:46:24
43	Talon Arnold	19	2022-08-17 22:47:23
44	Shelby Simon	55	2024-01-31 12:35:55
45	Kimberly Carver	36	2024-02-06 16:45:03
46	Bernard Cote	4	2023-04-05 01:15:29
47	Nomlanga Branch	70	2022-08-03 12:54:15
48	Burton Kramer	78	2023-11-18 12:08:24
49	Wang Hamilton	23	2022-11-18 17:38:20
50	Jarrod Hess	81	2022-11-24 11:09:20
51	Zelda Hutchinson	1	2023-06-23 03:42:23
52	Cruz Copeland	59	2022-12-21 08:50:45
53	Brenda Merritt	27	2023-11-09 03:49:52
54	Ezra Watson	18	2023-06-09 12:59:53
55	Janna Donovan	7	2022-10-14 08:35:35
56	Roanna Franco	26	2022-12-18 13:41:04
57	Tatiana Maxwell	69	2023-08-01 19:05:32
58	Maia Blankenship	46	2023-07-13 11:48:26
59	Erasmus Macias	38	2023-04-19 17:26:20
60	Sebastian Hodge	62	2022-12-06 07:39:25
61	Idona Holder	50	2023-02-21 09:50:19
62	Uta Fox	5	2022-10-02 10:49:23
63	Leilani Gentry	21	2023-07-27 02:16:00
64	Catherine William	1	2022-12-24 01:05:39
65	Elmo Whitaker	26	2023-11-15 09:10:04
66	Margaret Sweet	3	2024-01-25 03:07:10
67	Hayden Holder	94	2022-08-07 08:49:58
68	Rashad Potter	80	2023-01-30 03:53:30
69	Orson Randall	79	2023-09-25 16:13:48
70	Jasmine Waters	83	2022-11-20 12:08:25
71	Todd Cross	51	2023-12-17 15:05:07
72	Mannix Wilcox	87	2023-07-14 04:16:57
73	Iona Cote	16	2023-05-03 02:06:46
74	Nigel Moody	79	2023-02-08 06:21:27
75	Kuame Figueroa	12	2023-10-13 15:16:12
76	MacKenzie Tyler	45	2023-09-08 15:52:16
77	Gail Watkins	1	2023-04-25 17:59:03
78	Richard Dickson	27	2023-06-02 20:30:32
79	Chloe Mcgee	84	2022-10-23 05:23:17
80	Kirsten Barnes	40	2023-04-02 11:37:51
81	Damon Morse	55	2023-08-24 02:06:35
82	Shad Kerr	85	2022-06-19 07:40:22
83	Tatyana Dyer	3	2022-05-23 06:35:15
84	Regina Ewing	67	2023-12-06 02:55:59
85	Katell Holt	86	2022-09-21 14:33:27
86	Denise Wolfe	7	2022-08-26 07:36:24
87	Maryam Spencer	49	2023-03-09 18:20:19
88	Kuame Vinson	31	2023-05-13 16:23:40
89	Bree Cervantes	32	2022-08-20 19:28:03
90	Dean Carter	84	2022-12-24 21:18:30
91	Kuame Kidd	70	2023-01-03 04:21:34
92	Zeus Love	48	2023-06-14 11:33:17
93	Shea Pugh	27	2023-08-05 19:22:18
94	Magee William	67	2023-12-04 02:44:50
95	Hiram Middleton	81	2024-04-10 07:12:34
96	Nicole Mann	83	2024-02-05 06:40:06
97	Cameron Good	46	2024-02-03 20:27:50
98	Tamara Christensen	14	2022-09-06 13:22:19
99	Anthony Mullen	37	2024-01-03 23:31:42
100	Bevis Reyes	17	2022-12-28 06:41:56
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.communities_users (id, community_id, user_id, created_at) FROM stdin;
1	75	87	2023-05-12 19:35:53
2	61	94	2022-09-07 19:05:58
3	10	73	2022-11-26 15:54:42
4	53	97	2023-07-20 00:00:33
5	90	92	2023-11-02 19:03:00
6	50	4	2023-12-02 06:40:36
7	83	64	2024-04-07 08:43:40
8	5	45	2022-07-16 15:51:55
9	5	52	2023-10-07 09:51:58
10	42	71	2023-11-28 07:09:48
11	38	48	2023-09-21 21:26:30
12	64	66	2022-09-21 01:01:37
13	15	42	2023-09-11 14:07:23
14	48	29	2022-05-11 21:56:34
15	80	86	2023-04-03 10:19:52
16	44	30	2022-08-20 10:38:57
17	46	22	2023-10-20 05:00:54
18	88	59	2024-03-15 22:52:58
19	21	28	2022-11-21 13:49:59
20	9	30	2023-07-21 05:00:03
21	93	14	2023-10-03 13:50:16
22	18	6	2023-09-20 10:24:52
23	29	45	2023-01-24 18:26:21
24	91	49	2022-05-07 10:53:42
25	73	3	2024-01-04 00:35:39
26	63	21	2023-01-10 10:18:24
27	92	34	2023-06-01 22:05:39
28	44	84	2023-01-27 10:32:06
29	90	3	2024-04-05 13:19:38
30	36	36	2023-12-07 00:34:04
31	11	52	2023-10-22 11:31:57
32	42	29	2022-09-19 17:57:39
33	66	3	2022-11-23 22:08:11
34	50	97	2022-06-08 20:10:42
35	83	21	2022-11-02 17:54:23
36	44	20	2023-08-08 05:26:42
37	80	59	2022-09-14 14:02:32
38	19	42	2022-10-20 16:29:22
39	34	36	2023-12-17 05:59:27
40	24	77	2022-12-21 20:39:23
41	66	66	2022-05-20 17:32:43
42	99	63	2022-09-01 21:02:19
43	38	51	2023-05-06 08:00:48
44	34	67	2024-04-11 18:41:15
45	17	54	2023-02-28 15:54:18
46	44	97	2022-06-04 10:24:51
47	64	68	2023-05-30 18:50:31
48	82	13	2022-10-08 17:53:50
49	90	25	2022-04-16 12:12:06
50	8	17	2023-03-03 00:37:28
51	6	52	2022-12-08 21:04:00
52	94	96	2023-08-16 16:23:02
53	64	60	2023-06-29 11:34:55
54	90	17	2023-09-16 06:49:40
55	72	5	2023-12-05 07:41:18
56	29	68	2022-12-05 04:11:41
57	42	97	2022-08-25 23:45:04
58	15	34	2022-10-12 17:56:39
59	51	50	2024-03-05 21:43:42
60	99	27	2024-04-02 02:24:34
61	61	99	2022-07-05 15:15:37
62	27	69	2023-01-20 01:11:08
63	70	3	2023-12-31 16:18:56
64	46	22	2022-10-27 00:57:20
65	59	83	2023-02-04 07:22:29
66	59	13	2023-12-07 23:10:18
67	40	16	2024-03-12 23:52:33
68	58	26	2024-01-15 15:09:19
69	63	75	2023-11-03 00:51:25
70	74	45	2023-09-03 10:13:18
71	71	8	2022-09-12 06:22:49
72	76	16	2023-04-25 15:14:06
73	75	86	2022-10-21 07:19:42
74	3	93	2023-01-04 18:38:59
75	68	33	2024-01-20 11:46:07
76	67	87	2022-09-07 22:57:01
77	93	97	2022-08-13 03:12:53
78	62	78	2022-11-24 15:04:03
79	97	21	2023-07-13 08:33:38
80	33	26	2023-03-26 09:51:16
81	14	19	2023-01-18 08:22:03
82	91	28	2022-10-25 19:46:37
83	18	16	2022-09-10 01:33:18
84	25	3	2023-05-29 09:35:34
85	2	70	2023-08-22 02:20:50
86	27	53	2023-10-08 06:43:58
87	5	82	2022-06-26 06:28:25
88	25	100	2023-05-18 14:03:43
89	19	30	2023-10-19 00:20:43
90	34	52	2022-04-21 09:23:35
91	48	51	2023-06-13 05:44:06
92	8	81	2023-11-25 00:52:10
93	30	29	2023-12-17 10:54:12
94	40	10	2023-10-13 21:15:53
95	97	37	2022-12-13 01:19:29
96	58	82	2022-08-06 06:57:34
97	100	10	2023-05-22 11:49:17
98	35	70	2022-10-20 18:12:46
99	37	15	2024-01-06 08:19:22
100	5	26	2022-04-16 09:58:12
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	35	75	33	2023-12-06 18:26:08	2023-08-31 03:55:30
2	64	30	38	2024-01-08 14:10:10	2024-01-06 09:06:00
3	36	11	93	2022-07-26 17:30:09	2023-09-11 17:05:50
4	55	75	33	2022-04-15 06:06:52	2022-11-30 18:55:23
5	50	18	64	2022-08-02 04:05:00	2022-12-13 05:09:07
6	41	50	86	2023-07-18 19:20:16	2023-09-22 01:28:15
7	76	75	35	2022-06-26 17:18:25	2023-07-07 14:03:57
8	4	86	30	2022-10-23 23:39:19	2022-07-24 20:25:19
9	46	56	41	2022-09-08 18:42:42	2023-06-13 07:50:37
10	49	80	92	2022-08-17 19:20:56	2023-09-17 07:20:17
11	53	40	71	2022-12-13 06:56:59	2023-12-17 03:02:51
12	80	95	35	2023-07-29 20:21:05	2022-08-01 10:49:21
13	7	77	86	2024-04-10 05:56:24	2022-09-21 22:26:01
14	93	47	22	2023-08-02 05:03:33	2022-07-08 21:16:45
15	57	48	79	2023-02-28 10:56:00	2024-03-07 10:09:44
16	76	72	29	2022-11-30 11:36:55	2023-12-04 06:58:53
17	23	39	95	2022-05-07 17:43:14	2023-12-18 16:02:16
18	51	64	44	2022-11-22 18:14:27	2022-12-07 04:02:50
19	85	33	35	2023-10-14 04:59:34	2022-06-29 22:25:06
20	35	68	46	2022-09-21 00:13:45	2023-07-15 23:43:34
21	89	76	50	2023-11-05 21:36:47	2023-06-07 06:08:03
22	23	16	9	2022-05-03 05:34:55	2022-08-23 11:27:29
23	68	96	86	2023-07-27 02:27:45	2022-07-04 06:57:27
24	26	83	99	2023-02-27 23:28:35	2022-11-22 07:37:41
25	91	39	94	2023-04-13 15:53:42	2022-12-05 11:10:26
26	46	83	79	2024-01-18 03:39:13	2023-06-26 08:01:46
27	14	74	58	2022-08-03 00:04:22	2023-04-30 20:28:16
28	75	75	77	2023-07-28 13:35:04	2022-11-21 03:14:24
29	48	58	25	2022-06-14 00:19:31	2023-12-05 06:17:48
30	25	96	65	2022-06-24 10:47:54	2023-11-22 20:29:07
31	65	22	74	2023-02-09 15:12:21	2023-02-22 01:05:44
32	28	56	37	2023-04-24 14:05:20	2022-11-26 15:09:44
33	55	34	22	2023-05-22 10:02:55	2023-02-16 00:27:23
34	18	99	66	2022-09-03 17:39:13	2022-06-17 18:01:51
35	73	44	21	2022-08-07 02:49:12	2022-12-04 22:46:49
36	7	92	36	2023-08-05 15:13:01	2022-10-05 23:30:20
37	72	2	70	2024-04-03 10:07:34	2023-05-16 10:14:59
38	98	28	50	2022-05-25 10:22:28	2022-09-27 20:18:07
39	95	54	75	2023-12-01 04:12:52	2024-03-18 17:20:22
40	59	69	29	2022-07-29 07:24:51	2022-05-09 03:36:45
41	24	40	36	2023-09-07 15:50:13	2023-12-01 10:43:19
42	82	72	86	2022-12-18 16:19:53	2022-06-11 11:17:12
43	74	12	84	2022-04-19 16:56:12	2023-02-01 12:24:26
44	18	55	70	2022-12-09 18:34:22	2023-01-04 02:54:26
45	33	83	19	2023-03-21 08:14:42	2022-04-16 14:01:50
46	62	42	91	2022-07-31 18:25:56	2024-03-25 23:58:25
47	77	10	62	2022-10-17 01:17:53	2023-08-29 05:35:30
48	75	66	64	2024-03-14 08:51:32	2022-09-06 10:38:13
49	4	32	86	2023-01-29 19:10:28	2023-08-20 23:48:25
50	3	76	13	2024-03-06 02:21:57	2024-02-07 02:39:02
51	65	81	10	2022-12-31 05:15:13	2023-10-20 05:09:55
52	36	17	61	2022-08-10 08:49:13	2023-05-09 11:59:44
53	62	85	59	2022-04-28 21:06:30	2023-10-28 02:56:06
54	27	2	92	2023-02-14 02:08:59	2023-12-28 03:06:48
55	20	76	32	2022-04-18 14:57:14	2022-12-01 07:20:58
56	90	11	61	2023-04-03 11:46:15	2023-06-16 12:59:38
57	55	28	7	2022-08-23 19:31:44	2022-06-22 18:40:42
58	78	44	30	2023-01-06 21:51:49	2023-10-02 15:03:12
59	87	65	46	2023-04-01 00:47:24	2022-11-18 08:15:46
60	57	68	7	2024-03-31 13:58:04	2023-10-04 05:18:57
61	68	7	46	2023-12-13 22:43:50	2022-11-19 19:55:22
62	55	35	10	2023-09-02 08:42:36	2022-09-12 17:06:29
63	78	35	76	2023-11-02 02:30:56	2022-10-07 13:01:10
64	44	75	88	2023-11-13 05:50:58	2022-08-16 01:28:24
65	67	42	6	2023-11-02 01:03:15	2022-11-10 14:33:24
66	0	29	86	2022-11-25 07:27:47	2022-08-06 09:18:02
67	50	4	14	2023-03-06 02:00:04	2022-05-20 17:12:07
68	26	13	98	2022-06-09 21:46:30	2022-10-11 17:15:18
69	23	35	63	2024-02-24 00:05:35	2023-02-22 09:39:20
70	83	9	87	2024-03-16 22:38:01	2023-11-15 08:19:18
71	59	13	83	2024-01-20 07:48:56	2023-01-20 15:11:06
72	48	36	4	2023-04-29 09:24:07	2023-03-05 08:54:03
73	24	19	88	2022-11-22 18:25:53	2023-02-07 20:42:12
74	78	99	96	2022-12-16 13:29:38	2023-07-29 07:26:31
75	1	79	58	2024-01-13 19:58:44	2022-10-18 00:29:34
76	96	92	77	2023-03-17 16:21:24	2023-05-07 23:33:28
77	89	40	42	2023-08-08 19:06:25	2023-05-27 06:09:44
78	42	20	12	2023-08-27 19:45:51	2022-07-11 22:45:14
79	23	34	25	2023-12-23 01:39:47	2024-01-30 22:59:34
80	52	62	10	2023-03-16 00:48:10	2023-04-15 02:42:52
81	63	89	59	2023-04-26 20:30:03	2023-07-12 12:10:21
82	47	85	2	2023-10-06 11:05:06	2023-01-18 17:17:58
83	76	83	13	2023-01-06 19:08:50	2022-12-22 17:27:09
84	34	18	0	2022-06-20 08:23:53	2023-02-05 00:26:37
85	77	28	56	2022-05-03 07:30:37	2023-08-16 02:26:42
86	31	92	41	2023-12-10 07:32:00	2022-08-12 10:23:17
87	59	19	30	2024-04-09 00:30:23	2024-03-22 23:11:36
88	98	73	84	2022-11-20 18:59:51	2022-04-27 23:49:12
89	60	5	22	2023-07-26 18:58:11	2023-09-14 14:39:03
90	67	45	4	2022-09-04 18:20:51	2024-02-13 13:41:47
91	64	31	67	2023-10-12 02:10:07	2023-12-13 12:51:25
92	93	76	5	2022-10-21 14:12:26	2023-03-15 18:33:47
93	10	62	43	2022-09-17 16:05:57	2022-10-25 14:30:51
94	91	44	37	2023-06-20 09:17:32	2023-02-25 23:59:58
95	38	49	86	2023-03-17 02:41:26	2023-06-23 22:05:01
96	60	81	78	2023-10-20 16:01:16	2022-06-22 04:55:43
97	44	23	13	2023-02-27 20:43:19	2023-07-01 17:06:23
98	20	40	91	2022-04-17 18:53:14	2023-01-16 21:02:25
99	99	71	46	2022-05-30 23:50:15	2022-07-23 19:27:42
100	32	92	19	2023-04-17 08:37:41	2022-05-28 12:50:22
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	Yasir Wyatt
2	Roth Stafford
3	Maryam Goodman
4	Lareina Tanner
5	Camille Caldwell
6	Adara Williams
7	Erich Howell
8	Dexter Jimenez
9	Mufutau Faulkner
10	Xyla Vasquez
11	Quentin Mcdowell
12	Dolan Santana
13	Eleanor Pugh
14	Fay Mccormick
15	Kenyon Levine
16	Gemma Ford
17	Willa Whitehead
18	Iliana Dalton
19	Riley Donovan
20	Zelda Underwood
21	Malachi Simmons
22	Kibo Beck
23	Orli Valdez
24	Helen Pittman
25	Allistair Glover
26	Marsden Holloway
27	Genevieve Robles
28	Drake Frederick
29	Sandra Burns
30	Ray Stark
31	Juliet Pierce
32	Audra Richard
33	Bradley Nieves
34	Lev Torres
35	Odette Figueroa
36	Baxter Dunlap
37	Reese Robbins
38	Haley Lynn
39	Jada Hines
40	Benedict King
41	Ignacia Floyd
42	Kermit Stein
43	Tyler Simpson
44	Kieran Bolton
45	Rigel Everett
46	Abel Hicks
47	Declan Holloway
48	Gage Sanchez
49	Genevieve Lindsey
50	Naomi Cannon
51	Dana Vargas
52	Elvis Meyers
53	Shana Schmidt
54	Neville Jackson
55	Zorita Head
56	Conan Camacho
57	Idola Huffman
58	Herrod Bean
59	Kirestin Young
60	Lionel Hodges
61	Gretchen Avila
62	Iona Vega
63	Steven Mcdowell
64	Jesse Chase
65	Dane Lewis
66	Jael Whitaker
67	Camden House
68	Gray Mckinney
69	Dorothy Shields
70	Heidi Burton
71	Yoko Carson
72	Chaim Pennington
73	Jemima Garrett
74	Hedda Mann
75	Leonard Gallagher
76	Jesse Cotton
77	Hector Calhoun
78	Yoshio Fox
79	Lucas Burch
80	Yoshio Nichols
81	Jordan Macias
82	Arthur Duke
83	Russell Holden
84	Chancellor Waller
85	Steel Pruitt
86	Ashely Calderon
87	Callie Chase
88	Kameko Zamora
89	Inez Swanson
90	Herrod Lee
91	Xena Stevenson
92	Thaddeus Baldwin
93	Sharon Osborne
94	Cara Mcconnell
95	Jelani Solomon
96	Steven Day
97	Cody Terry
98	Suki Mays
99	Kelly Wilkerson
100	Cyrus Dickson
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	88	33	Donec at arcu. Vestibulum ante ipsum primis in faucibus orci	No	Yes	2024-01-14 10:31:25
2	65	19	augue ac ipsum. Phasellus vitae mauris sit amet lorem semper	Yes	Yes	2022-08-13 12:44:48
3	78	35	tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing,	No	No	2023-04-03 04:41:56
4	70	16	porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris	Yes	No	2022-12-12 14:30:42
5	9	84	mi, ac mattis velit justo nec ante. Maecenas mi felis,	Yes	No	2022-09-25 09:46:29
6	68	97	imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non,	No	No	2023-08-04 16:29:07
7	77	77	sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra,	Yes	No	2023-01-19 19:59:59
8	20	6	ante lectus convallis est, vitae sodales nisi magna sed dui.	No	No	2022-07-08 22:12:08
9	34	39	lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.	Yes	Yes	2022-10-22 18:21:58
10	71	83	at fringilla purus mauris a nunc. In at pede. Cras	Yes	No	2022-05-07 19:29:37
11	58	77	Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius.	Yes	No	2022-10-14 11:23:36
12	40	66	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	Yes	Yes	2023-07-01 06:41:05
13	71	59	interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	No	No	2024-03-05 01:58:17
14	58	15	non quam. Pellentesque habitant morbi tristique senectus et netus et	Yes	No	2022-12-24 17:43:49
15	59	31	amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque,	No	No	2022-12-06 04:46:51
16	35	88	mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut,	Yes	No	2023-01-03 21:26:32
17	79	1	Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est.	Yes	No	2022-08-29 21:54:05
18	64	33	felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.	No	Yes	2023-10-31 10:18:47
19	41	7	orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit	No	No	2022-08-01 22:40:10
20	87	41	nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra.	No	Yes	2023-07-26 17:46:42
21	57	51	ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer	Yes	Yes	2024-03-26 18:10:43
22	39	24	Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut	Yes	No	2022-08-09 13:21:18
23	36	5	erat, eget tincidunt dui augue eu tellus. Phasellus elit pede,	No	Yes	2022-05-15 15:10:17
24	27	55	fringilla purus mauris a nunc. In at pede. Cras vulputate	Yes	Yes	2022-07-04 15:31:16
25	62	30	eget, dictum placerat, augue. Sed molestie. Sed id risus quis	Yes	No	2023-11-21 17:20:11
26	54	29	Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna,	Yes	No	2023-09-27 20:18:10
27	62	67	dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est	No	Yes	2024-01-24 19:07:23
28	82	14	eget mollis lectus pede et risus. Quisque libero lacus, varius	No	Yes	2022-04-29 09:00:13
29	17	43	Maecenas libero est, congue a, aliquet vel, vulputate eu, odio.	No	Yes	2022-09-17 12:06:31
30	87	62	Duis elementum, dui quis accumsan convallis, ante lectus convallis est,	Yes	No	2023-05-25 16:16:13
31	23	13	neque. Nullam ut nisi a odio semper cursus. Integer mollis.	Yes	No	2023-01-20 08:22:20
32	9	67	magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem	Yes	Yes	2022-12-22 12:26:47
33	4	42	dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer	No	Yes	2022-10-11 14:23:37
34	1	58	cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum	Yes	No	2023-05-31 08:49:53
35	7	48	ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus	No	Yes	2022-09-22 15:20:32
36	19	62	vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque	No	Yes	2022-11-19 03:07:34
37	48	14	tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante	No	Yes	2022-10-15 09:50:27
38	41	26	eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in	Yes	No	2022-11-25 03:28:33
39	56	6	consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,	No	No	2023-12-27 09:22:37
40	59	58	risus. Donec nibh enim, gravida sit amet, dapibus id, blandit	Yes	No	2022-09-25 16:31:07
41	18	5	per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel	No	Yes	2024-03-20 09:32:11
42	49	88	rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem	Yes	Yes	2022-12-15 23:22:53
43	90	20	sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed	No	Yes	2022-09-20 00:45:32
44	53	55	hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,	Yes	No	2022-06-18 16:17:16
45	85	96	fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus	No	No	2023-01-30 01:07:26
46	30	42	feugiat metus sit amet ante. Vivamus non lorem vitae odio	Yes	Yes	2022-12-25 13:23:44
47	54	50	Praesent eu dui. Cum sociis natoque penatibus et magnis dis	Yes	No	2023-02-05 01:51:28
48	1	99	non, luctus sit amet, faucibus ut, nulla. Cras eu tellus	Yes	No	2022-05-07 21:35:36
49	39	62	non justo. Proin non massa non ante bibendum ullamcorper. Duis	Yes	Yes	2022-10-21 21:29:22
50	17	30	sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis	No	Yes	2023-04-30 13:22:41
51	56	7	aliquet vel, vulputate eu, odio. Phasellus at augue id ante	Yes	No	2022-07-27 05:56:52
52	38	40	sit amet nulla. Donec non justo. Proin non massa non	No	No	2022-08-24 08:12:16
53	56	8	iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur	Yes	Yes	2022-09-14 16:15:06
54	43	77	ultrices sit amet, risus. Donec nibh enim, gravida sit amet,	No	No	2023-07-19 12:58:59
55	40	62	orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique	No	Yes	2022-10-06 23:42:26
56	73	61	erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla	Yes	No	2022-09-24 07:50:02
57	5	39	faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum.	Yes	Yes	2022-08-12 21:40:45
58	84	9	Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui	Yes	Yes	2022-07-27 18:37:36
59	3	79	magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor	No	No	2022-10-17 10:55:20
60	65	68	ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc	Yes	Yes	2023-01-23 03:29:32
61	30	43	urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis	Yes	No	2023-09-07 03:03:53
62	83	67	magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem	Yes	No	2022-09-19 06:48:02
63	65	57	vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor	Yes	Yes	2023-08-07 16:25:43
64	49	52	ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris	Yes	No	2023-03-25 00:42:00
65	42	55	tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam	Yes	No	2023-01-24 16:54:33
66	35	96	purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla	Yes	No	2022-08-06 18:06:59
67	91	68	in consequat enim diam vel arcu. Curabitur ut odio vel	No	No	2023-02-08 16:57:30
68	50	59	est tempor bibendum. Donec felis orci, adipiscing non, luctus sit	No	Yes	2023-12-28 18:02:54
69	39	31	feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum	Yes	Yes	2024-02-26 00:54:28
70	14	66	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit	No	Yes	2022-05-17 21:29:55
71	24	83	elementum, dui quis accumsan convallis, ante lectus convallis est, vitae	No	No	2023-11-11 05:58:23
72	54	81	quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla.	No	No	2022-04-26 08:54:34
73	65	3	et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,	No	Yes	2022-08-07 08:32:08
74	28	90	quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu	No	No	2023-07-25 12:42:45
75	70	45	et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	No	No	2022-11-19 19:26:57
76	57	32	egestas. Fusce aliquet magna a neque. Nullam ut nisi a	Yes	No	2023-09-15 23:59:56
77	1	37	cursus, diam at pretium aliquet, metus urna convallis erat, eget	Yes	Yes	2022-09-03 15:59:12
78	37	62	pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer	Yes	No	2022-12-21 18:27:08
79	51	71	purus. Maecenas libero est, congue a, aliquet vel, vulputate eu,	Yes	Yes	2023-06-02 09:15:43
80	3	32	Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis	No	No	2024-03-03 08:21:02
81	70	23	mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,	No	No	2023-05-20 12:24:10
82	68	49	mauris ut mi. Duis risus odio, auctor vitae, aliquet nec,	No	Yes	2024-03-06 13:36:21
83	18	91	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus	No	No	2023-10-30 06:22:27
84	81	83	egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere	No	Yes	2023-01-01 10:00:54
85	57	11	egestas nunc sed libero. Proin sed turpis nec mauris blandit	No	Yes	2023-04-29 13:59:41
86	89	49	diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget,	Yes	Yes	2023-04-13 21:17:14
87	78	7	Cras eu tellus eu augue porttitor interdum. Sed auctor odio	Yes	No	2022-12-19 20:03:30
88	28	40	at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum	Yes	No	2024-01-24 07:05:45
89	79	81	vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce	Yes	No	2023-10-06 18:41:17
90	87	23	sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis	Yes	Yes	2022-09-11 17:36:07
91	43	93	a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed	No	No	2023-06-19 05:18:05
92	69	24	in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est	Yes	No	2022-07-15 06:59:59
93	97	15	luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi	Yes	Yes	2023-10-15 00:15:51
94	49	3	varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem	No	No	2022-08-27 05:17:03
95	97	85	Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.	No	No	2024-03-10 02:12:08
96	94	65	facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant	Yes	No	2023-02-26 00:25:56
97	4	58	Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie	No	No	2023-03-13 04:12:59
98	33	91	et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	Yes	Yes	2024-03-17 21:01:23
99	97	26	erat semper rutrum. Fusce dolor quam, elementum at, egestas a,	No	Yes	2023-01-24 02:55:57
100	84	87	est ac facilisis facilisis, magna tellus faucibus leo, in lobortis	Yes	Yes	2023-06-19 00:32:06
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	https://youtube.com/sub	50	lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor	2022-10-29 14:34:01	62
2	http://baidu.com/sub/cars	17	quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus	2022-10-19 00:50:57	65
3	http://twitter.com/group/9	72	bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum,	2023-01-21 15:35:31	8
4	https://baidu.com/sub	44	torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam	2023-09-11 18:23:48	64
5	http://bbc.co.uk/user/110	83	lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam.	2023-10-30 02:26:35	35
6	https://ebay.com/settings	77	odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam	2024-04-13 04:32:23	55
7	https://nytimes.com/sub	13	urna, nec luctus felis purus ac tellus. Suspendisse sed dolor.	2022-12-07 09:44:06	78
8	http://twitter.com/en-us	45	porttitor interdum. Sed auctor odio a purus. Duis elementum, dui	2024-01-05 06:33:34	95
9	http://facebook.com/settings	96	pede, ultrices a, auctor non, feugiat nec, diam. Duis mi	2023-02-18 03:16:16	0
10	http://ebay.com/sub	49	rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at,	2023-12-05 23:23:52	84
11	http://twitter.com/en-ca	82	varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem	2023-01-10 03:21:20	71
12	https://walmart.com/sub	13	eu nulla at sem molestie sodales. Mauris blandit enim consequat	2023-03-28 10:33:51	87
13	http://facebook.com/one	22	magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu	2023-06-10 08:32:45	24
14	http://baidu.com/settings	13	eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.	2022-04-19 08:17:47	85
15	https://reddit.com/site	45	ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper	2023-11-27 19:49:49	37
16	https://youtube.com/group/9	25	mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae,	2023-06-09 20:45:06	59
17	http://netflix.com/site	82	tempus non, lacinia at, iaculis quis, pede. Praesent eu dui.	2023-03-14 12:25:13	31
18	http://netflix.com/settings	92	est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed	2023-05-17 09:31:31	14
19	http://instagram.com/en-ca	72	Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor	2023-11-01 04:07:52	95
20	https://google.com/sub/cars	49	lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet	2024-03-10 12:31:36	30
21	http://guardian.co.uk/sub/cars	15	Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu,	2023-10-06 09:51:11	61
22	https://reddit.com/settings	88	vel est tempor bibendum. Donec felis orci, adipiscing non, luctus	2023-06-04 09:20:36	35
23	https://twitter.com/fr	2	Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet	2022-05-07 09:25:01	30
24	http://zoom.us/sub/cars	38	ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem	2023-10-23 03:01:13	52
25	http://netflix.com/sub/cars	67	ut eros non enim commodo hendrerit. Donec porttitor tellus non	2023-06-11 17:32:59	86
26	https://instagram.com/fr	34	Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus.	2022-10-18 20:25:04	21
27	http://yahoo.com/en-ca	88	magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,	2022-09-30 06:27:59	87
28	https://pinterest.com/group/9	45	consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales	2022-10-18 17:26:16	36
29	https://yahoo.com/fr	67	Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum	2023-03-29 05:48:11	69
30	https://whatsapp.com/en-us	20	risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed	2023-11-07 07:01:21	4
31	https://twitter.com/en-us	74	at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum	2023-02-22 14:42:46	97
32	http://instagram.com/en-ca	61	pede sagittis augue, eu tempor erat neque non quam. Pellentesque	2023-01-23 01:05:42	37
33	https://youtube.com/en-us	92	orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras	2023-03-15 10:38:17	41
34	https://guardian.co.uk/group/9	16	nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae	2022-10-23 03:48:18	88
35	https://whatsapp.com/group/9	68	Donec nibh enim, gravida sit amet, dapibus id, blandit at,	2023-10-28 12:16:06	0
36	http://pinterest.com/sub	63	eu erat semper rutrum. Fusce dolor quam, elementum at, egestas	2023-02-15 00:14:16	88
37	https://whatsapp.com/site	81	eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.	2022-12-05 04:44:24	79
38	https://reddit.com/one	25	tempor erat neque non quam. Pellentesque habitant morbi tristique senectus	2023-12-15 11:37:56	24
39	https://pinterest.com/en-ca	84	neque. Morbi quis urna. Nunc quis arcu vel quam dignissim	2022-06-29 08:08:41	23
40	https://nytimes.com/user/110	13	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor,	2023-08-02 23:07:22	25
41	http://bbc.co.uk/en-ca	87	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit	2022-07-01 02:49:49	70
42	http://naver.com/group/9	89	auctor odio a purus. Duis elementum, dui quis accumsan convallis,	2022-11-06 16:22:22	54
43	http://walmart.com/sub/cars	65	dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit	2022-08-12 06:30:39	19
44	https://nytimes.com/settings	68	nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse	2022-06-30 02:33:26	31
45	https://baidu.com/one	3	semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae	2022-09-12 04:46:17	23
46	https://instagram.com/en-ca	50	accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam.	2024-04-04 04:00:30	25
47	http://cnn.com/one	14	Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique	2022-08-01 14:31:47	62
48	https://reddit.com/en-ca	27	risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed	2022-10-29 02:47:12	49
49	http://bbc.co.uk/settings	97	mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla	2023-06-12 12:28:56	91
50	https://bbc.co.uk/en-us	36	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	2023-09-18 19:14:46	51
51	https://whatsapp.com/en-us	49	Proin sed turpis nec mauris blandit mattis. Cras eget nisi	2024-01-07 23:26:02	22
52	https://instagram.com/settings	43	nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet	2023-09-06 09:00:22	75
53	https://whatsapp.com/sub/cars	83	tempor erat neque non quam. Pellentesque habitant morbi tristique senectus	2022-10-17 22:23:43	43
54	http://naver.com/settings	22	tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer	2023-04-09 14:59:47	44
55	http://instagram.com/settings	57	purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis	2023-07-08 22:43:19	57
56	http://cnn.com/group/9	25	elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris	2024-03-28 14:29:26	96
57	http://bbc.co.uk/user/110	21	ut nisi a odio semper cursus. Integer mollis. Integer tincidunt	2023-05-31 19:07:01	28
58	https://bbc.co.uk/settings	51	sodales purus, in molestie tortor nibh sit amet orci. Ut	2024-04-10 14:40:41	90
59	http://guardian.co.uk/site	45	nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et	2022-08-19 02:02:08	27
60	https://baidu.com/fr	47	elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum	2023-10-19 10:37:49	25
61	http://whatsapp.com/one	97	et malesuada fames ac turpis egestas. Fusce aliquet magna a	2022-09-03 16:34:05	25
62	http://twitter.com/en-us	13	ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,	2023-09-09 03:44:30	16
63	https://wikipedia.org/site	16	sit amet ante. Vivamus non lorem vitae odio sagittis semper.	2023-09-07 08:48:18	52
64	https://baidu.com/sub	62	varius orci, in consequat enim diam vel arcu. Curabitur ut	2022-04-25 00:47:47	72
65	https://bbc.co.uk/one	54	Duis a mi fringilla mi lacinia mattis. Integer eu lacus.	2022-06-04 02:30:24	46
66	https://cnn.com/sub/cars	91	turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis	2023-08-19 02:13:41	86
67	https://whatsapp.com/settings	29	ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam	2024-02-16 07:00:24	73
68	https://pinterest.com/fr	33	in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer	2023-10-31 18:58:24	16
69	http://zoom.us/fr	12	dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a	2022-05-13 09:52:06	63
70	http://instagram.com/group/9	39	euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut,	2022-06-25 21:19:09	12
71	https://facebook.com/settings	62	nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod	2022-05-21 04:09:00	65
72	http://pinterest.com/en-ca	59	lobortis risus. In mi pede, nonummy ut, molestie in, tempus	2023-05-07 07:25:57	80
73	https://instagram.com/en-ca	81	mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam	2023-04-30 05:26:23	43
74	http://guardian.co.uk/settings	75	ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,	2023-12-23 02:34:25	49
75	http://google.com/en-us	48	ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,	2023-06-13 00:19:47	10
76	https://ebay.com/one	43	quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar	2024-02-16 02:08:27	68
77	https://guardian.co.uk/user/110	61	sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris	2022-09-10 01:48:23	48
78	https://guardian.co.uk/one	9	arcu et pede. Nunc sed orci lobortis augue scelerisque mollis.	2022-10-11 22:27:21	12
79	https://naver.com/site	56	ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu	2022-09-19 06:05:17	47
80	http://instagram.com/group/9	74	Donec vitae erat vel pede blandit congue. In scelerisque scelerisque	2023-04-02 03:40:06	25
81	http://pinterest.com/settings	74	Donec at arcu. Vestibulum ante ipsum primis in faucibus orci	2023-08-15 05:53:28	94
82	https://walmart.com/settings	95	purus. Maecenas libero est, congue a, aliquet vel, vulputate eu,	2022-05-04 11:14:13	73
83	https://ebay.com/user/110	16	aliquet, metus urna convallis erat, eget tincidunt dui augue eu	2023-06-08 21:44:00	11
84	http://bbc.co.uk/en-us	31	semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim	2022-05-16 06:30:49	54
85	http://whatsapp.com/en-us	91	ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus.	2023-04-03 05:46:35	35
86	http://ebay.com/user/110	48	dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl.	2022-10-23 01:59:59	60
87	http://nytimes.com/en-ca	49	scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu	2023-06-28 10:42:49	60
88	https://instagram.com/sub/cars	58	Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi	2024-04-03 00:29:48	5
89	http://pinterest.com/sub/cars	21	sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.	2022-05-19 03:23:29	41
90	https://zoom.us/site	65	at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada	2023-09-04 03:06:41	18
91	https://netflix.com/fr	66	odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa.	2022-09-27 09:13:31	23
92	https://wikipedia.org/fr	42	Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,	2023-10-23 17:04:20	34
93	https://cnn.com/sub	73	Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean	2024-01-22 11:54:54	8
94	https://youtube.com/sub/cars	15	viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum	2023-02-26 05:30:03	68
95	http://baidu.com/settings	28	ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,	2023-06-04 12:58:51	34
96	https://whatsapp.com/sub/cars	1	tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac	2022-05-29 12:41:56	5
97	https://ebay.com/settings	13	auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis	2024-01-02 23:09:51	51
98	http://guardian.co.uk/fr	47	facilisi. Sed neque. Sed eget lacus. Mauris non dui nec	2022-09-03 07:07:40	90
99	https://nytimes.com/sub/cars	91	libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et,	2023-09-10 08:38:42	86
100	http://yahoo.com/sub/cars	65	non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum	2024-03-23 13:01:43	28
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.users (id, first_name, last_name, email, phone, main_photo, created_at) FROM stdin;
1	Hilel	Romero	mi.pede@outlook.ca	(945) 876-1840	18	2024-03-04 17:01:05
2	Unity	Pittman	sed.turpis@protonmail.com	(204) 649-3865	45	2023-03-26 12:16:45
3	Philip	Peterson	enim@google.net	1-778-742-0641	96	2023-01-12 08:57:15
4	Wylie	Slater	nunc.pulvinar@icloud.ca	(456) 812-3624	57	2023-06-10 13:53:37
5	Cole	Grimes	sociis.natoque@outlook.net	1-462-619-4142	10	2022-10-17 17:15:12
6	Josiah	Wagner	augue.sed@yahoo.net	1-692-954-7971	99	2022-04-27 17:31:00
7	Idona	Henry	sed@google.ca	1-535-481-1746	62	2024-03-10 04:59:29
8	George	Greene	sed.facilisis@protonmail.couk	1-431-412-6475	6	2022-12-06 11:30:59
9	Alika	Church	augue.malesuada.malesuada@hotmail.ca	(715) 758-4945	16	2022-12-05 05:28:11
10	Sybill	Francis	at.velit@aol.org	(937) 540-9348	43	2023-12-30 14:36:45
11	Gray	Wheeler	dignissim.magna.a@icloud.ca	1-436-785-1563	36	2023-05-03 09:01:16
12	Hadassah	Sweeney	ipsum.sodales@aol.net	(933) 572-2067	48	2022-05-16 05:47:36
13	Lane	Huffman	tincidunt@aol.org	(693) 892-8903	10	2023-10-20 08:20:23
14	Josephine	Cooke	et.tristique@google.com	(381) 391-8908	50	2022-09-13 23:06:13
15	Amal	Gamble	nam.ac.nulla@yahoo.ca	(294) 117-6462	63	2022-08-16 07:57:16
16	Madison	Maynard	adipiscing.lobortis@outlook.edu	(248) 523-1871	17	2022-07-13 08:47:13
17	Callum	Pickett	metus.vivamus@outlook.net	1-840-850-1418	91	2023-11-19 09:16:20
18	Frances	Williams	vulputate.risus.a@yahoo.ca	(837) 842-7321	25	2023-08-16 23:43:43
19	Keaton	Stewart	adipiscing.elit@hotmail.edu	1-926-141-4391	81	2022-05-24 00:37:01
20	Brady	Espinoza	aliquet.phasellus@yahoo.com	(107) 543-2263	58	2022-05-28 11:38:05
21	Justin	Roach	urna.vivamus@outlook.org	1-721-934-8781	31	2023-10-15 16:06:26
22	Alfreda	Cervantes	pharetra.felis.eget@outlook.ca	1-911-523-1436	7	2022-07-21 11:45:44
23	Ian	Cannon	in@protonmail.edu	1-722-755-6569	88	2024-01-18 21:04:54
24	Logan	Olsen	aliquet.magna.a@outlook.org	1-276-861-8684	75	2022-07-11 06:24:16
25	Seth	Burnett	lacinia@protonmail.edu	1-475-758-8018	57	2023-10-31 08:44:37
26	Scarlet	Mclean	nisi@aol.edu	(572) 140-2416	79	2023-02-23 15:23:51
27	Lydia	Christensen	orci.sem@protonmail.couk	1-335-283-3843	19	2023-11-04 04:24:38
28	Orson	Ross	at.fringilla@outlook.com	1-835-810-2667	92	2024-03-04 08:07:33
29	Dalton	Lambert	mauris.nulla@hotmail.com	(883) 388-5595	93	2023-11-18 03:18:54
30	Lana	Holcomb	scelerisque.neque@aol.net	1-756-640-0013	82	2023-04-22 18:16:58
31	Kristen	Randolph	urna.nunc@yahoo.net	1-654-437-7937	7	2024-04-02 15:50:14
32	Damon	Mitchell	urna@google.ca	(472) 845-7283	15	2023-04-15 04:06:03
33	Bruce	Murray	tincidunt.congue@google.edu	1-971-272-4161	23	2022-10-31 18:28:09
34	Dexter	Rogers	pharetra.nibh.aliquam@google.edu	(523) 173-1624	32	2023-05-18 23:29:55
35	Justina	Landry	sem@outlook.net	(578) 405-2173	3	2022-11-14 04:21:38
36	Ori	Gray	ipsum.dolor.sit@aol.ca	1-649-238-3878	60	2022-12-22 13:53:52
37	Ryan	Adams	morbi.tristique@google.net	1-883-430-1656	23	2022-10-28 23:37:33
38	Reece	Leblanc	et.magnis@google.ca	1-421-322-8652	23	2023-12-11 17:49:37
39	Amy	Mayer	erat.volutpat@protonmail.net	(877) 111-4756	79	2024-01-01 05:40:06
40	Lewis	Weeks	lorem.luctus@aol.com	1-867-953-5393	87	2023-12-05 07:55:28
41	Alvin	Wilcox	cras.convallis.convallis@yahoo.ca	1-943-986-1399	18	2023-04-27 05:19:37
42	Uta	Stone	ac.eleifend@google.couk	1-155-778-7431	33	2023-12-30 20:37:52
43	Harlan	Morrison	mauris.magna.duis@icloud.net	(984) 821-6574	24	2023-02-15 05:51:06
44	Jerome	Blackburn	cras.vulputate@yahoo.edu	1-607-143-7484	43	2023-05-23 15:40:54
45	Willow	Key	urna.et@outlook.com	1-563-887-4253	99	2022-11-01 08:25:56
46	MacKenzie	Bullock	nec.malesuada@aol.edu	(736) 706-6917	67	2023-11-29 05:47:16
47	Kathleen	Fuller	nec@icloud.com	1-302-782-8955	32	2022-05-23 13:14:17
48	Tobias	Watkins	erat.vel@protonmail.com	(924) 845-2597	7	2023-01-24 20:37:01
49	Wyatt	Baird	dignissim.tempor@hotmail.org	(366) 840-2636	46	2023-03-06 00:27:35
50	Maggy	Goodman	lorem.ac@google.edu	(641) 271-5344	77	2023-08-23 13:29:48
51	Ryan	Salinas	ipsum.donec.sollicitudin@protonmail.org	(805) 853-0543	97	2023-01-02 20:53:30
52	Hilda	Hardy	aenean.gravida@aol.org	(897) 662-4836	9	2023-12-24 06:09:44
53	Illiana	Duran	est.congue@outlook.edu	(576) 891-5315	82	2022-06-06 06:52:23
54	Imogene	Bass	a.odio@protonmail.org	1-124-215-1139	63	2022-07-12 13:05:45
55	Barry	Byers	et@protonmail.edu	1-520-614-6337	45	2023-06-18 23:32:56
56	Elvis	Valentine	nullam.velit@outlook.net	1-635-208-2669	84	2024-01-16 19:11:24
57	Constance	Rollins	phasellus.at@icloud.edu	1-112-310-8092	65	2022-09-19 11:25:24
58	Evelyn	Lynch	et.ultrices.posuere@protonmail.com	(762) 520-5744	13	2022-10-20 05:16:22
59	Damon	Burt	a.neque@hotmail.couk	1-386-353-1455	68	2023-07-25 06:03:22
60	Clark	Colon	risus@icloud.com	(648) 458-8173	68	2022-08-18 05:37:58
61	Jasmine	Banks	natoque.penatibus@yahoo.com	1-308-322-5761	23	2023-07-16 13:48:48
62	Nathaniel	Juarez	urna.nunc@yahoo.couk	1-581-868-4386	87	2022-08-17 02:43:13
63	Arthur	Miller	vulputate.velit@icloud.couk	1-163-260-7836	33	2023-08-25 18:39:10
64	Tad	Woods	sed.dolor.fusce@aol.couk	(317) 552-1563	23	2023-04-11 16:39:58
65	Harper	Dotson	sem@google.edu	1-793-177-6813	7	2022-11-08 14:55:26
66	Vaughan	Mccarty	non.sapien@yahoo.net	1-636-551-7013	82	2023-07-24 22:30:56
67	Zephr	Oneil	sed.dui@protonmail.org	1-854-334-4716	13	2023-03-21 00:04:35
68	Cameran	Lopez	feugiat.nec@icloud.edu	(371) 357-4885	3	2022-05-01 00:58:17
69	Kaseem	Villarreal	vestibulum.lorem@icloud.net	1-791-911-8674	76	2023-11-25 09:03:22
70	Deirdre	Hodges	faucibus.morbi@aol.couk	(405) 824-6076	84	2022-08-07 19:55:38
71	Hiram	Kaufman	sit@yahoo.com	1-732-890-5153	2	2023-04-24 08:47:36
72	Nita	Blanchard	ullamcorper.nisl.arcu@yahoo.ca	1-237-352-1916	23	2023-01-16 19:12:21
73	Karly	Herring	nec.tellus.nunc@outlook.com	1-231-585-0705	15	2023-10-28 19:38:50
74	Mercedes	Mullins	pharetra.quisque.ac@icloud.net	(608) 306-4135	96	2024-04-04 11:23:17
75	James	Lowe	facilisis@google.net	1-442-538-9963	66	2022-09-29 04:06:39
76	Jillian	Norton	lorem.ipsum@outlook.com	1-950-316-3378	76	2023-03-15 15:28:33
77	Emma	Farrell	feugiat@icloud.couk	(856) 810-2650	56	2023-11-23 14:19:34
78	Lewis	Reynolds	massa.integer.vitae@google.net	(832) 376-1161	17	2022-08-11 05:53:35
79	Macy	Richardson	eros.turpis.non@icloud.net	(689) 806-8433	62	2022-09-11 10:09:42
80	Clementine	Hickman	tristique.senectus@protonmail.org	(908) 246-3136	75	2023-05-09 07:01:29
81	Lael	Terry	tellus@protonmail.couk	(102) 676-3220	86	2023-10-03 11:18:46
82	Holmes	Henson	mauris.ut@protonmail.net	(317) 378-9713	78	2023-07-23 11:28:36
83	Penelope	Jennings	auctor@yahoo.ca	1-596-217-2023	6	2023-01-07 04:52:48
84	Xenos	Chase	mi@icloud.net	(717) 760-0987	78	2023-11-15 21:50:55
85	Dawn	Wade	odio.a@outlook.net	(437) 969-8564	15	2023-04-02 17:12:48
86	Lysandra	Witt	urna.ut@aol.couk	1-485-736-6475	52	2023-03-11 16:11:29
87	Clark	Case	auctor@hotmail.org	1-733-727-8195	0	2023-01-24 23:09:42
88	Dacey	Chase	ornare@protonmail.ca	(893) 445-0297	97	2023-07-14 16:43:40
89	Colt	Irwin	tellus@protonmail.net	1-470-617-1832	93	2024-04-10 13:42:47
90	Anjolie	Waller	eget.lacus.mauris@yahoo.org	1-173-739-3168	10	2023-11-29 00:28:21
91	Kitra	Knowles	mus@aol.com	1-425-977-1454	61	2023-02-11 03:53:10
92	Marcia	Mccullough	tortor.nunc@hotmail.org	1-418-267-5236	15	2022-10-05 01:52:40
93	Medge	Palmer	tincidunt.orci@protonmail.edu	1-510-537-3772	60	2023-04-10 02:36:48
94	Paula	Gamble	ut.cursus@yahoo.ca	(682) 842-7507	75	2022-05-31 05:10:36
95	Charles	Craft	sed.eu.nibh@icloud.net	1-776-967-4475	63	2023-11-28 16:51:51
96	Sage	Wyatt	lobortis@icloud.ca	1-352-183-3854	10	2022-09-02 19:22:26
97	Noelani	Parsons	augue@protonmail.ca	(368) 347-3558	12	2023-09-17 18:10:50
98	Indira	Zamora	sed.tortor@protonmail.net	(429) 675-9742	56	2022-07-11 09:41:30
99	Melvin	Dennis	donec@hotmail.org	1-798-527-3869	24	2022-06-01 16:51:33
100	Nell	Mccoy	dolor.sit@aol.couk	1-728-742-3147	96	2022-12-13 06:16:39
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: dmitry
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	http://naver.com/user/110	69	ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque.	2024-03-05 08:20:36	10
2	https://ebay.com/user/110	80	odio vel est tempor bibendum. Donec felis orci, adipiscing non,	2022-10-25 11:44:40	27
3	http://yahoo.com/en-ca	67	scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed	2023-05-01 01:16:00	44
4	http://ebay.com/en-ca	30	tempor erat neque non quam. Pellentesque habitant morbi tristique senectus	2023-06-22 10:45:18	76
5	https://netflix.com/user/110	83	luctus, ipsum leo elementum sem, vitae aliquam eros turpis non	2023-10-12 21:53:20	43
6	http://bbc.co.uk/one	45	ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede.	2022-09-17 08:18:55	8
7	https://reddit.com/sub/cars	21	velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices.	2024-03-25 23:43:48	52
8	https://baidu.com/settings	92	Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet	2023-10-19 16:42:29	91
9	https://walmart.com/one	85	egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta	2022-12-25 10:45:40	79
10	https://reddit.com/sub/cars	81	mattis semper, dui lectus rutrum urna, nec luctus felis purus	2023-06-06 16:44:35	33
11	https://naver.com/user/110	16	ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,	2022-10-28 06:20:20	16
12	https://naver.com/sub/cars	35	nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in	2023-10-06 21:14:56	46
13	http://youtube.com/en-ca	30	Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla	2022-12-10 05:30:58	32
14	https://twitter.com/en-us	48	eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula.	2022-10-26 02:52:56	15
15	https://bbc.co.uk/user/110	59	risus quis diam luctus lobortis. Class aptent taciti sociosqu ad	2023-12-17 04:24:29	84
16	https://zoom.us/group/9	37	vitae diam. Proin dolor. Nulla semper tellus id nunc interdum	2024-02-26 10:06:52	35
17	http://nytimes.com/en-ca	87	ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci	2023-07-13 19:47:04	6
18	https://walmart.com/one	32	dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum	2022-11-07 06:49:30	91
19	https://wikipedia.org/en-ca	99	velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus.	2022-05-31 01:30:26	37
20	http://ebay.com/en-ca	55	urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac	2023-03-21 23:37:36	71
21	https://pinterest.com/sub	7	ultrices a, auctor non, feugiat nec, diam. Duis mi enim,	2024-03-06 04:13:03	43
22	http://pinterest.com/group/9	57	Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer	2022-05-19 02:50:53	20
23	https://facebook.com/user/110	18	enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum,	2022-06-13 01:10:32	95
24	https://cnn.com/one	68	a feugiat tellus lorem eu metus. In lorem. Donec elementum,	2023-11-01 08:13:31	6
25	http://yahoo.com/site	86	orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean	2024-01-15 23:54:47	88
26	http://twitter.com/settings	35	sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci	2022-06-25 05:10:12	9
27	http://cnn.com/settings	51	ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor.	2023-02-01 14:20:47	33
28	https://youtube.com/user/110	5	lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.	2023-12-04 17:46:40	80
29	https://reddit.com/en-ca	31	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2022-09-13 04:20:41	94
30	http://google.com/sub/cars	87	sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue	2022-05-03 15:57:00	90
31	https://yahoo.com/settings	84	vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.	2023-05-30 09:05:13	72
32	https://baidu.com/sub	56	leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor	2024-03-26 17:01:19	40
33	https://reddit.com/sub/cars	41	at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit	2023-06-11 11:00:40	21
34	http://nytimes.com/settings	25	ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat.	2022-10-22 01:14:37	72
35	http://yahoo.com/site	65	Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris,	2023-10-01 13:51:03	99
36	https://reddit.com/one	58	mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor	2022-06-29 19:57:12	62
37	https://instagram.com/group/9	89	sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra,	2022-06-23 23:27:15	80
38	https://facebook.com/group/9	71	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue	2023-12-28 11:42:20	6
39	https://wikipedia.org/settings	46	dictum augue malesuada malesuada. Integer id magna et ipsum cursus	2023-04-22 16:00:53	14
40	http://wikipedia.org/settings	42	arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida	2023-07-30 15:14:26	70
41	http://google.com/settings	27	fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh	2022-08-05 05:51:47	16
42	http://twitter.com/sub	16	magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,	2022-04-22 16:26:33	15
43	http://instagram.com/sub	53	vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue	2022-10-02 02:08:38	31
44	http://zoom.us/group/9	12	interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	2022-10-29 12:41:51	96
45	http://cnn.com/group/9	90	ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra	2022-05-11 02:07:51	95
46	http://google.com/user/110	50	varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla	2023-10-09 09:46:01	93
47	https://youtube.com/one	65	tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum	2022-07-05 20:29:09	96
48	http://zoom.us/en-ca	5	amet ornare lectus justo eu arcu. Morbi sit amet massa.	2024-01-01 11:13:25	69
49	http://wikipedia.org/sub/cars	2	cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam	2022-10-28 08:17:09	89
50	https://nytimes.com/en-ca	37	sit amet, faucibus ut, nulla. Cras eu tellus eu augue	2022-08-29 12:49:09	17
51	http://baidu.com/one	97	accumsan convallis, ante lectus convallis est, vitae sodales nisi magna	2022-06-02 02:07:01	100
52	https://nytimes.com/fr	14	tortor at risus. Nunc ac sem ut dolor dapibus gravida.	2023-02-10 23:21:29	91
53	http://cnn.com/en-ca	50	lorem ipsum sodales purus, in molestie tortor nibh sit amet	2023-12-26 22:29:49	30
54	http://yahoo.com/settings	45	diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget,	2023-01-07 01:04:38	75
55	https://wikipedia.org/sub/cars	95	Vivamus non lorem vitae odio sagittis semper. Nam tempor diam	2023-01-11 09:50:31	69
56	http://guardian.co.uk/one	81	vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt	2023-05-15 01:08:13	64
57	http://naver.com/sub/cars	51	ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris	2023-03-16 22:47:25	61
58	https://twitter.com/site	91	nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	2022-11-10 07:49:43	42
59	https://whatsapp.com/one	92	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue	2022-10-28 05:09:10	92
60	http://bbc.co.uk/sub	93	amet ornare lectus justo eu arcu. Morbi sit amet massa.	2023-09-01 10:36:10	29
61	http://zoom.us/settings	37	magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna.	2023-11-11 03:54:39	63
62	https://instagram.com/user/110	86	dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse	2023-05-31 04:57:28	90
63	http://bbc.co.uk/site	32	Sed eget lacus. Mauris non dui nec urna suscipit nonummy.	2022-11-23 06:58:58	44
64	https://wikipedia.org/one	40	Sed congue, elit sed consequat auctor, nunc nulla vulputate dui,	2022-11-15 13:55:10	67
65	https://reddit.com/sub	22	volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis.	2023-08-10 06:39:04	42
66	https://bbc.co.uk/site	75	Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non,	2022-09-29 13:29:33	42
67	https://cnn.com/en-ca	66	tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh	2022-08-18 21:33:09	46
68	http://walmart.com/one	29	eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit	2023-11-03 01:43:00	55
69	http://wikipedia.org/site	88	faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis	2022-07-07 22:57:00	75
70	http://whatsapp.com/en-us	99	In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede	2024-03-23 23:47:55	9
71	http://zoom.us/sub/cars	79	eget varius ultrices, mauris ipsum porta elit, a feugiat tellus	2023-05-27 12:57:09	83
72	http://facebook.com/en-us	96	quam. Pellentesque habitant morbi tristique senectus et netus et malesuada	2023-06-24 11:12:21	60
73	http://google.com/fr	97	Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus.	2024-02-06 17:15:01	56
74	http://whatsapp.com/group/9	98	accumsan convallis, ante lectus convallis est, vitae sodales nisi magna	2024-03-03 09:19:40	87
75	http://facebook.com/sub/cars	83	pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu	2022-12-29 12:45:21	64
76	http://cnn.com/one	58	ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,	2022-06-06 19:07:07	64
77	https://nytimes.com/en-us	16	ipsum sodales purus, in molestie tortor nibh sit amet orci.	2022-11-25 13:31:28	36
78	http://naver.com/one	32	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices	2022-11-11 18:17:07	81
79	http://whatsapp.com/site	20	eleifend, nunc risus varius orci, in consequat enim diam vel	2022-05-01 07:03:21	55
80	https://yahoo.com/group/9	12	eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum	2022-08-14 06:49:13	85
81	https://nytimes.com/site	21	auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis	2022-10-27 10:09:08	54
82	https://yahoo.com/en-us	15	urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum	2022-06-18 11:13:43	23
83	http://pinterest.com/en-ca	49	cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam	2024-01-29 12:38:56	29
84	http://yahoo.com/group/9	18	dui. Cum sociis natoque penatibus et magnis dis parturient montes,	2024-01-22 14:11:10	64
85	http://zoom.us/site	58	augue ac ipsum. Phasellus vitae mauris sit amet lorem semper	2022-07-20 05:49:28	60
86	http://bbc.co.uk/sub	27	ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec,	2022-04-20 01:58:59	42
87	http://ebay.com/sub	24	vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras	2024-03-19 00:16:34	94
88	https://pinterest.com/one	19	leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,	2023-07-22 12:27:21	25
89	http://youtube.com/site	87	Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem,	2023-02-01 08:48:34	52
90	http://yahoo.com/sub/cars	47	Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae	2023-01-21 02:17:58	89
91	http://yahoo.com/site	26	lectus sit amet luctus vulputate, nisi sem semper erat, in	2023-08-26 12:03:31	59
92	http://youtube.com/sub	13	ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam	2024-03-09 11:25:44	35
93	https://wikipedia.org/one	77	Duis cursus, diam at pretium aliquet, metus urna convallis erat,	2023-12-09 23:10:50	35
94	https://cnn.com/sub/cars	50	placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,	2023-07-09 09:01:28	20
95	http://instagram.com/fr	34	et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	2023-01-27 06:38:38	72
96	https://netflix.com/group/9	32	Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi	2022-08-07 15:30:44	97
97	https://whatsapp.com/en-ca	59	Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi	2022-10-15 05:36:34	76
98	http://whatsapp.com/sub	75	vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.	2023-03-06 22:11:22	52
99	https://ebay.com/user/110	55	malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna.	2022-11-17 22:18:28	72
100	http://whatsapp.com/en-ca	25	laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend,	2022-05-07 16:11:05	9
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.communities_id_seq', 100, true);


--
-- Name: communities_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.communities_users_id_seq', 100, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 100, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.photo_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitry
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: dmitry
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

