--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(22),
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'johjohn', 14);
INSERT INTO public.games VALUES (2, 'user_1738223171185', 269);
INSERT INTO public.games VALUES (3, 'user_1738223171185', 942);
INSERT INTO public.games VALUES (4, 'user_1738223171184', 605);
INSERT INTO public.games VALUES (5, 'user_1738223171184', 86);
INSERT INTO public.games VALUES (6, 'user_1738223171185', 910);
INSERT INTO public.games VALUES (7, 'user_1738223171185', 67);
INSERT INTO public.games VALUES (8, 'user_1738223171185', 286);
INSERT INTO public.games VALUES (9, 'user_1738223499459', 830);
INSERT INTO public.games VALUES (10, 'user_1738223499459', 960);
INSERT INTO public.games VALUES (11, 'user_1738223499458', 234);
INSERT INTO public.games VALUES (12, 'user_1738223499458', 387);
INSERT INTO public.games VALUES (13, 'user_1738223499459', 780);
INSERT INTO public.games VALUES (14, 'user_1738223499459', 28);
INSERT INTO public.games VALUES (15, 'user_1738223499459', 603);
INSERT INTO public.games VALUES (16, 'user_1738223682071', 739);
INSERT INTO public.games VALUES (17, 'user_1738223682071', 577);
INSERT INTO public.games VALUES (18, 'user_1738223682070', 697);
INSERT INTO public.games VALUES (19, 'user_1738223682070', 344);
INSERT INTO public.games VALUES (20, 'user_1738223682071', 500);
INSERT INTO public.games VALUES (21, 'user_1738223682071', 969);
INSERT INTO public.games VALUES (22, 'user_1738223682071', 177);
INSERT INTO public.games VALUES (23, 'user_1738223839343', 688);
INSERT INTO public.games VALUES (24, 'user_1738223839343', 240);
INSERT INTO public.games VALUES (25, 'user_1738223839342', 477);
INSERT INTO public.games VALUES (26, 'user_1738223839342', 89);
INSERT INTO public.games VALUES (27, 'user_1738223839343', 371);
INSERT INTO public.games VALUES (28, 'user_1738223839343', 69);
INSERT INTO public.games VALUES (29, 'user_1738223839343', 544);
INSERT INTO public.games VALUES (30, 'user_1738223957659', 665);
INSERT INTO public.games VALUES (31, 'user_1738223957659', 99);
INSERT INTO public.games VALUES (32, 'user_1738223957658', 790);
INSERT INTO public.games VALUES (33, 'user_1738223957658', 676);
INSERT INTO public.games VALUES (34, 'user_1738223957659', 764);
INSERT INTO public.games VALUES (35, 'user_1738223957659', 818);
INSERT INTO public.games VALUES (36, 'user_1738223957659', 593);
INSERT INTO public.games VALUES (37, 'user_1738224008650', 783);
INSERT INTO public.games VALUES (38, 'user_1738224008650', 724);
INSERT INTO public.games VALUES (39, 'user_1738224008649', 580);
INSERT INTO public.games VALUES (40, 'user_1738224008649', 121);
INSERT INTO public.games VALUES (41, 'user_1738224008650', 409);
INSERT INTO public.games VALUES (42, 'user_1738224008650', 646);
INSERT INTO public.games VALUES (43, 'user_1738224008650', 637);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1738223000109');
INSERT INTO public.users VALUES ('user_1738223000108');
INSERT INTO public.users VALUES ('johnjohn');
INSERT INTO public.users VALUES ('johjohn');
INSERT INTO public.users VALUES ('user_1738223171185');
INSERT INTO public.users VALUES ('user_1738223171184');
INSERT INTO public.users VALUES ('user_1738223499459');
INSERT INTO public.users VALUES ('user_1738223499458');
INSERT INTO public.users VALUES ('user_1738223682071');
INSERT INTO public.users VALUES ('user_1738223682070');
INSERT INTO public.users VALUES ('user_1738223839343');
INSERT INTO public.users VALUES ('user_1738223839342');
INSERT INTO public.users VALUES ('user_1738223957659');
INSERT INTO public.users VALUES ('user_1738223957658');
INSERT INTO public.users VALUES ('user_1738224008650');
INSERT INTO public.users VALUES ('user_1738224008649');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 43, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

