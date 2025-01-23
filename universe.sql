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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: boss; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.boss (
    boss_id integer NOT NULL,
    name character varying(30),
    phases integer,
    uses_projectiles boolean,
    moon_id integer NOT NULL
);


ALTER TABLE public.boss OWNER TO freecodecamp;

--
-- Name: boss_boss_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.boss_boss_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boss_boss_id_seq OWNER TO freecodecamp;

--
-- Name: boss_boss_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.boss_boss_id_seq OWNED BY public.boss.boss_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    tagline text,
    metacritic_score numeric(3,1),
    has_yoshi boolean,
    main_collectible character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    collected boolean,
    primary_power_up character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer NOT NULL,
    theme text,
    friends character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    clctbls_to_unlock integer,
    bowser_encounter boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: boss boss_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.boss ALTER COLUMN boss_id SET DEFAULT nextval('public.boss_boss_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: boss; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.boss VALUES (1, 'Dino Piranha', 4, false, 2);
INSERT INTO public.boss VALUES (2, 'King Kaliente', 3, true, 4);
INSERT INTO public.boss VALUES (3, 'Bugaboom', 3, false, 7);
INSERT INTO public.boss VALUES (4, 'Megaleg', 3, true, 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Super Mario Galaxy', 'A Mario adventure of cosmic proportions!', 97.0, false, 'Stars');
INSERT INTO public.galaxy VALUES (2, 'Super Mario Galaxy 2', 'Mario and Yoshi blast off into a new galactic adventure!', 97.0, true, 'Stars');
INSERT INTO public.galaxy VALUES (4, 'Super Mario 64', 'Its-a me, Mario!', 94.0, true, 'Stars');
INSERT INTO public.galaxy VALUES (5, 'Super Mario 3D World', 'Marios latest is the cats pajamas!', 93.0, false, 'Stars');
INSERT INTO public.galaxy VALUES (3, 'Super Mario Odyssey', 'Embark on a cap-tivating, globe-trotting adventure!', 97.0, true, 'Moons');
INSERT INTO public.galaxy VALUES (6, 'Super Mario Sunshine', 'Pollution and paradise dont mix.', 92.0, true, 'Shines');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Grand Star Rescue', 1, true, NULL);
INSERT INTO public.moon VALUES (2, 'Dino Piranha', 2, true, NULL);
INSERT INTO public.moon VALUES (3, 'A Snack of Cosmic Proportions', 2, true, NULL);
INSERT INTO public.moon VALUES (4, 'King Kalientes Battle Fleet', 2, true, NULL);
INSERT INTO public.moon VALUES (5, 'Bee Mario Takes Flight', 3, true, 'Bee Mushroom');
INSERT INTO public.moon VALUES (6, 'Trouble on the Tower', 3, true, 'Bee Mushroom');
INSERT INTO public.moon VALUES (7, 'Big Bad Bugaboom', 3, true, 'Bee Mushroom');
INSERT INTO public.moon VALUES (8, 'Surfing 101', 4, true, NULL);
INSERT INTO public.moon VALUES (9, 'Painting the Planet Yellow', 5, false, NULL);
INSERT INTO public.moon VALUES (10, 'Megalegs Moon', 6, true, NULL);
INSERT INTO public.moon VALUES (11, 'Pull Star Path', 7, false, NULL);
INSERT INTO public.moon VALUES (12, 'Kamellas Airship Attack', 7, true, NULL);
INSERT INTO public.moon VALUES (13, 'Tarantoxs Tangled Web', 7, false, NULL);
INSERT INTO public.moon VALUES (14, 'Battlerock Barrage', 8, true, NULL);
INSERT INTO public.moon VALUES (15, 'Breaking into the Battlerock', 8, true, NULL);
INSERT INTO public.moon VALUES (16, 'Topmaniac and the Topman Tribe', 8, false, NULL);
INSERT INTO public.moon VALUES (17, 'Rolling in the Clouds', 9, false, NULL);
INSERT INTO public.moon VALUES (18, 'Shrinking Satellite', 10, true, NULL);
INSERT INTO public.moon VALUES (19, 'A Very Sticky Situation', 11, false, NULL);
INSERT INTO public.moon VALUES (20, 'The Fiery Stronghold', 12, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Gateway Galaxy', 1, 'Intro', 'Star Bunnies');
INSERT INTO public.planet VALUES (2, 'Good Egg Galaxy', 2, 'Understanding the mechanics', 'Lumas');
INSERT INTO public.planet VALUES (3, 'Honeyhive Galaxy', 2, 'Honey and climbing', 'Bees');
INSERT INTO public.planet VALUES (4, 'Loopdeeloop Galaxy', 2, 'Motion controls - ray surfing', 'Penguins');
INSERT INTO public.planet VALUES (5, 'Flipswitch Galaxy', 2, 'Switch panels', NULL);
INSERT INTO public.planet VALUES (6, 'Bowser Jrs Robot Reactor', 2, 'First big boss battle', 'Lumas');
INSERT INTO public.planet VALUES (7, 'Space Junk Galaxy', 3, 'Navigating using pull stars', NULL);
INSERT INTO public.planet VALUES (8, 'Battlerock Galaxy', 3, 'Autoscroll and avoid the cannons', NULL);
INSERT INTO public.planet VALUES (9, 'Rolling Green Galaxy', 3, 'Motion controls - roll on a ball', NULL);
INSERT INTO public.planet VALUES (10, 'Hurry-Scurry Galaxy', 3, 'Collect the notes before the ground disappears', NULL);
INSERT INTO public.planet VALUES (11, 'Sling Pod Galaxy', 3, 'Mario YEET', NULL);
INSERT INTO public.planet VALUES (12, 'Bowsers Star Reactor', 3, 'First showdown with Bowser', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Gate', 1, 0, false);
INSERT INTO public.star VALUES (2, 'Terrace', 1, 0, false);
INSERT INTO public.star VALUES (3, 'Fountain', 1, 9, true);
INSERT INTO public.star VALUES (4, 'Kitchen', 1, 16, false);
INSERT INTO public.star VALUES (5, 'Bedroom', 1, 24, true);
INSERT INTO public.star VALUES (6, 'Engine Room', 1, 34, false);
INSERT INTO public.star VALUES (7, 'Garden', 1, 46, false);
INSERT INTO public.star VALUES (8, 'Center of the Universe', 1, 60, true);
INSERT INTO public.star VALUES (13, 'World 1', 2, 0, false);
INSERT INTO public.star VALUES (14, 'World 2', 2, 8, true);
INSERT INTO public.star VALUES (15, 'World 3', 2, 17, false);
INSERT INTO public.star VALUES (16, 'World 4', 2, 29, true);
INSERT INTO public.star VALUES (17, 'World 5', 2, 41, false);
INSERT INTO public.star VALUES (18, 'World 6', 2, 56, true);
INSERT INTO public.star VALUES (19, 'World S', 2, 71, false);


--
-- Name: boss_boss_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.boss_boss_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: boss boss_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.boss
    ADD CONSTRAINT boss_moon_id_key UNIQUE (moon_id);


--
-- Name: boss boss_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.boss
    ADD CONSTRAINT boss_name_key UNIQUE (name);


--
-- Name: boss boss_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.boss
    ADD CONSTRAINT boss_pkey PRIMARY KEY (boss_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: boss boss_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.boss
    ADD CONSTRAINT boss_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

