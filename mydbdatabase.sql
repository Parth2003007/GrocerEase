--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-02 11:35:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16388)
-- Name: product_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_table (
    id integer NOT NULL,
    name character varying(100),
    expiry_date date,
    barcode character varying(20)
);


ALTER TABLE public.product_table OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16391)
-- Name: product_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_table_id_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_table_id_seq OWNED BY public.product_table.id;


--
-- TOC entry 220 (class 1259 OID 16398)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    expiry_date date,
    barcode character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16397)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 4747 (class 2604 OID 16392)
-- Name: product_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_table ALTER COLUMN id SET DEFAULT nextval('public.product_table_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16401)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4902 (class 0 OID 16388)
-- Dependencies: 217
-- Data for Name: product_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_table (id, name, expiry_date, barcode) FROM stdin;
\.


--
-- TOC entry 4905 (class 0 OID 16398)
-- Dependencies: 220
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, expiry_date, barcode) FROM stdin;
20	Milk	2025-02-09	100000001
21	Eggs	2025-02-04	100000002
22	Bread	2025-01-29	100000003
23	Cheese	2025-02-11	100000004
24	Butter	2025-02-14	100000005
25	Yogurt	2025-02-07	100000006
26	Spinach	2025-02-03	100000007
27	Chicken	2025-02-02	100000008
28	Carrot	2025-01-31	100000009
29	Juice	2025-01-28	100000010
30	Tomato	2025-02-17	100000011
31	Apple	2025-02-19	100000012
32	Potato	2025-02-24	100000013
33	Matcha	2025-01-03	100000014
34	Rice	2025-12-30	100000015
35	Lentils	2026-06-15	100000016
36	Oats	2025-08-10	100000017
37	Cereal	2025-09-05	100000018
38	Pasta	2025-11-22	100000019
39	Flour	2025-10-17	100000020
40	Sugar	2026-01-05	100000021
41	Salt	2027-03-10	100000022
42	Black Pepper	2026-09-25	100000023
43	Olive Oil	2026-12-15	100000024
44	Vegetable Oil	2026-11-20	100000025
45	Honey	2027-06-30	100000026
46	Peanut Butter	2026-08-05	100000027
47	Jam	2026-07-10	100000028
48	Soy Sauce	2026-09-18	100000029
49	Vinegar	2027-04-01	100000030
50	Tomato Sauce	2025-09-22	100000031
51	Mustard	2026-05-14	100000032
52	Mayonnaise	2025-10-09	100000033
53	Chili Sauce	2026-02-11	100000034
54	Frozen Peas	2026-01-29	100000035
55	Frozen Corn	2026-03-15	100000036
56	Frozen Chicken	2026-04-20	100000037
57	Frozen Fish	2026-05-18	100000038
58	Ice Cream	2025-11-11	100000039
59	Butter Cookies	2025-07-23	100000040
60	Chips	2025-06-08	100000041
61	Chocolate	2025-12-05	100000042
62	Candy	2025-09-29	100000043
63	Coffee	2026-10-17	100000044
64	Tea	2026-09-12	100000045
65	Green Tea	2026-11-30	100000046
66	Soft Drink	2025-08-21	100000047
67	Energy Drink	2025-10-14	100000048
68	Beer	2026-02-20	100000049
69	Wine	2030-12-31	100000050
70	Whiskey	2035-01-01	100000051
71	Vodka	2034-07-07	100000052
72	Coconut Water	2025-06-15	100000053
73	Almond Milk	2025-05-20	100000054
74	Cashew Milk	2025-04-30	100000055
75	Tofu	2025-02-28	100000056
76	Mushrooms	2025-02-15	100000057
77	Bell Peppers	2025-02-12	100000058
78	Lettuce	2025-02-10	100000059
79	Cucumber	2025-02-08	100000060
80	Onions	2025-03-01	100000061
81	Garlic	2025-03-10	100000062
82	Lemon	2025-02-25	100000063
83	Oranges	2025-02-22	100000064
84	Banana	2025-02-05	100000065
85	Grapes	2025-02-18	100000066
86	Watermelon	2025-03-07	100000067
87	Pineapple	2025-03-15	100000068
88	Strawberries	2025-02-06	100000069
89	Blueberries	2025-02-09	100000070
90	Raspberries	2025-02-07	100000071
91	Avocado	2025-02-10	100000072
92	Pumpkin	2025-03-12	100000073
93	Cabbage	2025-02-14	100000074
94	Peanuts	2026-06-21	100000075
95	Almonds	2026-07-10	100000076
96	Cashews	2026-08-15	100000077
97	Walnuts	2026-09-05	100000078
98	Macadamia Nuts	2026-10-01	100000079
99	Hazelnuts	2026-10-20	100000080
100	Sunflower Seeds	2026-11-05	100000081
101	Chia Seeds	2026-11-25	100000082
102	Flaxseeds	2026-12-12	100000083
103	Quinoa	2026-07-30	100000084
104	Barley	2026-09-12	100000085
105	Cornmeal	2026-10-15	100000086
106	Rye Flour	2026-11-08	100000087
107	Whole Wheat Flour	2026-11-20	100000088
108	Coconut Flour	2026-12-05	100000089
109	Almond Flour	2026-12-18	100000090
110	Canned Beans	2027-03-10	100000091
111	Canned Tomatoes	2027-04-15	100000092
112	Canned Peaches	2027-06-01	100000093
113	Canned Pineapple	2027-07-12	100000094
114	Maple Syrup	2027-08-20	100000095
115	Molasses	2027-09-30	100000096
116	Sesame Oil	2027-10-05	100000097
117	Coconut Oil	2027-11-18	100000098
118	Ghee	2027-12-25	100000099
119	Baking Powder	2027-08-10	100000100
\.


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_table_id_seq', 1, false);


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 120, true);


--
-- TOC entry 4750 (class 2606 OID 16394)
-- Name: product_table product_table_barcode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_barcode_key UNIQUE (barcode);


--
-- TOC entry 4752 (class 2606 OID 16396)
-- Name: product_table product_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_table
    ADD CONSTRAINT product_table_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2606 OID 16407)
-- Name: products products_barcode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_barcode_key UNIQUE (barcode);


--
-- TOC entry 4756 (class 2606 OID 16405)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


-- Completed on 2025-02-02 11:35:45

--
-- PostgreSQL database dump complete
--

