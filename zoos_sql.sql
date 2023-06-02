--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-01 22:53:29

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
-- TOC entry 219 (class 1259 OID 16779)
-- Name: animals; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    commom_name character varying(255) NOT NULL,
    scientific_name character varying(255) NOT NULL,
    is_in_danger_of_extinction boolean NOT NULL,
    gender "char"
);


ALTER TABLE public.animals OWNER TO db_user;

--
-- TOC entry 214 (class 1259 OID 16721)
-- Name: animals_by_zoo; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.animals_by_zoo (
    id integer NOT NULL,
    zoo_id integer NOT NULL,
    animal_id integer NOT NULL
);


ALTER TABLE public.animals_by_zoo OWNER TO db_user;

--
-- TOC entry 215 (class 1259 OID 16724)
-- Name: cities; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO db_user;

--
-- TOC entry 216 (class 1259 OID 16727)
-- Name: continents; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.continents (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.continents OWNER TO db_user;

--
-- TOC entry 217 (class 1259 OID 16730)
-- Name: countries; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    continent_id integer NOT NULL
);


ALTER TABLE public.countries OWNER TO db_user;

--
-- TOC entry 218 (class 1259 OID 16733)
-- Name: zoos; Type: TABLE; Schema: public; Owner: db_user
--

CREATE TABLE public.zoos (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    area numeric DEFAULT 0 NOT NULL,
    budget numeric DEFAULT 0 NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.zoos OWNER TO db_user;

--
-- TOC entry 3171 (class 0 OID 16779)
-- Dependencies: 219
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.animals (id, commom_name, scientific_name, is_in_danger_of_extinction, gender) FROM stdin;
1	aveztruz	struthio camelus	f	F
2	cigüeña de abdim	ciconia abdimii	f	F
3	boa de duméril	acantrophis dumerili	f	M
4	camaleón pantera/leopardo	furcifer pardalis	t	F
5	cocodrilo enano	crocodylus niloticus	f	M
6	antílope acuático	kobus ellipsyprimnus	t	M
7	búfalo rojo	syncerus caffer nanus	f	M
8	cebra de grant	equus burchelli boehmi	f	F
9	chimpancé	pan troglodytes	f	F
10	condor de california	gymnogyps californianus	t	M
\.


--
-- TOC entry 3166 (class 0 OID 16721)
-- Dependencies: 214
-- Data for Name: animals_by_zoo; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.animals_by_zoo (id, zoo_id, animal_id) FROM stdin;
1	1	1
2	1	2
3	1	4
5	2	1
6	2	3
7	2	5
8	3	4
10	3	11
11	3	12
13	5	1
14	5	8
15	5	9
16	6	7
17	7	3
18	7	9
19	7	10
20	7	12
21	8	4
22	8	8
23	9	2
24	9	5
25	9	10
26	9	11
27	9	12
4	1	7
12	4	3
28	10	6
9	3	5
\.


--
-- TOC entry 3167 (class 0 OID 16724)
-- Dependencies: 215
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.cities (id, name, country_id) FROM stdin;
1	Cali	1
2	Pereira	1
3	Barranquilla	1
4	Lima	2
5	Cusco	2
6	Buenos Aires	3
7	Mar de Plata	3
8	California	4
9	Madrid	5
10	Chennai	6
11	Asahiyama	7
12	Sídney	8
\.


--
-- TOC entry 3168 (class 0 OID 16727)
-- Dependencies: 216
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.continents (id, name) FROM stdin;
1	America
2	Africa
3	Asia
4	Europa
5	Oceania
\.


--
-- TOC entry 3169 (class 0 OID 16730)
-- Dependencies: 217
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.countries (id, name, continent_id) FROM stdin;
1	Colombia	1
2	Perú	1
3	Argentina	1
4	Estados Unidos	1
5	España	4
6	India	2
7	Japon	3
8	Australia	5
\.


--
-- TOC entry 3170 (class 0 OID 16733)
-- Dependencies: 218
-- Data for Name: zoos; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.zoos (id, name, area, budget, city_id) FROM stdin;
12	zoológico Taronga	120	700	12
1	zoológico de Calimio	450	700	1
2	zoológico Matecaña	700	720	2
3	zoológico de Barranquilla	350	800	3
5	zoologico UNSAAC	700	740	5
7	zoológico de Batán	400	500	7
4	Parque de las Leyendas	970	750	4
9	Aquarium de Madrid	600	750	9
10	zoológico Arignar Anna	800	750	10
8	zoológico de San Diego	200	750	8
11	zoológico Asahiyama	900	750	11
6	Temaiken Bioparque	100	750	6
\.


--
-- TOC entry 3010 (class 2606 OID 16743)
-- Name: animals_by_zoo animals_by_zoo_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.animals_by_zoo
    ADD CONSTRAINT animals_by_zoo_pkey PRIMARY KEY (id);


--
-- TOC entry 3020 (class 2606 OID 16785)
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 16745)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3014 (class 2606 OID 16747)
-- Name: continents continents_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_pkey PRIMARY KEY (id);


--
-- TOC entry 3016 (class 2606 OID 16749)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3018 (class 2606 OID 16751)
-- Name: zoos zoos_pkey; Type: CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.zoos
    ADD CONSTRAINT zoos_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 16762)
-- Name: zoos fk_city_zoo; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.zoos
    ADD CONSTRAINT fk_city_zoo FOREIGN KEY (city_id) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 16757)
-- Name: countries fk_continet_country; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT fk_continet_country FOREIGN KEY (continent_id) REFERENCES public.continents(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3021 (class 2606 OID 16752)
-- Name: cities fk_country_city; Type: FK CONSTRAINT; Schema: public; Owner: db_user
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_country_city FOREIGN KEY (country_id) REFERENCES public.countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2023-06-01 22:53:39

--
-- PostgreSQL database dump complete
--

