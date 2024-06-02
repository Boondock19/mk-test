
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
  Valor mas frecuente es 1 676 con 381 apariciones (0.0048%)
  Valor uno de los que menos frecuente es 886 con 1 apariciones (0.0001%) 

boarding_no: 
  Valor mas frecuente es 1 con 139 800 apariciones (1.76%)
  Valor menos frecuente es 381 con 2 apariciones (0.0002%)

seat_no:
  Valor mas frecuente es 3A con 81 034 apariciones (1.0224%)
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
  Valor maximo es 1 308 700 con 1 apariciones (0.00004%)
  Valor minimo es 3 400 que aparece 427 (0.02%)
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
  Valor maximo es 2017-09-14 13:55:00.000 -0400 con 1 apariciones (0.0005%)
  Valor minimo 2016-08-14 19:45:00.000 -0400 con 1 apariciones (0.0005%)
  Promedio es 2017-02-28 16:50:00.000 -0400

scheduled_arrival:
  Valor maximo 2017-09-14 21:55:00.000 -0400 que aparece 1 (0.0005%)
  Valor minimo 2016-08-14 20:35:00.000 -0400 que aparece 1 (0.0005%)
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


4.1
## QUERIES PRIMERA CONSULTA 

EXPLAIN ANALIZE de la consulta original

Sort  (cost=482180.85..483154.00 rows=389260 width=62) (actual time=19889.509..20141.041 rows=3239758 loops=1)
  Sort Key: f.scheduled_departure DESC
  Sort Method: external merge  Disk: 246520kB
  ->  Nested Loop  (cost=1.42..431400.33 rows=389260 width=62) (actual time=10.032..18705.674 rows=3239758 loops=1)
        Join Filter: (t.ticket_no = tf.ticket_no)
        ->  Nested Loop  (cost=0.86..334746.30 rows=136849 width=70) (actual time=9.739..5986.972 rows=1111547 loops=1)
              ->  Nested Loop  (cost=0.43..269308.81 rows=136849 width=33) (actual time=9.311..879.321 rows=1111547 loops=1)
                    ->  Seq Scan on flights f  (cost=0.00..5309.84 rows=3710 width=16) (actual time=7.820..40.054 rows=3960 loops=1)
                          Filter: (aircraft_code = '773'::bpchar)
                          Rows Removed by Filter: 210907
                    ->  Index Scan using boarding_passes_flight_id_seat_no_key on boarding_passes bp  (cost=0.43..69.63 rows=153 width=25) (actual time=0.058..0.186 rows=281 loops=3960)
                          Index Cond: (flight_id = f.flight_id)
              ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=37) (actual time=0.004..0.004 rows=1 loops=1111547)
                    Index Cond: (ticket_no = bp.ticket_no)
        ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..0.67 rows=3 width=20) (actual time=0.006..0.011 rows=3 loops=1111547)
              Index Cond: (ticket_no = bp.ticket_no)
Planning Time: 6.398 ms
JIT:
  Functions: 20
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 0.429 ms, Inlining 0.000 ms, Optimization 0.331 ms, Emission 7.325 ms, Total 8.085 ms
Execution Time: 20267.847 ms

- 1 IDEA mover el where al principio de la consulta para que ocurra un factor
de correccion de x valor y luego ocurran los joins 

EXPLAIN ANALYZE 
SELECT
f.aircraft_code,
f.scheduled_departure,
bp.boarding_no,
bp.seat_no,
t.passenger_name,
t.book_ref,
tf.ticket_no,
tf.amount
FROM (SELECT * FROM bookings.flights f WHERE
f.aircraft_code = '773') AS f
JOIN
boarding_passes bp ON bp.flight_id = f.flight_id
JOIN
tickets t ON t.ticket_no = bp.ticket_no
JOIN
ticket_flights tf ON tf.ticket_no = t.ticket_no
ORDER BY
f.scheduled_departure DESC;

Gather Merge  (cost=192880.50..230733.54 rows=324432 width=62) (actual time=16311.649..17019.712 rows=3239758 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  ->  Sort  (cost=191880.48..192286.02 rows=162216 width=62) (actual time=16261.205..16345.677 rows=1079919 loops=3)
        Sort Key: f.scheduled_departure DESC
        Sort Method: external merge  Disk: 82480kB
        Worker 0:  Sort Method: external merge  Disk: 82104kB
        Worker 1:  Sort Method: external merge  Disk: 82072kB
        ->  Nested Loop  (cost=4232.17..171742.16 rows=162216 width=62) (actual time=48.298..15282.031 rows=1079919 loops=3)
              Join Filter: (t.ticket_no = tf.ticket_no)
              ->  Nested Loop  (cost=4231.61..131469.29 rows=57021 width=70) (actual time=48.257..5768.732 rows=370516 loops=3)
                    ->  Parallel Hash Join  (cost=4231.18..104203.42 rows=57021 width=33) (actual time=48.179..1128.649 rows=370516 loops=3)
                          Hash Cond: (bp.flight_id = f.flight_id)
                          ->  Parallel Seq Scan on boarding_passes bp  (cost=0.00..91303.22 rows=3302422 width=25) (actual time=0.028..477.868 rows=2641937 loops=3)
                          ->  Parallel Hash  (cost=4203.90..4203.90 rows=2182 width=16) (actual time=35.443..35.445 rows=1320 loops=3)
                                Buckets: 4096  Batches: 1  Memory Usage: 256kB
                                ->  Parallel Seq Scan on flights f  (cost=0.00..4203.90 rows=2182 width=16) (actual time=13.160..29.418 rows=1320 loops=3)
                                      Filter: (aircraft_code = '773'::bpchar)
                                      Rows Removed by Filter: 70302
                    ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=37) (actual time=0.012..0.012 rows=1 loops=1111547)
                          Index Cond: (ticket_no = bp.ticket_no)
              ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..0.67 rows=3 width=20) (actual time=0.015..0.024 rows=3 loops=1111547)
                    Index Cond: (ticket_no = bp.ticket_no)
Planning Time: 0.732 ms
JIT:
  Functions: 75
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 2.250 ms, Inlining 0.000 ms, Optimization 1.293 ms, Emission 64.238 ms, Total 67.781 ms
Execution Time: 17122.477 ms


-2 con index en la tabla tickets con el campo ticket_no tipo hash

Gather Merge  (cost=168330.36..206183.41 rows=324432 width=62) (actual time=15410.887..16138.313 rows=3239758 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  ->  Sort  (cost=167330.34..167735.88 rows=162216 width=62) (actual time=15377.109..15466.818 rows=1079919 loops=3)
        Sort Key: f.scheduled_departure DESC
        Sort Method: external merge  Disk: 82176kB
        Worker 0:  Sort Method: external merge  Disk: 82728kB
        Worker 1:  Sort Method: external merge  Disk: 81760kB
        ->  Nested Loop  (cost=4231.74..147192.03 rows=162216 width=62) (actual time=50.551..14333.320 rows=1079919 loops=3)
              Join Filter: (t.ticket_no = tf.ticket_no)
              ->  Nested Loop  (cost=4231.18..106919.15 rows=57021 width=70) (actual time=50.496..3954.522 rows=370516 loops=3)
                    ->  Parallel Hash Join  (cost=4231.18..104203.42 rows=57021 width=33) (actual time=50.466..1114.994 rows=370516 loops=3)
                          Hash Cond: (bp.flight_id = f.flight_id)
                          ->  Parallel Seq Scan on boarding_passes bp  (cost=0.00..91303.22 rows=3302422 width=25) (actual time=0.026..467.883 rows=2641937 loops=3)
                          ->  Parallel Hash  (cost=4203.90..4203.90 rows=2182 width=16) (actual time=45.213..45.214 rows=1320 loops=3)
                                Buckets: 4096  Batches: 1  Memory Usage: 288kB
                                ->  Parallel Seq Scan on flights f  (cost=0.00..4203.90 rows=2182 width=16) (actual time=28.830..42.172 rows=1320 loops=3)
                                      Filter: (aircraft_code = '773'::bpchar)
                                      Rows Removed by Filter: 70302
                    ->  Index Scan using idx_ticket_no on tickets t  (cost=0.00..0.05 rows=1 width=37) (actual time=0.007..0.007 rows=1 loops=1111547)
                          Index Cond: (ticket_no = bp.ticket_no)
                          Rows Removed by Index Recheck: 0
              ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..0.67 rows=3 width=20) (actual time=0.016..0.026 rows=3 loops=1111547)
                    Index Cond: (ticket_no = bp.ticket_no)
Planning Time: 0.784 ms
JIT:
  Functions: 75
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 2.176 ms, Inlining 0.000 ms, Optimization 1.137 ms, Emission 80.770 ms, Total 84.084 ms
Execution Time: 16242.642 ms

mejoro aprox 800 ms


3 -  Hash index on ticket_no de la tabla ticket flights 

Sort  (cost=405334.95..406308.12 rows=389269 width=62) (actual time=14931.946..15196.694 rows=3239758 loops=1)
  Sort Key: f.scheduled_departure DESC
  Sort Method: external merge  Disk: 246520kB
  ->  Nested Loop  (cost=0.86..354553.53 rows=389269 width=62) (actual time=7.581..13573.253 rows=3239758 loops=1)
        Join Filter: (t.ticket_no = tf.ticket_no)
        ->  Nested Loop  (cost=0.86..335145.56 rows=136853 width=70) (actual time=7.552..5016.332 rows=1111547 loops=1)
              ->  Nested Loop  (cost=0.43..269706.30 rows=136853 width=33) (actual time=7.533..345.901 rows=1111547 loops=1)
                    ->  Seq Scan on flights f  (cost=0.00..5309.84 rows=3710 width=16) (actual time=7.333..25.735 rows=3960 loops=1)
                          Filter: (aircraft_code = '773'::bpchar)
                          Rows Removed by Filter: 210907
                    ->  Index Scan using boarding_passes_flight_id_seat_no_key on boarding_passes bp  (cost=0.43..69.70 rows=157 width=25) (actual time=0.007..0.054 rows=281 loops=3960)
                          Index Cond: (flight_id = f.flight_id)
              ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=37) (actual time=0.004..0.004 rows=1 loops=1111547)
                    Index Cond: (ticket_no = bp.ticket_no)
        ->  Index Scan using idx_ticket_no on ticket_flights tf  (cost=0.00..0.10 rows=3 width=20) (actual time=0.004..0.007 rows=3 loops=1111547)
              Index Cond: (ticket_no = bp.ticket_no)
              Rows Removed by Index Recheck: 0
Planning Time: 0.717 ms
JIT:
  Functions: 20
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 0.564 ms, Inlining 0.000 ms, Optimization 0.316 ms, Emission 7.015 ms, Total 7.895 ms
Execution Time: 15314.884 ms

4 - Hash index on aircraft_code de la tabla flights 
Sort  (cost=480114.49..481087.89 rows=389360 width=62) (actual time=14940.321..15196.292 rows=3239758 loops=1)
  Sort Key: f.scheduled_departure DESC
  Sort Method: external merge  Disk: 246520kB
  ->  Nested Loop  (cost=122.18..429320.46 rows=389360 width=62) (actual time=7.464..13780.689 rows=3239758 loops=1)
        Join Filter: (t.ticket_no = tf.ticket_no)
        ->  Nested Loop  (cost=121.62..332666.44 rows=136849 width=70) (actual time=7.431..4855.787 rows=1111547 loops=1)
              ->  Nested Loop  (cost=121.19..267228.95 rows=136849 width=33) (actual time=7.410..315.074 rows=1111547 loops=1)
                    ->  Bitmap Heap Scan on flights f  (cost=120.75..2926.65 rows=3710 width=16) (actual time=7.333..9.968 rows=3960 loops=1)
                          Recheck Cond: (aircraft_code = '773'::bpchar)
                          Heap Blocks: exact=57
                          ->  Bitmap Index Scan on q1_idx_aircraft_code  (cost=0.00..119.83 rows=3710 width=0) (actual time=0.075..0.076 rows=3960 loops=1)
                                Index Cond: (aircraft_code = '773'::bpchar)
                    ->  Index Scan using boarding_passes_flight_id_seat_no_key on boarding_passes bp  (cost=0.43..69.68 rows=156 width=25) (actual time=0.006..0.051 rows=281 loops=3960)
                          Index Cond: (flight_id = f.flight_id)
              ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=37) (actual time=0.004..0.004 rows=1 loops=1111547)
                    Index Cond: (ticket_no = bp.ticket_no)
        ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..0.67 rows=3 width=20) (actual time=0.005..0.008 rows=3 loops=1111547)
              Index Cond: (ticket_no = bp.ticket_no)
Planning Time: 0.760 ms
JIT:
  Functions: 20
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 0.549 ms, Inlining 0.000 ms, Optimization 0.331 ms, Emission 6.927 ms, Total 7.807 ms
Execution Time: 15311.194 ms

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


# QUERIES SEGUNDA CONSULTA

ORIGINAL

Sort  (cost=399331.19..399960.47 rows=251709 width=78) (actual time=1668.814..1705.614 rows=452703 loops=1)
  Sort Key: f.scheduled_departure DESC
  Sort Method: external merge  Disk: 41392kB
  ->  Nested Loop  (cost=7243.68..365565.14 rows=251709 width=78) (actual time=34.543..1545.387 rows=452703 loops=1)
        Join Filter: (t.ticket_no = tf.ticket_no)
        ->  Nested Loop  (cost=7243.12..303065.51 rows=88491 width=86) (actual time=34.521..614.352 rows=142286 loops=1)
              ->  Nested Loop  (cost=7242.69..260751.51 rows=88491 width=49) (actual time=34.500..77.694 rows=142286 loops=1)
                    ->  Merge Join  (cost=7242.26..7278.76 rows=2399 width=32) (actual time=34.465..35.839 rows=2653 loops=1)
                          Merge Cond: (f.arrival_airport = aa.airport_code)
                          ->  Sort  (cost=7234.73..7240.73 rows=2399 width=36) (actual time=34.403..34.757 rows=2653 loops=1)
                                Sort Key: f.arrival_airport
                                Sort Method: quicksort  Memory: 304kB
                                ->  Merge Join  (cost=7063.55..7100.05 rows=2399 width=36) (actual time=33.412..33.834 rows=2653 loops=1)
                                      Merge Cond: (f.departure_airport = da.airport_code)
                                      ->  Sort  (cost=7056.02..7062.02 rows=2399 width=40) (actual time=33.334..33.420 rows=2653 loops=1)
                                            Sort Key: f.departure_airport
                                            Sort Method: quicksort  Memory: 304kB
                                            ->  Seq Scan on flights f  (cost=0.00..6921.34 rows=2399 width=40) (actual time=13.625..32.762 rows=2653 loops=1)
                                                  Filter: ((scheduled_departure >= '2016-08-14 00:00:00-04'::timestamp with time zone) AND (scheduled_departure <= '2016-12-24 00:00:00-04'::timestamp with time zone) AND ((status)::text = 'Arrived'::text) AND (aircraft_code = '319'::bpchar))
                                                  Rows Removed by Filter: 212214
                                      ->  Sort  (cost=7.52..7.78 rows=104 width=4) (actual time=0.062..0.066 rows=104 loops=1)
                                            Sort Key: da.airport_code
                                            Sort Method: quicksort  Memory: 29kB
                                            ->  Seq Scan on airports_data da  (cost=0.00..4.04 rows=104 width=4) (actual time=0.006..0.016 rows=104 loops=1)
                          ->  Sort  (cost=7.52..7.78 rows=104 width=4) (actual time=0.053..0.083 rows=104 loops=1)
                                Sort Key: aa.airport_code
                                Sort Method: quicksort  Memory: 29kB
                                ->  Seq Scan on airports_data aa  (cost=0.00..4.04 rows=104 width=4) (actual time=0.004..0.010 rows=104 loops=1)
                    ->  Index Scan using boarding_passes_flight_id_seat_no_key on boarding_passes bp  (cost=0.43..104.11 rows=155 width=25) (actual time=0.005..0.011 rows=54 loops=2653)
                          Index Cond: (flight_id = f.flight_id)
              ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=37) (actual time=0.004..0.004 rows=1 loops=142286)
                    Index Cond: (ticket_no = bp.ticket_no)
        ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..0.67 rows=3 width=20) (actual time=0.004..0.006 rows=3 loops=142286)
              Index Cond: (ticket_no = bp.ticket_no)
Planning Time: 1.460 ms
JIT:
  Functions: 37
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 0.960 ms, Inlining 0.000 ms, Optimization 0.503 ms, Emission 12.405 ms, Total 13.869 ms
Execution Time: 1735.490 ms


ORIGINAL CON TODO PRENDIDO ES DECIR PARALLES Y HASH JOINS

Gather Merge  (cost=164818.20..189877.38 rows=214778 width=78) (actual time=2805.719..2921.252 rows=452703 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  ->  Sort  (cost=163818.18..164086.65 rows=107389 width=78) (actual time=2773.792..2785.623 rows=150901 loops=3)
        Sort Key: f.scheduled_departure DESC
        Sort Method: external merge  Disk: 13664kB
        Worker 0:  Sort Method: external merge  Disk: 13800kB
        Worker 1:  Sort Method: external merge  Disk: 13952kB
        ->  Nested Loop  (cost=5181.58..150070.49 rows=107389 width=78) (actual time=69.187..2658.821 rows=150901 loops=3)
              Join Filter: (t.ticket_no = tf.ticket_no)
              ->  Nested Loop  (cost=5181.02..123409.81 rows=37748 width=86) (actual time=69.148..1666.123 rows=47429 loops=3)
                    ->  Hash Join  (cost=5180.59..105359.78 rows=37748 width=49) (actual time=69.104..1126.248 rows=47429 loops=3)
                          Hash Cond: (f.arrival_airport = aa.airport_code)
                          ->  Hash Join  (cost=5175.25..105251.31 rows=37748 width=53) (actual time=32.418..1072.360 rows=47429 loops=3)
                                Hash Cond: (f.departure_airport = da.airport_code)
                                ->  Parallel Hash Join  (cost=5169.91..105142.85 rows=37748 width=57) (actual time=29.712..1044.346 rows=47429 loops=3)
                                      Hash Cond: (bp.flight_id = f.flight_id)
                                      ->  Parallel Seq Scan on boarding_passes bp  (cost=0.00..91303.77 rows=3302477 width=25) (actual time=0.019..647.222 rows=2641937 loops=3)
                                      ->  Parallel Hash  (cost=5151.85..5151.85 rows=1445 width=40) (actual time=24.806..24.807 rows=884 loops=3)
                                            Buckets: 4096  Batches: 1  Memory Usage: 288kB
                                            ->  Parallel Seq Scan on flights f  (cost=0.00..5151.85 rows=1445 width=40) (actual time=0.507..24.611 rows=884 loops=3)
                                                  Filter: ((scheduled_departure >= '2016-08-14 00:00:00-04'::timestamp with time zone) AND (scheduled_departure <= '2016-12-24 00:00:00-04'::timestamp with time zone) AND ((status)::text = 'Arrived'::text) AND (aircraft_code = '319'::bpchar))
                                                  Rows Removed by Filter: 70738
                                ->  Hash  (cost=4.04..4.04 rows=104 width=4) (actual time=0.022..0.023 rows=104 loops=3)
                                      Buckets: 1024  Batches: 1  Memory Usage: 12kB
                                      ->  Seq Scan on airports_data da  (cost=0.00..4.04 rows=104 width=4) (actual time=0.006..0.013 rows=104 loops=3)
                          ->  Hash  (cost=4.04..4.04 rows=104 width=4) (actual time=36.640..36.641 rows=104 loops=3)
                                Buckets: 1024  Batches: 1  Memory Usage: 12kB
                                ->  Seq Scan on airports_data aa  (cost=0.00..4.04 rows=104 width=4) (actual time=36.596..36.617 rows=104 loops=3)
                    ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=37) (actual time=0.011..0.011 rows=1 loops=142286)
                          Index Cond: (ticket_no = bp.ticket_no)
              ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..0.67 rows=3 width=20) (actual time=0.013..0.019 rows=3 loops=142286)
                    Index Cond: (ticket_no = bp.ticket_no)
Planning Time: 2.151 ms
JIT:
  Functions: 117
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 3.092 ms, Inlining 0.000 ms, Optimization 9.607 ms, Emission 100.261 ms, Total 112.960 ms
Execution Time: 2950.117 ms


# QUERIES TERCERA CONSULTA 

ORIGINAL 

Sort  (cost=4709310.91..4715915.65 rows=2641896 width=103) (actual time=71400.015..72531.227 rows=7925723 loops=1)
  Sort Key: f.flight_no, bp.boarding_no
  Sort Method: external merge  Disk: 906456kB
  ->  Merge Join  (cost=3318939.85..4138551.19 rows=2641896 width=103) (actual time=46538.078..62842.026 rows=7925723 loops=1)
        Merge Cond: ((tf.ticket_no = bp.ticket_no) AND (tf.flight_id = bp.flight_id))
        Join Filter: (b.book_date < (f.scheduled_departure - '5 days'::interval))
        Rows Removed by Join Filter: 89
        ->  Merge Join  (cost=1213784.46..1931989.94 rows=8391708 width=71) (actual time=17919.160..30012.315 rows=8390312 loops=1)
              Merge Cond: (tf.ticket_no = t.ticket_no)
              ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..571351.23 rows=8391708 width=26) (actual time=0.005..8803.652 rows=8390312 loops=1)
              ->  Sort  (cost=1213783.90..1221157.99 rows=2949636 width=45) (actual time=17733.536..18368.130 rows=8390312 loops=1)
                    Sort Key: t.ticket_no
                    Sort Method: external sort  Disk: 180128kB
                    ->  Merge Join  (cost=557197.71..715339.45 rows=2949636 width=45) (actual time=5422.493..7713.644 rows=2949857 loops=1)
                          Merge Cond: (b.book_ref = t.book_ref)
                          ->  Index Scan using bookings_pkey on bookings b  (cost=0.43..108622.81 rows=2111110 width=15) (actual time=0.038..1276.553 rows=2111110 loops=1)
                          ->  Sort  (cost=557195.80..564569.89 rows=2949636 width=37) (actual time=5422.411..5606.678 rows=2949857 loops=1)
                                Sort Key: t.book_ref
                                Sort Method: external sort  Disk: 147600kB
                                ->  Seq Scan on tickets t  (cost=0.00..78911.36 rows=2949636 width=37) (actual time=0.012..529.416 rows=2949857 loops=1)
        ->  Sort  (cost=2105155.38..2124969.60 rows=7925688 width=68) (actual time=28618.864..29210.916 rows=7925812 loops=1)
              Sort Key: bp.ticket_no, bp.flight_id
              Sort Method: external sort  Disk: 698048kB
              ->  Merge Join  (cost=17.58..546786.64 rows=7925688 width=68) (actual time=0.192..2068.117 rows=7925812 loops=1)
                    Merge Cond: (bp.flight_id = f.flight_id)
                    ->  Index Scan using boarding_passes_flight_id_seat_no_key on boarding_passes bp  (cost=0.43..438936.94 rows=7925688 width=25) (actual time=0.159..1187.450 rows=7925812 loops=1)
                    ->  Index Scan using flights_pkey on flights f  (cost=0.42..8241.76 rows=214867 width=43) (actual time=0.023..26.815 rows=214867 loops=1)
Planning Time: 1.743 ms
JIT:
  Functions: 33
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 0.982 ms, Inlining 3.364 ms, Optimization 111.964 ms, Emission 70.324 ms, Total 186.635 ms
Execution Time: 72913.203 ms


ORIGINAL 2 5 46 PM

Sort  (cost=4709342.71..4715947.45 rows=2641896 width=103) (actual time=92119.884..94401.634 rows=7925723 loops=1)
  Sort Key: f.flight_no, bp.boarding_no
  Sort Method: external merge  Disk: 906456kB
  ->  Merge Join  (cost=3319050.53..4138582.99 rows=2641896 width=103) (actual time=46972.317..76690.234 rows=7925723 loops=1)
        Merge Cond: ((tf.ticket_no = bp.ticket_no) AND (tf.flight_id = bp.flight_id))
        Join Filter: (b.book_date < (f.scheduled_departure - '5 days'::interval))
        Rows Removed by Join Filter: 89
        ->  Merge Join  (cost=1213897.29..1932022.91 rows=8391960 width=71) (actual time=17999.061..40694.567 rows=8390312 loops=1)
              Merge Cond: (tf.ticket_no = t.ticket_no)
              ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..571266.95 rows=8391960 width=26) (actual time=0.012..17103.270 rows=8390312 loops=1)
              ->  Sort  (cost=1213896.73..1221271.58 rows=2949942 width=45) (actual time=17782.138..18876.677 rows=8390312 loops=1)
                    Sort Key: t.ticket_no
                    Sort Method: external sort  Disk: 180128kB
                    ->  Merge Join  (cost=557249.86..715396.19 rows=2949942 width=45) (actual time=5454.868..7745.203 rows=2949857 loops=1)
                          Merge Cond: (b.book_ref = t.book_ref)
                          ->  Index Scan using bookings_pkey on bookings b  (cost=0.43..108622.81 rows=2111110 width=15) (actual time=0.044..1301.021 rows=2111110 loops=1)
                          ->  Sort  (cost=557247.95..564622.81 rows=2949942 width=37) (actual time=5454.777..5642.244 rows=2949857 loops=1)
                                Sort Key: t.book_ref
                                Sort Method: external sort  Disk: 147600kB
                                ->  Seq Scan on tickets t  (cost=0.00..78914.42 rows=2949942 width=37) (actual time=0.279..598.089 rows=2949857 loops=1)
        ->  Sort  (cost=2105153.25..2124967.47 rows=7925688 width=68) (actual time=28973.204..29937.066 rows=7925812 loops=1)
              Sort Key: bp.ticket_no, bp.flight_id
              Sort Method: external sort  Disk: 698048kB
              ->  Merge Join  (cost=0.93..546784.51 rows=7925688 width=68) (actual time=0.172..2249.271 rows=7925812 loops=1)
                    Merge Cond: (bp.flight_id = f.flight_id)
                    ->  Index Scan using boarding_passes_flight_id_seat_no_key on boarding_passes bp  (cost=0.43..438936.57 rows=7925688 width=25) (actual time=0.139..1375.387 rows=7925812 loops=1)
                    ->  Index Scan using flights_pkey on flights f  (cost=0.42..8239.88 rows=214867 width=43) (actual time=0.020..40.475 rows=214867 loops=1)
Planning Time: 2.933 ms
JIT:
  Functions: 33
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 0.858 ms, Inlining 31.957 ms, Optimization 112.995 ms, Emission 72.002 ms, Total 217.812 ms
Execution Time: 95200.747 ms

1. Hash index en book_ref en la tabla tickets
Sort  (cost=4383964.25..4390568.99 rows=2641896 width=103) (actual time=66585.087..67725.064 rows=7925723 loops=1)
  Sort Key: f.flight_no, bp.boarding_no
  Sort Method: external merge  Disk: 906456kB
  ->  Merge Join  (cost=2993651.12..3813204.54 rows=2641896 width=103) (actual time=41431.434..57998.875 rows=7925723 loops=1)
        Merge Cond: ((tf.ticket_no = bp.ticket_no) AND (tf.flight_id = bp.flight_id))
        Join Filter: (b.book_date < (f.scheduled_departure - '5 days'::interval))
        Rows Removed by Join Filter: 89
        ->  Merge Join  (cost=888491.58..1606639.25 rows=8391708 width=71) (actual time=12576.757..24904.731 rows=8390312 loops=1)
              Merge Cond: (tf.ticket_no = t.ticket_no)
              ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..571293.42 rows=8391708 width=26) (actual time=0.005..9040.708 rows=8390312 loops=1)
              ->  Sort  (cost=888491.02..895866.18 rows=2950067 width=45) (actual time=12395.260..13036.208 rows=8390312 loops=1)
                    Sort Key: t.ticket_no
                    Sort Method: external sort  Disk: 180128kB
                    ->  Nested Loop  (cost=0.00..389969.15 rows=2950067 width=45) (actual time=0.162..3712.142 rows=2949857 loops=1)
                          ->  Seq Scan on bookings b  (cost=0.00..34558.10 rows=2111110 width=15) (actual time=0.128..120.546 rows=2111110 loops=1)
                          ->  Index Scan using q3_book_ref_tickets on tickets t  (cost=0.00..0.15 rows=2 width=37) (actual time=0.001..0.001 rows=1 loops=2111110)
                                Index Cond: (book_ref = b.book_ref)
                                Rows Removed by Index Recheck: 0
        ->  Sort  (cost=2105159.54..2124973.76 rows=7925688 width=68) (actual time=28854.621..29451.083 rows=7925812 loops=1)
              Sort Key: bp.ticket_no, bp.flight_id
              Sort Method: external sort  Disk: 698048kB
              ->  Merge Join  (cost=22.91..546790.80 rows=7925688 width=68) (actual time=0.163..2121.651 rows=7925812 loops=1)
                    Merge Cond: (bp.flight_id = f.flight_id)
                    ->  Index Scan using boarding_passes_flight_id_seat_no_key on boarding_passes bp  (cost=0.43..438941.45 rows=7925688 width=25) (actual time=0.133..1290.783 rows=7925812 loops=1)
                    ->  Index Scan using flights_pkey on flights f  (cost=0.42..8245.19 rows=214867 width=43) (actual time=0.020..29.642 rows=214867 loops=1)
Planning Time: 1.625 ms
JIT:
  Functions: 30
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 0.909 ms, Inlining 5.101 ms, Optimization 108.031 ms, Emission 68.378 ms, Total 182.419 ms
Execution Time: 68090.416 ms


# QUERIES CUARTA CONSULTA

GroupAggregate  (cost=3201365.20..3881239.40 rows=237732 width=60) (actual time=33352.179..36906.082 rows=218156 loops=1)
  Group Key: tf.flight_id, tf.fare_conditions
  ->  Incremental Sort  (cost=3201365.20..3781480.29 rows=7742997 width=39) (actual time=33352.162..36087.046 rows=7920956 loops=1)
        Sort Key: tf.flight_id, tf.fare_conditions
        Presorted Key: tf.flight_id
        Full-sort Groups: 100380  Sort Method: quicksort  Average Memory: 30kB  Peak Memory: 30kB
        Pre-sorted Groups: 49901  Sort Method: quicksort  Average Memory: 32kB  Peak Memory: 32kB
        ->  Merge Join  (cost=3201362.83..3330021.08 rows=7742997 width=39) (actual time=33352.091..34688.045 rows=7920956 loops=1)
              Merge Cond: (f.flight_id = tf.flight_id)
              ->  Index Scan using flights_pkey on flights f  (cost=0.42..8781.66 rows=198251 width=4) (actual time=166.123..202.896 rows=198430 loops=1)
                    Filter: ((status)::text = 'Arrived'::text)
                    Rows Removed by Filter: 16437
              ->  Sort  (cost=3201358.22..3222338.12 rows=8391960 width=39) (actual time=33185.902..33725.791 rows=8391852 loops=1)
                    Sort Key: tf.flight_id
                    Sort Method: external sort  Disk: 438672kB
                    ->  Merge Join  (cost=1059468.92..1777317.63 rows=8391960 width=39) (actual time=17168.339..29500.853 rows=8391852 loops=1)
                          Merge Cond: (tf.ticket_no = t.ticket_no)
                          ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..570990.18 rows=8391960 width=32) (actual time=0.025..9214.806 rows=8391852 loops=1)
                          ->  Sort  (cost=1059468.36..1066844.57 rows=2950486 width=21) (actual time=17168.267..17678.360 rows=8391851 loops=1)
                                Sort Key: t.ticket_no
                                Sort Method: external sort  Disk: 101072kB
                                ->  Merge Join  (cost=517011.68..621378.44 rows=2950486 width=21) (actual time=5125.180..6389.920 rows=2949857 loops=1)
                                      Merge Cond: (b.book_ref = t.book_ref)
                                      ->  Index Only Scan using bookings_pkey on bookings b  (cost=0.43..54835.08 rows=2111110 width=7) (actual time=0.013..177.788 rows=2111110 loops=1)
                                            Heap Fetches: 0
                                      ->  Sort  (cost=517009.77..524385.99 rows=2950486 width=21) (actual time=5125.124..5362.709 rows=2949857 loops=1)
                                            Sort Key: t.book_ref
                                            Sort Method: external sort  Disk: 101072kB
                                            ->  Seq Scan on tickets t  (cost=0.00..78919.86 rows=2950486 width=21) (actual time=0.033..245.278 rows=2949857 loops=1)
Planning Time: 0.740 ms
JIT:
  Functions: 27
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 0.565 ms, Inlining 36.307 ms, Optimization 78.943 ms, Emission 50.949 ms, Total 166.764 ms
Execution Time: 36980.283 ms


# VALOR DEL CUARTO QUERY CON DELAYED 

GroupAggregate  (cost=1527040.80..1569229.07 rows=1406 width=60) (actual time=3487.123..4344.690 rows=41 loops=1)
  Group Key: tf.flight_id, tf.fare_conditions
  ->  Incremental Sort  (cost=1527040.80..1569193.92 rows=1406 width=39) (actual time=3487.104..4344.431 rows=1428 loops=1)
        Sort Key: tf.flight_id, tf.fare_conditions
        Presorted Key: tf.flight_id
        Full-sort Groups: 18  Sort Method: quicksort  Average Memory: 30kB  Peak Memory: 30kB
        Pre-sorted Groups: 14  Sort Method: quicksort  Average Memory: 31kB  Peak Memory: 31kB
        ->  Nested Loop  (cost=1525837.00..1569111.95 rows=1406 width=39) (actual time=3479.487..4343.948 rows=1428 loops=1)
              ->  Nested Loop  (cost=1525836.57..1568471.72 rows=1406 width=39) (actual time=3479.458..4337.053 rows=1428 loops=1)
                    ->  Merge Join  (cost=1525836.14..1567801.80 rows=1406 width=32) (actual time=3479.348..4329.975 rows=1428 loops=1)
                          Merge Cond: (tf.flight_id = f.flight_id)
                          ->  Sort  (cost=1520521.18..1541501.08 rows=8391960 width=32) (actual time=3436.769..4018.221 rows=8310873 loops=1)
                                Sort Key: tf.flight_id
                                Sort Method: external merge  Disk: 348360kB
                                ->  Seq Scan on ticket_flights tf  (cost=0.00..153852.60 rows=8391960 width=32) (actual time=111.598..699.965 rows=8391852 loops=1)
                          ->  Sort  (cost=5310.77..5310.86 rows=36 width=4) (actual time=12.001..12.019 rows=41 loops=1)
                                Sort Key: f.flight_id
                                Sort Method: quicksort  Memory: 26kB
                                ->  Seq Scan on flights f  (cost=0.00..5309.84 rows=36 width=4) (actual time=0.046..11.981 rows=41 loops=1)
                                      Filter: ((status)::text = 'Delayed'::text)
                                      Rows Removed by Filter: 214826
                    ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=21) (actual time=0.005..0.005 rows=1 loops=1428)
                          Index Cond: (ticket_no = tf.ticket_no)
              ->  Index Only Scan using bookings_pkey on bookings b  (cost=0.43..0.46 rows=1 width=7) (actual time=0.005..0.005 rows=1 loops=1428)
                    Index Cond: (book_ref = t.book_ref)
                    Heap Fetches: 0
Planning Time: 0.491 ms
JIT:
  Functions: 25
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 0.877 ms, Inlining 6.824 ms, Optimization 62.499 ms, Emission 42.321 ms, Total 112.521 ms
Execution Time: 4381.750 ms


# QUERIES QUINTA CONSULTA


Sort  (cost=1353370.07..1353499.34 rows=51705 width=82) (actual time=15752.500..15772.986 rows=123734 loops=1)
  Sort Key: t.passenger_name
  Sort Method: external merge  Disk: 11896kB
  ->  Merge Join  (cost=1339627.23..1346847.58 rows=51705 width=82) (actual time=15366.422..15605.322 rows=123734 loops=1)
        Merge Cond: (tf.flight_id = f.flight_id)
        ->  Sort  (cost=1333773.77..1337105.24 rows=1332589 width=63) (actual time=15309.509..15474.577 rows=1614580 loops=1)
              Sort Key: tf.flight_id
              Sort Method: external merge  Disk: 125392kB
              ->  Nested Loop  (cost=650595.83..1098005.82 rows=1332589 width=63) (actual time=5119.639..14453.588 rows=1633873 loops=1)
                    ->  Merge Join  (cost=650595.27..672550.62 rows=531001 width=51) (actual time=5119.085..6767.700 rows=608229 loops=1)
                          Merge Cond: (t.book_ref = b.book_ref)
                          ->  Sort  (cost=557185.06..564559.08 rows=2949606 width=37) (actual time=4641.108..5726.374 rows=2949857 loops=1)
                                Sort Key: t.book_ref
                                Sort Method: external merge  Disk: 136064kB
                                ->  Seq Scan on tickets t  (cost=0.00..78911.06 rows=2949606 width=37) (actual time=168.144..759.019 rows=2949857 loops=1)
                          ->  Sort  (cost=93408.74..94358.86 rows=380051 width=21) (actual time=477.901..652.160 rows=383899 loops=1)
                                Sort Key: b.book_ref
                                Sort Method: external merge  Disk: 12064kB
                                ->  Seq Scan on bookings b  (cost=0.00..50391.43 rows=380051 width=21) (actual time=2.837..106.738 rows=383899 loops=1)
                                      Filter: ((book_date >= '2016-08-14 00:00:00-04'::timestamp with time zone) AND (book_date <= '2016-12-18 00:00:00-04'::timestamp with time zone) AND (total_amount > '50000'::numeric))
                                      Rows Removed by Filter: 1727211
                    ->  Index Scan using ticket_flights_pkey on ticket_flights tf  (cost=0.56..0.77 rows=3 width=26) (actual time=0.008..0.012 rows=3 loops=608229)
                          Index Cond: (ticket_no = t.ticket_no)
                          Filter: ((fare_conditions)::text = 'Economy'::text)
                          Rows Removed by Filter: 0
        ->  Sort  (cost=5852.80..5873.64 rows=8337 width=27) (actual time=39.767..40.054 rows=8263 loops=1)
              Sort Key: f.flight_id
              Sort Method: quicksort  Memory: 1030kB
              ->  Seq Scan on flights f  (cost=0.00..5309.84 rows=8337 width=27) (actual time=0.027..38.668 rows=8263 loops=1)
                    Filter: (aircraft_code = '733'::bpchar)
                    Rows Removed by Filter: 206604
Planning Time: 1.392 ms
JIT:
  Functions: 31
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 1.060 ms, Inlining 6.735 ms, Optimization 97.337 ms, Emission 64.167 ms, Total 169.298 ms
Execution Time: 15806.982 ms

# QUERY PARA SACAR EL PORCENTAJE DE TOTAL_AMOUNT MAYORES A 50000 EN BOOKINGS

SELECT SUM(percentage) AS total_percentage FROM
(SELECT DISTINCT(total_amount),
(SELECT COUNT(*)FROM bookings b ) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM bookings b) * 100 AS percentage
FROM bookings b WHERE b.total_amount  > 50000
GROUP BY total_amount) AS q2;

# QUERY PARA SACAR EL PORCENTAJE DE LAS FECHAS ENTRE '2016-08-14' AND '2016-12-18'

SELECT SUM(percentage) AS total_percentage FROM
(SELECT DISTINCT(book_date),
(SELECT COUNT(*)FROM bookings b ) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM bookings b) * 100 AS percentage
FROM bookings b WHERE book_date BETWEEN '2016-08-14' AND '2016-12-18'
GROUP BY book_date) AS q2

- 1 prueba con index de hash en tf de ticket_no 

Sort  (cost=1076640.80..1076778.14 rows=54935 width=82) (actual time=13870.858..13891.221 rows=123734 loops=1)
  Sort Key: t.passenger_name
  Sort Method: external merge  Disk: 11896kB
  ->  Merge Join  (cost=1062191.36..1069683.92 rows=54935 width=82) (actual time=13487.542..13724.641 rows=123734 loops=1)
        Merge Cond: (tf.flight_id = f.flight_id)
        ->  Sort  (cost=1056322.30..1059772.87 rows=1380229 width=63) (actual time=13454.980..13617.747 rows=1614580 loops=1)
              Sort Key: tf.flight_id
              Sort Method: external merge  Disk: 125392kB
              ->  Nested Loop  (cost=652322.08..811774.26 rows=1380229 width=63) (actual time=4838.327..12584.962 rows=1633873 loops=1)
                    ->  Merge Join  (cost=652322.08..674544.50 rows=550618 width=51) (actual time=4838.288..6512.069 rows=608229 loops=1)
                          Merge Cond: (t.book_ref = b.book_ref)
                          ->  Sort  (cost=557219.13..564593.55 rows=2949767 width=37) (actual time=4350.170..5451.221 rows=2949857 loops=1)
                                Sort Key: t.book_ref
                                Sort Method: external merge  Disk: 136064kB
                                ->  Seq Scan on tickets t  (cost=0.00..78912.67 rows=2949767 width=37) (actual time=168.981..437.674 rows=2949857 loops=1)
                          ->  Sort  (cost=95101.47..96086.65 rows=394070 width=21) (actual time=488.039..667.143 rows=383899 loops=1)
                                Sort Key: b.book_ref
                                Sort Method: external merge  Disk: 12064kB
                                ->  Seq Scan on bookings b  (cost=0.00..50391.43 rows=394070 width=21) (actual time=2.803..105.868 rows=383899 loops=1)
                                      Filter: ((book_date >= '2016-08-14 00:00:00-04'::timestamp with time zone) AND (book_date <= '2016-12-18 00:00:00-04'::timestamp with time zone) AND (total_amount > '50000'::numeric))
                                      Rows Removed by Filter: 1727211
                    ->  Index Scan using q5_tf_ticket_no on ticket_flights tf  (cost=0.00..0.22 rows=3 width=26) (actual time=0.005..0.010 rows=3 loops=608229)
                          Index Cond: (ticket_no = t.ticket_no)
                          Rows Removed by Index Recheck: 0
                          Filter: ((fare_conditions)::text = 'Economy'::text)
                          Rows Removed by Filter: 0
        ->  Sort  (cost=5868.37..5889.75 rows=8552 width=27) (actual time=15.666..15.957 rows=8263 loops=1)
              Sort Key: f.flight_id
              Sort Method: quicksort  Memory: 1030kB
              ->  Seq Scan on flights f  (cost=0.00..5309.84 rows=8552 width=27) (actual time=0.026..14.603 rows=8263 loops=1)
                    Filter: (aircraft_code = '733'::bpchar)
                    Rows Removed by Filter: 206604
Planning Time: 0.617 ms
JIT:
  Functions: 31
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 1.105 ms, Inlining 6.020 ms, Optimization 97.999 ms, Emission 65.052 ms, Total 170.176 ms
Execution Time: 13925.683 ms


- 2 prueba con index b tree tf de flight_id y ticket_no

Sort  (cost=613686.20..613813.24 rows=50816 width=82) (actual time=6414.443..6435.747 rows=123734 loops=1)
  Sort Key: t.passenger_name
  Sort Method: external merge  Disk: 11896kB
  ->  Nested Loop  (cost=1.42..607281.67 rows=50816 width=82) (actual time=144.848..6251.637 rows=123734 loops=1)
        ->  Nested Loop  (cost=0.99..472338.00 rows=280498 width=68) (actual time=102.891..3274.030 rows=624673 loops=1)
              ->  Nested Loop  (cost=0.56..337592.98 rows=280498 width=45) (actual time=102.561..781.786 rows=624673 loops=1)
                    ->  Seq Scan on flights f  (cost=0.00..5309.84 rows=8151 width=27) (actual time=102.496..118.309 rows=8263 loops=1)
                          Filter: (aircraft_code = '733'::bpchar)
                          Rows Removed by Filter: 206604
                    ->  Index Scan using q5_tf_flight_id_ticket_no_b_tree on ticket_flights tf  (cost=0.56..39.87 rows=90 width=26) (actual time=0.003..0.074 rows=76 loops=8263)
                          Index Cond: (flight_id = f.flight_id)
                          Filter: ((fare_conditions)::text = 'Economy'::text)
                          Rows Removed by Filter: 8
              ->  Index Scan using tickets_pkey on tickets t  (cost=0.43..0.48 rows=1 width=37) (actual time=0.004..0.004 rows=1 loops=624673)
                    Index Cond: (ticket_no = tf.ticket_no)
        ->  Index Scan using bookings_pkey on bookings b  (cost=0.43..0.48 rows=1 width=21) (actual time=0.005..0.005 rows=0 loops=624673)
              Index Cond: (book_ref = t.book_ref)
              Filter: ((book_date >= '2016-08-14 00:00:00-04'::timestamp with time zone) AND (book_date <= '2016-12-18 00:00:00-04'::timestamp with time zone) AND (total_amount > '50000'::numeric))
              Rows Removed by Filter: 1
Planning Time: 0.686 ms
JIT:
  Functions: 22
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 0.879 ms, Inlining 6.480 ms, Optimization 57.074 ms, Emission 38.950 ms, Total 103.382 ms
Execution Time: 6441.510 ms


