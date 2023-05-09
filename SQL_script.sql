create table fact_flights (
	id serial,
	passenger_name varchar(200),
	actual_departure timestamp,
	actual_arrival timestamp,
	delay_departure varchar(50),
	delay_arrival varchar(50),
	aircrafts varchar(50),
	departure_airport varchar(50),
	arrival_airport  varchar(50),
	fare_conditions varchar(10),
	amount numeric(10,2)
);

create table fact_flights_rejected (
	id serial,
	passenger_name varchar(200),
	actual_departure timestamp,
	actual_arrival timestamp,
	delay_departure varchar(50),
	delay_arrival varchar(50),
	aircrafts varchar(50),
	departure_airport varchar(50),
	arrival_airport  varchar(50),
	fare_conditions varchar(10),
	amount numeric(10,2)
);



create table dim_calendar (
	"date" date
);

insert into dim_calendar ("date")
select calendar::date
from pg_catalog.generate_series('01-01-2000'::date, '01-01-2023'::date, interval '1 day') as "calendar";


create table dim_passengers (
	id serial,
	passenger_passport varchar(30),
	passenger_name varchar(200),
	email varchar(100),
	phone varchar(100)
);

create table dim_aircrafts (
	id serial,
	aircraft_code varchar(100),
	model varchar(100),
	"range" int
);

create table dim_airports (
	id serial,
	airport_code varchar(3),
	airport_name varchar(150),
	city varchar(150),
	longitude float8,
	latitude float8,
	timezone varchar(100)
);


create table dim_tariff (
	id serial,
	fare_conditions varchar(10)
);



