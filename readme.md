
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

DISTRIBUCION DISTINTA:
timezone:
  Valor mas frecuente es Europe/Moscow con 44 apariciones (42.3077%)
  Valor menos frecuente es Asia/Anadyr con 1 apariciones (0.9615%)

airport_name:
  Distribución uniforme 1 aparición (0.9615%) por cada valor

city:
  Distribución uniforme 1 aparición (0.9615%) por cada valor

coordinates:
  Distribución uniforme 1 aparición (0.9615%) por cada valor

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
|ticket_no|character| PKEY
|flight_id|integer| PKEY 
|boarding_no|integer| 
|seat_no|character varying| 

DISTRIBUCION DISTINTA
ticket_no:
  Distribución uniforme 1 aparición (0.00001%) por cada valor

flight_id:
  Valor mas frecuente es 1 676 con 381 apariciones (0.00481%)
  Valor uno de los que menos frecuente es 886 con 1 apariciones (0.0001%) 

boarding_no: 
  Valor mas frecuente es 1 con 139 800 apariciones (1.76386%)
  Valor menos frecuente es 381 con 2 apariciones (0.00003%)

seat_no:
  Valor mas frecuente es 3A con 81 034 apariciones (1.02241%)
  Valor menos frecuente es 49C con 2 678 apariciones (0.03379%)

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
|book_ref|character| PKEY
|book_date|timestamp with time zone| NO SE TOMA PARA CARD DIST
|total_amount|numeric|

DISTRIBUCION DISTINTA 

total_amount:
  Valor maximo es 1 308 700 con 1 apariciones (0.00005%)
  Valor minimo es 3 400 que aparece 427 (0.02023%)
  Promedio es 325 997 

book_date:
  Valor maximo es 2017-08-15 11:00:00.000 -0400 con 7 apariciones (0.00033%)
  Valor minimo es 2016-07-20 14:16:00.000 -0400 con 1 apariciones (0.00005%) 
  Promedio es 2017-02-05 12:28:00.000 -0400

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
|flight_id|integer| PK
|flight_no|character| UNIQUE
|scheduled_departure|timestamp with time zone|
|scheduled_arrival|timestamp with time zone|
|departure_airport|character| NO SE TOMA
|arrival_airport|character| NO SE TOMA
|status|character varying| NO SE TOMA
|aircraft_code|character| NO SE TOMA 
|actual_departure|timestamp with time zone|
|actual_arrival|timestamp with time zone|

DISTRIBUCION DISTINTA:
flight_no:
  Valor uno de los mas frecuente es PG0007 con 396 apariciones (0.18430%)
  Valor uno de los menos frecuente es PG0001 con 56 apariciones (0.02606%)

departure_airport:
  Valor mas frecuente es DME con 20 875 apariciones (9.71531%)
  Valor uno de los menos frecuente es KXK con 113 apariciones (0.05259%)

arrival_airport:
  Valor mas frecuente es DME con 20 878 apariciones (9.71671%)
  Valor uno de los menos frecuente es KXK con 113 apariciones (0.05259%)

status:
  Valor mas frecuente es Arrived con 198 430 apariciones (92.35015%)
  Valor menos frecuente es Delayed con 41 apariciones (0.01908%)

aircraft_code:
  Valor mas frecuente es CN1 con 60 196 apariciones (28.01547%)
  Valor menos frecuente es 773 con 3 960 apariciones (1.8430%)

scheduled_departure:
  Valor maximo es 2017-09-14 13:55:00.000 -0400 con 1 apariciones (0.00047%)
  Valor minimo 2016-08-14 19:45:00.000 -0400 con 1 apariciones (0.00047%)
  Promedio es 2017-02-28 16:50:00.000 -0400

scheduled_arrival:
  Valor maximo 2017-09-14 21:55:00.000 -0400 que aparece 1 (0.00047%)
  Valor minimo 2016-08-14 20:35:00.000 -0400 que aparece 1 (0.00047%)
  Promedio es 2017-02-28 21:15:00.000 -0400

actual_departure:
  Cardinalidad distinta eliminando los nulos (198 519)
  Valor max 2017-08-15 10:56:00.000 -0400 que aparece 1 (0.0005%)
  Valor min 2016-08-14 19:46:00.000 -0400 que aparece 1 (0.0005%)
  Promedio es 2017-02-13 15:21:00.000 -0400

actual_arrival:
  Cardinalidad dist eliminando los nulos (198 461)
  Valor max 2017-08-15 11:00:00.000 -0400 que aparece 1 (0.0005%)
  Valor mim 2016-08-14 20:37:00.000 -0400 que aparece 1 (0.0005%)
  Promedio es 2017-02-13 15:48:30.000 -0400


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
|aircraft_code|character| pkey
|seat_no|character varying| pkey
|fare_conditions|character varying|

DISTRIBUCION DISTINTA:
aircraft_code:
  Valor mas frecuente es 773 con 402 apariciones (30.02240%)
  Valor menos frecuente es CN1 con 12 apariciones (0.89619%)

seat_no:
  Valor uno de los mas frecuente es 1A con 9 apariciones (0.67214%)
  Valor uno de los menos frecuente es 11K con 1 apariciones (0.07468%)

fare_conditions:
  Valor mas frecuente es Economy con 1 139 apariciones (85.06348%)
  Valor menos frecuente es Comfort con 48 apariciones (3.58476%)

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
|ticket_no|character| pkey
|flight_id|integer| pkey
|fare_conditions|character varying| 
|amount|numeric|

DISTRIBUCION DISTINTA:
ticket_no:
  Valor uno de los mas frecuente es 0005432369015 con 6 apariciones (0.00007%)
  Valor uno de los menos frecuente es 0005432000284 con 1 apariciones (0.00001%)

flight_id:
  Valor mas frecuente es 1 676 con 381 apariciones (0.00454%)
  Valor menos frecuente es 886 con 1 apariciones (0.00001%)

fare_conditions:
  Valor mas frecuente es Economy con 7 392 231 apariciones (88.08819%)
  Valor menos frecuente es Comfort con 139 965 apariciones (1.66787%)

amount:
  Valor max 203 300 que aparece 3 232 (0.0385%)
  Valor min 3 000 que aparece 58 859 (0.70137%)
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
|ticket_no|character| PKEY
|book_ref|character| 
|passenger_id|character varying| 
|passenger_name|text| 
|contact_data|jsonb| 

DISTRIBUCION DISTINTA:
book_ref:
  Valor uno de los mas frecuente es 027B0C con 5 apariciones (0.00017%)
  Valor uno de los menos frecuente es 000004 con 1  apariciones (0.00003%)

passenger_id:
  Distribución uniforme con 1 apricion (0.00003%)

passenger_name:
  Valor mas frecuente es ALEKSANDR IVANOV con 6 755 apariciones (0.22899%)
  Valor uno de los menos frecuente es ADELINA ABRAMOVA con 1 apariciones (0.00003%)

contact_data:
  Distribución uniforme con 1 apricion (0.00003%)

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


### MOUSEKERRAMIENTA
from datetime import datetime, timedelta

# Convertir las fechas a objetos datetime
fecha1 = datetime.strptime('2017-08-15 11:00:00.000 -0400', '%Y-%m-%d %H:%M:%S.%f %z')
fecha2 = datetime.strptime('2016-08-14 20:37:00.000 -0400', '%Y-%m-%d %H:%M:%S.%f %z')

# Calcular la diferencia y el punto medio
diferencia = fecha1 - fecha2
punto_medio = fecha2 + (diferencia / 2)

# El resultado es el punto medio en formato de fecha
print(punto_medio)

# QUERY PARA SACAR EL PORCENTAJE DE TOTAL_AMOUNT MAYORES A 50000 EN BOOKINGS

SELECT SUM(percentage) AS total_percentage FROM
(SELECT DISTINCT(total_amount),
(SELECT COUNT(*)FROM bookings b ) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM bookings b) * 100 AS percentage
FROM bookings b WHERE b.total_amount  > 50000
GROUP BY total_amount) AS q2;

# QUERY PARA SACAR EL FACTOR REDUCTOR ENTRE DE LAS FECHAS 

SELECT SUM(percentage) AS total_percentage FROM
(SELECT DISTINCT(book_date),
(SELECT COUNT(*)FROM bookings b ) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM bookings b) * 100 AS percentage
FROM bookings b WHERE book_date BETWEEN '2017-01-26' AND
'2017-06-26'
GROUP BY book_date) AS q2


