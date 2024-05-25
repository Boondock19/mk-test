
## Información del  catalago sobre las tablas y sus attt

### Usando el query se obtuvo la data de las tablas en sus catalogos
SELECT schemaname,tablename, attname , avg_width FROM pg_stats WHERE schemaname = 'bookings' AND tablename = tablename;

### Usando el query se obtuvo la informacion de cada tabla y sus atributos uno a uno.
SELECT TRUNC(AVG(pg_column_size(airport_name)),2) 
  AS avg_attr_size
  FROM bookings.boarding_passes;

### Usando el query se obtuvo la informacion de cada tabla y el tipo de dato sus atributos.
  SELECT 
  column_name, 
  data_type 
FROM 
  information_schema.columns 
WHERE 
  table_schema = 'bookings' AND 
  table_name = 'tickets';







TABLA AIRPORTS_DATA
CARDINALIDAD (104)
|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|airports_data|timezone|15| 
|bookings|airports_data|airport_code|4|
|bookings|airports_data|airport_name|61|
|bookings|airports_data|city|49|
|bookings|airports_data|coordinates|16| 

avg_timezone 15.4
avg_airport_code 4
avg_airport_name 61.62
avg_city 49.99
avg_coordinates 16

|column_name|data_type|
|-----------|---------|
|airport_code|character| NO SE TOMA PARA CARD DIST
|airport_name|jsonb| NO SE TOMA PARA CARD DIST
|city|jsonb| NO SE TOMA PARA CARD
|coordinates|point|NO SE PUEDE CARD DIST PORQUE SON COORD 2D
|timezone|text| NO SE TOMA PAR CARD DIST

----------------------------------------------------------------------------


TABLA BOARDING_PASSES
CARDINALIDAD (7 925 812)
|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|boarding_passes|ticket_no|14|
|bookings|boarding_passes|flight_id|4|
|bookings|boarding_passes|boarding_no|4|
|bookings|boarding_passes|seat_no|3|

avg_ticket_no: 14
avg_flight_id: 4
avg_boarding_no: 4
avg_seat_no: 3.65

|column_name|data_type|
|-----------|---------|
|ticket_no|character| NO SE TOMA PARA CARDINALIDAD DISTINTA
|flight_id|integer| SI SE TOMA  
|boarding_no|integer| SI SE TOMA
|seat_no|character varying| NO SE TOMA PARA 

DISTRIBUCION DISTINTA
flight_id:
  Id un de los que mas aparece = 1 676 con 381 (0.0048%)
  Id un de los que menos aparece = 886 con 1 (0.0001%)

boarding_no: 
  Ticket que aparece menos = 381 con 2 (0.0002%)
  Ticket que aparece mas veces = 1 con 139 880 (1.76%)

----------------------------------------------------------------------------


TABLA BOOKINGS
CARDINALIDAD (2 111 110)
|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|bookings|book_ref|7|
|bookings|bookings|book_date|8|
|bookings|bookings|total_amount|6|

avg_book_ref: 7
avg_book_date: 8
avg_total_amount: 6.91

|column_name|data_type|
|-----------|---------|
|book_ref|character| NO SE TOMA PARA CARD DISNT
|book_date|timestamp with time zone| NO SE TOMA PARA CARD DIST
|total_amount|numeric|

DISTRIBUCION DISTINTA 
total_amount:
  El monto mayor es un 1 308 700 que aparece 1 (0.00004%)
  El monto minimo es 3 400 que aparece 427 (0.02%)
  El promedio es 325 997 

book_date:
  Valor maximo en cuanto a fecha y hora es 2017-08-15 11:00:00.000 -0400 que aparece 7 (0.00033%)
  Valor minimo en cuanto a fecha y hora es 2016-07-20 14:16:00.000 -0400 que aparece 1 (0.00005%) 

----------------------------------------------------------------------------

TABLA FLIGHTS
CARDINALIDAD (214 857)
|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|flights|flight_id|4|
|bookings|flights|flight_no|7|
|bookings|flights|scheduled_departure|8|
|bookings|flights|scheduled_arrival|8|
|bookings|flights|departure_airport|4|
|bookings|flights|arrival_airport|4|
|bookings|flights|status|8|
|bookings|flights|aircraft_code|4|
|bookings|flights|actual_departure|8|
|bookings|flights|actual_arrival|8|

avg_flight_id 4
avg_flight_no 7
avg_scheduled_departure 8
avg_scheduled_arrival 8
avg_departure_airport 4
avg_arrival_airport 4
avg_status 8.14
avg_aircraft_code 4
avg_actual_departure 8
avg_actual_arrival 8

|column_name|data_type|
|-----------|---------|
|flight_id|integer| NO SE TOMA PORQUE ES PK
|flight_no|character| NO SE TOMA 
|scheduled_departure|timestamp with time zone|
|scheduled_arrival|timestamp with time zone|
|departure_airport|character| NO SE TOMA
|arrival_airport|character| NO SE TOMA
|status|character varying| NO SE TOMA
|aircraft_code|character| NO SE TOMA 
|actual_departure|timestamp with time zone|
|actual_arrival|timestamp with time zone|

DISTRIBUCION DISTINTA:

scheduled_departure:
  Valor maximo 2017-09-14 13:55:00.000 -0400 que aparece 1 (0.0005%)
  Valor min 2016-08-14 19:45:00.000 -0400 que aparece 1 (0.0005%)

scheduled_arrival:
  Valor maximo 2017-09-14 21:55:00.000 -0400 que aparece 1 (0.0005%)
  Valor mim 2016-08-14 20:35:00.000 -0400 que aparece 1 (0.0005%)

actual_departure:
  Cardinalida distinta eliminando los nulos (198 519)
  Valor max 2017-08-15 10:56:00.000 -0400 que aparece 1 (0.0005%)
  Valor min 2016-08-14 19:46:00.000 -0400 que aparece 1 (0.0005%)

actual_arrival:
  Cardinalidad dist eliminando los nulos (198 461)
  Valor max 2017-08-15 11:00:00.000 -0400 que aparece 1 (0.0005%)
  Valor mim 2016-08-14 20:37:00.000 -0400 que aparece 1 (0.0005%)


----------------------------------------------------------------------------


TABLA SEATS
CARDINALIDAD (1 339)
|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|seats|aircraft_code|4|
|bookings|seats|seat_no|3|
|bookings|seats|fare_conditions|8|

avg_aircraft_code: 4
avg_seat_no: 3.75
avg_fare_conditions: 8.11

|column_name|data_type|
|-----------|---------|
|aircraft_code|character| NO SE TOMA 
|seat_no|character varying| NO SE TOMA
|fare_conditions|character varying| NO SE TOMA

----------------------------------------------------------------------------


TABLA TICKET_FLIGHTS
CARDINALIDAD (8 391 952)
|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|ticket_flights|ticket_no|14|
|bookings|ticket_flights|flight_id|4|
|bookings|ticket_flights|fare_conditions|8|
|bookings|ticket_flights|amount|6|

avg_ticket_no: 14
avg_flight_id: 4
avg_fare_conditions: 8.1
avg_amount: 6.31

|column_name|data_type|
|-----------|---------|
|ticket_no|character| NO SE TOMA
|flight_id|integer|
|fare_conditions|character varying| NO SE TOMA
|amount|numeric|

DISTRIBUCION DISTINTA:
flight_id:
  Id que mas aparece = 1 676 con 381 (0.00454%)
  Id uno de los que menos aparece = 886 con 1 (0.00001%)

amount:
  Valor max 203 300 que aparece 3 232 (0.0385%)
  Valor min 3 000 que aparece 58 859 (0.7%)
  El promedio es 36 2677.45

----------------------------------------------------------------------------


TABLA TICKETS
CARDINALIDAD (2 949 851)
|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|tickets|ticket_no|14|
|bookings|tickets|book_ref|7|
|bookings|tickets|passenger_id|12|
|bookings|tickets|passenger_name|16|
|bookings|tickets|contact_data|55|

avg_ticket_no: 14
avg_book_ref: 7
avg_passenger_id: 12
avg_passenger_name: 16.12
avg_contact_data: 55.48

|column_name|data_type|
|-----------|---------|
|ticket_no|character| NO SE TOMA
|book_ref|character| NO SE TOMA 
|passenger_id|character varying| NO SE TOMA
|passenger_name|text| NO SE TOMA
|contact_data|jsonb| NO SE TOMA

----------------------------------------------------------------------------

FALTA aircrafts_data


## Query para obtener la distribución de valores en una columna de una tabla

SELECT DISTINCT(boarding_no), 
COUNT(*),
(SELECT COUNT(*) FROM bookings.boarding_passes bp ) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM bookings.boarding_passes bp ) * 100 AS percentage
FROM bookings.boarding_passes bp 
GROUP BY boarding_no 

## QUERY PARA OBTENER DISTRIBUCION DE COLUMNA EN UNA TABLA, MIN Y MAX VALOR BASADO EN COUNT

SELECT DISTINCT(boarding_no), 
COUNT(*),
(SELECT COUNT(*) FROM bookings.boarding_passes bp ) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM bookings.boarding_passes bp ) * 100 AS percentage
FROM bookings.boarding_passes bp 
GROUP BY boarding_no 
ORDER BY count ASC
LIMIT 1
