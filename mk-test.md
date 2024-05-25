
## Información del  catalago sobre las tablas y sus attt

 - Usando el query se obtuvo la data de las tablas en sus catalogos
SELECT schemaname,tablename, attname , avg_width FROM pg_stats WHERE schemaname = 'bookings' AND tablename = tablename;

- Usando el query se obtuvo la informacion de cada tabla y sus atributos uno a uno.
SELECT TRUNC(AVG(pg_column_size(airport_name)),2) 
  AS avg_attr_size
  FROM bookings.boarding_passes;

|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|airports_data|timezone|15|
|bookings|airports_data|airport_code|4|
|bookings|airports_data|airport_name|61|
|bookings|airports_data|city|49|
|bookings|airports_data|coordinates|16|

timezone 15.4
airport_code 4
airport_name 61.62
city 49.99
coordinates 16

|column_name|data_type|
|-----------|---------|
|airport_code|character|
|airport_name|jsonb|
|city|jsonb|
|coordinates|point|
|timezone|text|




|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|boarding_passes|ticket_no|14|
|bookings|boarding_passes|flight_id|4|
|bookings|boarding_passes|boarding_no|4|
|bookings|boarding_passes|seat_no|3|

ticket_no 14
flight_id 4
boarding_no 4
seat_no 3.65

|column_name|data_type|
|-----------|---------|
|ticket_no|character|
|flight_id|integer|
|boarding_no|integer|
|seat_no|character varying|



|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|bookings|book_ref|7|
|bookings|bookings|book_date|8|
|bookings|bookings|total_amount|6|

book_ref 7
book_date 8
total_amount 6.91

|column_name|data_type|
|-----------|---------|
|book_ref|character|
|book_date|timestamp with time zone|
|total_amount|numeric|



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

flight_id 4
flight_no 7
scheduled_departure 8
scheduled_arrival 8
departure_airport 4
arrival_airport 4
status 8.14
aircraft_code 4
actual_departure 8
actual_arrival 8

|column_name|data_type|
|-----------|---------|
|flight_id|integer|
|flight_no|character|
|scheduled_departure|timestamp with time zone|
|scheduled_arrival|timestamp with time zone|
|departure_airport|character|
|arrival_airport|character|
|status|character varying|
|aircraft_code|character|
|actual_departure|timestamp with time zone|
|actual_arrival|timestamp with time zone|


|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|seats|aircraft_code|4|
|bookings|seats|seat_no|3|
|bookings|seats|fare_conditions|8|



|column_name|data_type|
|-----------|---------|
|aircraft_code|character|
|seat_no|character varying|
|fare_conditions|character varying|



|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|ticket_flights|ticket_no|14|
|bookings|ticket_flights|flight_id|4|
|bookings|ticket_flights|fare_conditions|8|
|bookings|ticket_flights|amount|6|



|column_name|data_type|
|-----------|---------|
|ticket_no|character|
|flight_id|integer|
|fare_conditions|character varying|
|amount|numeric|



|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|tickets|ticket_no|14|
|bookings|tickets|book_ref|7|
|bookings|tickets|passenger_id|12|
|bookings|tickets|passenger_name|16|
|bookings|tickets|contact_data|55|


|column_name|data_type|
|-----------|---------|
|ticket_no|character|
|book_ref|character|
|passenger_id|character varying|
|passenger_name|text|
|contact_data|jsonb|



FALTA aircrafts_data
