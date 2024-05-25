
## Información del  catalago sobre las tablas y sus attt

 - Usando el query
SELECT schemaname,tablename, attname , avg_width FROM pg_stats WHERE schemaname = 'bookings' AND tablename = tablename;

|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|airports_data|timezone|15|
|bookings|airports_data|airport_code|4|
|bookings|airports_data|airport_name|61|
|bookings|airports_data|city|49|
|bookings|airports_data|coordinates|16|


|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|boarding_passes|ticket_no|14|
|bookings|boarding_passes|flight_id|4|
|bookings|boarding_passes|boarding_no|4|
|bookings|boarding_passes|seat_no|3|


|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|bookings|book_ref|7|
|bookings|bookings|book_date|8|
|bookings|bookings|total_amount|6|


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


|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|seats|aircraft_code|4|
|bookings|seats|seat_no|3|
|bookings|seats|fare_conditions|8|


|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|ticket_flights|ticket_no|14|
|bookings|ticket_flights|flight_id|4|
|bookings|ticket_flights|fare_conditions|8|
|bookings|ticket_flights|amount|6|


|schemaname|tablename|attname|avg_width|
|----------|---------|-------|---------|
|bookings|tickets|ticket_no|14|
|bookings|tickets|book_ref|7|
|bookings|tickets|passenger_id|12|
|bookings|tickets|passenger_name|16|
|bookings|tickets|contact_data|55|


FALTA aircrafts_data
