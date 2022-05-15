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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50),
    galaxy_type character varying(50),
    distance_ly integer
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
    name character varying(50) NOT NULL,
    radius integer,
    planet_id integer,
    landed boolean
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
    star_id integer,
    name character varying(50) NOT NULL,
    description text,
    radius integer,
    known_moons numeric,
    has_water boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    star_types_id integer,
    description text
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
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type_description text
);

ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_types.star_types_id;

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
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 'Canes Venatici', 'intermediate spiral', NULL);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'Sagittarius', 'barred spiral', 0);
INSERT INTO public.galaxy VALUES (7, 'Comet Galaxy', 'Sculptor', 'spiral', NULL);
INSERT INTO public.galaxy VALUES (9, 'Canis Major Dwarf', 'Canis Major', 'irregular', 25000);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda', 'barred spiral', 2498288);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'Corvus', 'barred spiral', 44969199);
INSERT INTO public.galaxy VALUES (3, 'Backward', 'Centaurus', 'unbarred spiral', 17288158);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'Centaurus', 'lenticular', 9993155);
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 'Coma', 'spiral', 17288158);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 11, 4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 5, 4, false);
INSERT INTO public.moon VALUES (4, 'Europa', 1561, 5, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, 5, false);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410, 5, false);
INSERT INTO public.moon VALUES (7, 'Titan', 2575, 6, false);
INSERT INTO public.moon VALUES (8, 'Rhea', 1527, 6, false);
INSERT INTO public.moon VALUES (9, 'Titania', 789, 7, false);
INSERT INTO public.moon VALUES (10, 'Hippocamp', 9, 8, false);
INSERT INTO public.moon VALUES (1, 'Moon', 1737, 3, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Dione', NULL, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Tethys', NULL, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Mimas', NULL, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Phoebe', NULL, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Hyperion', NULL, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Janus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Pandora', NULL, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Helene', NULL, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Atlas', NULL, 6, NULL);
INSERT INTO public.moon VALUES (22, 'Pan', NULL, 6, NULL);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Venus is close in size to Earth and, like Earth, has a thick silicate mantle around an iron core, a substantial atmosphere, and evidence of internal geological activity. ', 6052, 0, false);
INSERT INTO public.planet VALUES (11, 4, 'b', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 1, 'Earth', ' Earth is the largest and densest of the inner planets, the only one known to have current geological activity, and the only place where life is known to exist.', 6371, 1, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', ' Mars is smaller than Earth and Venus. It has an atmosphere of mostly carbon dioxide with a surface pressure of 6.1 millibars; roughly 0.6% of that of Earth but sufficient to support weather phenomena.', 3390, 2, true);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Jupiter is 2.5 times the mass of all the other planets put together. It is composed largely of hydrogen and helium. Jupiters strong internal heat creates semi-permanent features in its atmosphere, such as cloud bands and the Great Red Spot', 69911, 53, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Saturn distinguished by its extensive ring system, has several similarities to Jupiter, such as its atmospheric composition and magnetosphere. Although Saturn has 60% of Jupiters volume, it is less than a third as massive.', 58232, 82, true);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Uranus has the lowest mass of the outer planets. Uniquely among the planets, it orbits the Sun on its side; its axial tilt is over ninety degrees to the ecliptic. This gives the planet extreme seasonal variation as each pole points toward and then away from the Sun.', 25362, 27, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Neptune, though slightly smaller than Uranus, is more massive and hence more dense. It radiates more internal heat than Uranus, but not as much as Jupiter or Saturn. Neptune has 14 known satellites. The largest, Triton, is geologically active, with geysers of liquid nitrogen.', 24622, 14, true);
INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Mercury is the closest planet to the Sun. The smallest planet in the Solar System, Mercury has no natural satellites. ', 2439, 0, true);
INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri b', 'Proxima Centauri b, or Alpha Centauri Cb, orbits the star at a distance of roughly 0.05 AU (7.5 million km) with an orbital period of approximately 11.2 Earth days. ', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 5, 'TRAPPIST-1c', 'Mainly rocky, Venus-like exoplanet orbiting around the ultracool dwarf star TRAPPIST-1 approximately 40 light-years away from Earth in the constellation Aquarius.', NULL, 0, false);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri c', 'If Proxima Centauri b were the stars Earth, Proxima Centauri c would be equivalent to Neptune. Due to its large distance from Proxima Centauri, it is unlikely to be habitable, with a low equilibrium temperature of around 39 K.', NULL, NULL, NULL);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 6, 4, NULL);
INSERT INTO public.star VALUES (3, 'Lalande 21185', 6, 4, NULL);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 6, 4, NULL);
INSERT INTO public.star VALUES (7, 'Procyon B', 6, 2, NULL);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 6, 3, NULL);
INSERT INTO public.star VALUES (9, 'Rigel', 6, 5, NULL);
INSERT INTO public.star VALUES (10, 'Wolf 1061', 6, 4, NULL);
INSERT INTO public.star VALUES (11, 'Upsilon Andromedae', 6, 2, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 6, 1, 'Our Sun is a 4.5 billion-year-old star – a hot glowing ball of hydrogen and helium at the center of our solar system. The Sun is about 93 million miles (150 million kilometers) from Earth, and without its energy, life as we know it could not exist here on our home planet.');
INSERT INTO public.star VALUES (4, 'Kepler-90', 6, 1, 'Kepler-90 is a G-type star that is approximately 120% the mass and radius of the Sun. It has a surface temperature of 6080 K, and an estimated age of around 2 billion years.');
INSERT INTO public.star VALUES (6, 'Sirius B', 6, 2, 'Sirius B is one of the most massive white dwarfs known. With a mass of 1.02 M ☉, it is almost double the 0.5–0.6 M ☉ average.');

--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'Yellow Dwarf', 'Yellow, of medium size, slowly growing, warm-ish');
INSERT INTO public.star_types VALUES (2, 'White Dwarf', 'Very dense, small and hot');
INSERT INTO public.star_types VALUES (3, 'Red Giant', 'Very bright, cool, at its dying stage');
INSERT INTO public.star_types VALUES (4, 'Red Dwarf', 'Smallest and coolest star, most common type');
INSERT INTO public.star_types VALUES (5, 'Blue Giant', 'Big, bright and very hot');

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 5, true);

--
-- Name: galaxy galaxy_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_pk PRIMARY KEY (galaxy_id);

--
-- Name: moon moon_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_pk PRIMARY KEY (moon_id);

--
-- Name: planet planet_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_pk PRIMARY KEY (planet_id);

--
-- Name: star star_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_pk PRIMARY KEY (star_id);

--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);

--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);

--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);

--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);

--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);

--
-- Name: star_types unique_star_type_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT unique_star_type_id UNIQUE (star_types_id);

--
-- Name: star galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- Name: moon planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- Name: star star_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_type_id_fk FOREIGN KEY (star_types_id) REFERENCES public.star_types(star_types_id);

--
-- PostgreSQL database dump complete
--


