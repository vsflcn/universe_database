
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



CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbit_period integer,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;



CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;



CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type character varying(50),
    is_spherical boolean DEFAULT true NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;


CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;



CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer,
    is_volcanic boolean DEFAULT false NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;


CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;



CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(10,3),
    has_life boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;


CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;



CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity numeric(10,3),
    temperature integer,
    is_sun boolean DEFAULT false NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;


CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;



ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);



ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);



ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);



INSERT INTO public.comet VALUES (1, 'Halley', 76, 'Comet with 76-year period.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533, 'Large comet visible to the naked eye.');
INSERT INTO public.comet VALUES (3, 'Encke', 3, 'Short-period comet with 3.3-year orbit.');



INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy.', 13000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest neighbor.', 10000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Smaller nearby galaxy.', 8000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral galaxy.', 12000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with a wide brim.', 9000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Large elliptical galaxy.', 13000, 'Elliptical', true);



INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 4, 3642, true);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3122, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 5268, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, false);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 5150, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 1528, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 5, 1468, false);
INSERT INTO public.moon VALUES (11, 'Dione', 5, 1123, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 5, 1062, false);
INSERT INTO public.moon VALUES (13, 'Oberon', 6, 1522, false);
INSERT INTO public.moon VALUES (14, 'Titania', 6, 1578, false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 6, 1169, false);
INSERT INTO public.moon VALUES (16, 'Miranda', 6, 471, false);
INSERT INTO public.moon VALUES (17, 'Triton', 7, 2706, true);
INSERT INTO public.moon VALUES (18, 'Charon', 8, 1212, false);
INSERT INTO public.moon VALUES (19, 'Styx', 8, 16, false);
INSERT INTO public.moon VALUES (20, 'Nix', 8, 49, false);



INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.972, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.641, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 4.867, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 1898.000, false);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 568.000, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 0.330, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 86.800, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 102.000, false);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 2, 1.100, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 6, 1.300, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 6, 0.330, true);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', 6, 7.000, true);



INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, 5778, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 1.500, 5790, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 2.300, 3590, false);
INSERT INTO public.star VALUES (4, 'Sirius', 2, 2.500, 9940, false);
INSERT INTO public.star VALUES (5, 'Polaris', 2, 1.200, 6000, false);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 2, 0.300, 3042, false);


SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);



SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);




SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);




SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);



SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);




ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);



ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);



ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);




ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);



ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);



ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);



ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);



ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);



ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);



ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);



ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);



ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

