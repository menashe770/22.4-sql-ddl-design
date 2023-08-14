-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines NOT NULL,
  from_city_id INTEGER REFERENCES cities NOT NULL,
  from_country_id INTEGER REFERENCES countries NOT NULL,
  to_city_id INTEGER REFERENCES cities NOT NULL,
  to_country_id INTEGER REFERENCES countries NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'), -- 1
  ('Thadeus', 'Gathercoal'), -- 2
  ('Sonja', 'Pauley'), -- 3
  ('Waneta', 'Skeleton'), -- 4
  ('Berkie', 'Wycliff'), -- 5
  ('Alvin', 'Leathes'), -- 6
  ('Cory', 'Squibbes'); -- 7

INSERT INTO airlines
  (name)
VALUES
  ('United'), -- 1
  ('British Airways'), -- 2
  ('Delta'), -- 3
  ('TUI Fly Belgium'), -- 4
  ('Air China'), -- 5
  ('American Airlines'), -- 6
  ('Avianca Brasil'); -- 7

INSERT INTO countries
  (name)
VALUES
  ('United States'), -- 1
  ('Japan'), -- 2
  ('United Kingdom'), -- 3
  ('Mexico'), -- 4
  ('France'), -- 5
  ('Morocco'), -- 6
  ('UAE'), -- 7
  ('China'), -- 8
  ('Brazil'), -- 9
  ('Chile'); -- 10

INSERT INTO cities
  (name)
VALUES
  ('Washington DC'), -- 1
  ('Seattle'), -- 2
  ('Tokyo'), -- 3
  ('London'), -- 4
  ('Los Angeles'), -- 5
  ('Las Vegas'), -- 6
  ('Mexico City'), -- 7
  ('Paris'), -- 8
  ('Casablanca'), -- 9
  ('Dubai'), -- 10
  ('Beijing'), -- 11
  ('New York'), -- 12
  ('Charlotte'), -- 13
  ('Cedar Rapids'), -- 14
  ('Chicago'), -- 15
  ('New Orleans'), -- 16
  ('Sao Paolo'), -- 17
  ('Santiago'); -- 18

INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);