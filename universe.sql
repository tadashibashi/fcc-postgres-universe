--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(48) NOT NULL,
    area_in_sq_deg integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(48) NOT NULL,
    constellation_id integer NOT NULL,
    distance_in_mly numeric(8,2),
    apparent_magnitude numeric(4,2),
    description text
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
    name character varying(48) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet_in_miles integer,
    orbital_period_in_days numeric(8,2)
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
    name character varying(32) NOT NULL,
    distance_from_star_in_au numeric(9,3),
    moon_count integer,
    is_dwarf boolean,
    is_terrestrial boolean,
    star_id integer NOT NULL
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
    name character varying(48) NOT NULL,
    star_id integer NOT NULL,
    distance_from_sun_in_ly numeric(20,1),
    solar_masses numeric(10,2),
    galaxy_id integer NOT NULL,
    known_planet_count integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 867);
INSERT INTO public.constellation VALUES (2, 'Dorado/Mensa', 332);
INSERT INTO public.constellation VALUES (3, 'Tucana', 295);
INSERT INTO public.constellation VALUES (4, 'Andromeda', 722);
INSERT INTO public.constellation VALUES (5, 'Triangulum', 132);
INSERT INTO public.constellation VALUES (6, 'Centaurus', 1060);
INSERT INTO public.constellation VALUES (7, 'Ursa Major', 1280);
INSERT INTO public.constellation VALUES (8, 'Sculptor', 475);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 0.00, -6.50, 'The Milky Way is the galaxy that includes our Solar System, its name describing its appearance in the night sky.');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 3, 0.20, 2.70, 'The Small Magellanic Cloud is a dwarf galaxy near the Milky Way containing several hundred million stars.');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 2, 0.16, 0.90, 'The Large Magellanic Cloud is a satellite galaxy of the Milky Way. It is the second- or third-closest galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 4, 2.50, 3.40, 'The Andromeda Galaxy is the nearest large galaxy to the Milky Way. Its name stems from the area of the Earth''s sky in which it appears, within the Andromeda constellation.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 5, 2.90, 5.70, 'Located behind the Andromeda Galaxy and Milky Way, it is believed to be a satellite of the former.');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6, 13.70, 6.84, 'Discovered in 1826 by Scottish astronomer James Dunlop.');
INSERT INTO public.galaxy VALUES (7, 'Bode''s Galaxy', 7, 12.00, 6.94, 'A grand design spiral galaxy that may be the source of a repeating fast radio burst.');
INSERT INTO public.galaxy VALUES (8, 'Sculptor Galaxy', 8, 12.00, 7.20, 'Also known as the Silver Dollar Galaxy, the Sculptor Galaxy is currently undergoing a period of intense star formation.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 238900, 27.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 3700, 0.33);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 14573, 1.25);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 417000, 3.54);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 665000, 7.17);
INSERT INTO public.moon VALUES (6, 'Io', 5, 421700, 1.75);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1168000, 17.00);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 112500, 0.50);
INSERT INTO public.moon VALUES (9, 'Adrastea', 5, 80200, 0.29);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 759000, 16.00);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 148000, 1.38);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 115280, 0.96);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 80654, 1.42);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 270820, 8.71);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 362000, 13.00);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 220500, 5.88);
INSERT INTO public.moon VALUES (17, 'Thalassa', 8, 15700, 0.29);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 3425900, 360.00);
INSERT INTO public.moon VALUES (19, 'Galatea', 8, 23100, 0.42);
INSERT INTO public.moon VALUES (20, 'Despina', 8, 17200, 0.33);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.400, 0, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.700, 0, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.000, 1, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.500, 2, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.200, 79, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.500, 62, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 19.800, 27, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 30.100, 14, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 2.800, 0, true, false, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 39.000, 5, true, false, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', 45.800, 1, true, false, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 43.000, 2, true, false, 1);
INSERT INTO public.planet VALUES (13, 'Eris', 68.000, 1, true, false, 1);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1 e', 0.290, 0, false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 0.0, 1.00, 1, 8);
INSERT INTO public.star VALUES ('TRAPPIST-1', 2, 40.7, 0.09, 1, 7);
INSERT INTO public.star VALUES ('Antares', 3, 554.5, 15.50, 1, 6);
INSERT INTO public.star VALUES ('Fomalhaut', 4, 25.1, 1.92, 1, 1);
INSERT INTO public.star VALUES ('Castor', 5, 50.9, 2.20, 1, 2);
INSERT INTO public.star VALUES ('Betelgeuse', 6, 642.5, 16.50, 1, 0);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_unique UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

