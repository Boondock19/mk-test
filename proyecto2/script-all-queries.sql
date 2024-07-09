SET SCHEMA 'bookings';

SELECT * FROM pg_stats WHERE schemaname = 'bookings' AND tablename = 'aircrafts_data';

SELECT 
  column_name, 
  data_type 
FROM 
  information_schema.columns 
WHERE 
  table_schema = 'bookings' AND 
  table_name = 'aircrafts_data';

SET enable_hashjoin = off;
SET enable_memoize = off;
SET enable_material = off;
SET enable_parallel_append = off;
SET enable_parallel_hash = off;
SET max_parallel_workers_per_gather = 0;


SET SCHEMA 'bookings';

SET enable_hashjoin = off;
SET enable_memoize = off;
SET enable_material = off;
SET enable_parallel_append = off;
SET enable_parallel_hash = off;
SET max_parallel_workers_per_gather = 0;
set statement_timeout to 80000;





-- q1 propuestas indices
-- p1
CREATE INDEX q1_tf_amount_ticket_no ON ticket_flights USING btree (amount, ticket_no);
CREATE INDEX q1_f_scheduled_departure ON flights USING btree (scheduled_departure);

DROP INDEX q1_tf_amount_ticket_no;
DROP INDEX q1_f_scheduled_departure;

ANALYZE   q1_tf_amount_ticket_no;
ANALYZE q1_f_scheduled_departure;

ANALYZE   flights;
ANALYZE   ticket_flights;
ANALYZE   boarding_passes;
ANALYZE   tickets;


EXPLAIN ANALYZE (
SELECT
t.passenger_name,
COUNT(DISTINCT(tf.flight_id)) total_flight_count,
SUM(tf.amount) historical_amount_collected,
MAX(bp.boarding_no) max_boarding_number
FROM ticket_flights tf
JOIN tickets t
ON t.ticket_no = tf.ticket_no
JOIN boarding_passes bp
ON bp.ticket_no = t.ticket_no
JOIN flights f
ON bp.flight_id = f.flight_id
WHERE
tf.amount =
(SELECT MAX(tf.amount) FROM ticket_flights tf)
AND
DATE(f.scheduled_departure) BETWEEN '2017-01-26' AND
'2017-06-26'
GROUP BY
t.passenger_name
HAVING
COUNT(DISTINCT(tf.flight_id)) > 3
ORDER BY
COUNT(DISTINCT(tf.flight_id)) DESC
);



--q3 propuestas
--p1
CREATE INDEX q3_b_total_amount_book_ref ON bookings.bookings USING btree (total_amount,book_ref)

DROP INDEX q3_b_total_amount_book_ref;

ANALYZE q3_b_total_amount_book_ref;

--p2 
CREATE INDEX q3_t_passenger_name_book_ref ON tickets USING btree (passenger_name, book_ref);

DROP INDEX q3_t_passenger_name_book_ref;

ANALYZE q3_t_passenger_name_book_ref;

--p3
CREATE INDEX q3_t_passenger_name ON tickets USING hash (passenger_name);
CREATE INDEX q3_t_book_ref ON tickets USING hash (book_ref);

DROP INDEX q3_t_passenger_name;
DROP INDEX q3_t_book_ref;

ANALYZE q3_t_passenger_name;
ANALYZE q3_t_book_ref;

--p4
CREATE INDEX q3_t_book_ref ON tickets USING hash (book_ref);
CREATE INDEX q3_b_total_amount ON bookings USING btree (total_amount);

DROP INDEX q3_t_book_ref;
DROP INDEX q3_b_total_amount;

ANALYZE q3_t_book_ref ;
ANALYZE q3_b_total_amount;

--p5
CREATE INDEX q3_t_book_ref ON tickets USING hash (book_ref);
CREATE INDEX q3_b_total_amount ON bookings USING hash (total_amount);

DROP INDEX q3_t_book_ref;
DROP INDEX q3_b_total_amount;

ANALYZE q3_t_book_ref ;
ANALYZE q3_b_total_amount;

--p6
CREATE INDEX q3_t_book_ref ON tickets USING hash (book_ref);
CREATE INDEX q3_t_passenger_name ON tickets USING btree (passenger_name);

DROP INDEX q3_t_book_ref;
DROP INDEX q3_t_passenger_name;

ANALYZE q3_t_book_ref ;
ANALYZE q3_t_passenger_name;

ANALYZE tickets;
ANALYZE bookings;

EXPLAIN ANALYZE (
SELECT
  t.passenger_name,
  SUM(b.total_amount) total_amount,
  COUNT(DISTINCT(b.book_ref)) count_bookings
FROM 
  tickets t
JOIN 
  bookings b ON b.book_ref = t.book_ref
GROUP BY t.passenger_name
LIMIT 2000
);


-- q5 propuestas
-- p1
CREATE INDEX q5_t_passenger_id_book_ref ON tickets USING btree (passenger_id, book_ref);

DROP INDEX q5_t_passenger_id_book_ref;

ANALYZE q5_t_passenger_id_book_ref;


-- p2 
CREATE INDEX q5_t_book_ref_passenger_id ON tickets USING btree ( book_ref,passenger_id);

DROP INDEX q5_t_book_ref_passenger_id;

ANALYZE q5_t_book_ref_passenger_id;

-- p3
CREATE INDEX q5_t_book_ref_passenger_id ON tickets USING btree ( book_ref,passenger_id);
CREATE INDEX q5_b_book_date ON bookings USING btree (book_date);

DROP INDEX q5_t_book_ref_passenger_id;
DROP INDEX q5_b_book_date;

ANALYZE q5_t_book_ref_passenger_id;
ANALYZE q5_b_book_date;

-- p4
CREATE INDEX q5_t_book_ref_passenger_id ON tickets USING btree ( book_ref,passenger_id);
CREATE INDEX q5_b_book_date_book_ref ON bookings USING btree (book_date, book_ref);

DROP INDEX q5_t_book_ref_passenger_id;
DROP INDEX q5_b_book_date_book_ref;

ANALYZE q5_t_book_ref_passenger_id;
ANALYZE q5_b_book_date_book_ref;

-- p5
CREATE INDEX q5_t_book_ref_passenger_id ON tickets USING btree ( book_ref,passenger_id);
CREATE INDEX q5_b_book_date_total_amount ON bookings USING btree (book_date, total_amount);

DROP INDEX q5_t_book_ref_passenger_id;
DROP INDEX q5_b_book_date_total_amount;

ANALYZE q5_t_book_ref_passenger_id;
ANALYZE q5_b_book_date_total_amount;

-- p6
CREATE INDEX q5_t_book_ref_passenger_id ON tickets USING btree ( book_ref,passenger_id);
CREATE INDEX q5_b_book_ref_book_date_total_amount ON bookings USING btree (book_ref,book_date,total_amount);

DROP INDEX q5_t_book_ref_passenger_id;
DROP INDEX q5_b_book_ref_book_date_total_amount;

ANALYZE q5_t_book_ref_passenger_id;
ANALYZE q5_b_book_ref_book_date_total_amount;

ANALYZE tickets;
ANALYZE bookings;

EXPLAIN ANALYZE (
SELECT
  DATE(b.book_date),
  SUM(b.total_amount) revenue,
  COUNT(DISTINCT(t.passenger_id)) count_passengers
FROM 
  bookings b
JOIN 
  tickets t ON t.book_ref = b.book_ref
GROUP BY
  DATE(b.book_date)
ORDER BY
  COUNT(DISTINCT(t.passenger_id)) DESC,
  SUM(b.total_amount) DESC
);


-- q4 propuestas

EXPLAIN (ANALYZE) 
SELECT 
  f.aircraft_code,
  s.seat_no,
  SUM(tf.amount) total_amount
FROM seats s 
JOIN flights f ON f.aircraft_code  = s.aircraft_code
JOIN ticket_flights tf ON tf.flight_id = f.flight_id
WHERE 
DATE(f.scheduled_departure) BETWEEN '2017-01-26' AND '2017-02-26'
GROUP BY f.aircraft_code, s.seat_no; 

-- factor de reduccion entre las fechas   q4

SELECT SUM(percentage) AS total_percentage FROM
(SELECT DISTINCT(scheduled_departure),
(SELECT COUNT(*)FROM flights f ) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM flights f) * 100 AS percentage
FROM flights f WHERE scheduled_departure BETWEEN '2017-01-26' AND
'2017-02-26'
GROUP BY scheduled_departure) AS q2

-- p1
CREATE INDEX q4_sd_ac ON flights (scheduled_departure,aircraft_code);
CREATE INDEX q4_ac ON seats (aircraft_code);
DROP INDEX q4_sd_ac;
DROP INDEX q4_ac;
ANALYZE q4_sd_ac;
ANALYZE q4_ac;
ANALYZE flights;
ANALYZE seats;
ANALYZE ticket_flights;

-- p2 
CREATE INDEX q4_tf_fid ON ticket_flights (flight_id);
DROP INDEX q4_tf_fid;
ANALYZE q4_f_ac_hash;
ANALYZE flights;
ANALYZE seats;
ANALYZE ticket_flights;

-- p3 
CREATE INDEX q4_tf_fid ON ticket_flights (flight_id);
CREATE INDEX q4_f_ac ON flights (aircraft_code);
DROP INDEX q4_f_ac;
ANALYZE q4_tf_fid;
ANALYZE q4_f_ac;
ANALYZE flights;
ANALYZE seats;
ANALYZE ticket_flights;


-- p4 
CREATE INDEX q4_tf_fid ON ticket_flights (flight_id);
CREATE INDEX q4_s_ac ON seats (aircraft_code);
DROP INDEX q4_tf_fid;
DROP INDEX q4_s_ac;
ANALYZE q4_tf_fid;
ANALYZE q4_s_ac;
ANALYZE flights;
ANALYZE seats;
ANALYZE ticket_flights;


-- p5 
CREATE INDEX q4_tf_fid ON ticket_flights (flight_id);
CREATE INDEX q4_f_ac_sd ON flights (aircraft_code,scheduled_departure);
DROP INDEX q4_tf_fid;
DROP INDEX q4_f_ac_sd;
ANALYZE q4_tf_fid;
ANALYZE q4_f_ac_sd;
ANALYZE flights;
ANALYZE seats;
ANALYZE ticket_flights;

-- p6
CREATE INDEX q4_tf_fid ON ticket_flights (flight_id);
CREATE INDEX q4_f_fid_ac_sd ON flights (scheduled_departure,flight_id, aircraft_code);

DROP INDEX q4_tf_fid;
DROP INDEX q4_f_fid_ac_sd;

ANALYZE q4_tf_fid;
ANALYZE q4_f_fid_ac_sd;

-- p7

CREATE INDEX q4_f_ac_sd_fid ON flights (aircraft_code, scheduled_departure, flight_id);
CREATE INDEX q4_s_ac_sno ON seats (aircraft_code, seat_no);
CREATE INDEX q4_tf_fid_a ON ticket_flights (flight_id, amount);

DROP INDEX q4_f_ac_sd_fid;
DROP INDEX q4_s_ac_sno;
DROP INDEX q4_tf_fid_a;

ANALYZE q4_f_ac_sd_fid;
ANALYZE q4_s_ac_sno;
ANALYZE q4_tf_fid_a;

-- P8
CREATE INDEX q4_tf_fid ON ticket_flights (flight_id);
CREATE INDEX q4_f_ac ON flights (aircraft_code);
CREATE INDEX q4_s_ac ON seats (aircraft_code);
CREATE INDEX q4_f_sd ON flights (scheduled_departure);

DROP INDEX IF EXISTS q4_tf_fid;
DROP INDEX IF EXISTS q4_f_ac;
DROP INDEX IF EXISTS q4_s_ac;
DROP INDEX IF EXISTS q4_f_sd;

ANALYZE q4_tf_fid;
ANALYZE q4_f_ac;
ANALYZE q4_s_ac;
ANALYZE q4_f_sd;

ANALYZE flights;
ANALYZE seats;
ANALYZE ticket_flights;

EXPLAIN (ANALYZE) 
SELECT 
  f.aircraft_code,
  s.seat_no,
  SUM(tf.amount) total_amount
FROM flights f 
JOIN ticket_flights tf ON tf.flight_id = f.flight_id
JOIN seats s ON f.aircraft_code  = s.aircraft_code
WHERE 
DATE(f.scheduled_departure) BETWEEN '2017-01-26' AND '2017-02-26'
GROUP BY f.aircraft_code, s.seat_no; 


-- q2
-- estudio de aircraft_data
SET SCHEMA 'bookings';
SELECT * FROM aircrafts_data ad ;

SELECT DISTINCT(ad.range), 
COUNT(*),
(SELECT COUNT(*) FROM bookings.aircrafts_data ad) AS cardinality, 
COUNT(*) * 1.0 / (SELECT COUNT(*) FROM bookings.aircrafts_data ad ) * 100 AS percentage
FROM aircrafts_data ad
GROUP BY ad.range;

SELECT TRUNC(AVG(pg_column_size(model)),2) 
  AS avg_attr_size
  FROM bookings.aircrafts_data;
  
EXPLAIN (ANALYZE)
SELECT 
  f.flight_id,
  f.scheduled_departure,
  COUNT(DISTINCT(bp.ticket_no)) count_tickets,
  SUM(tf.amount) amount_collected
FROM flights f 
JOIN boarding_passes bp ON bp.flight_id  = f.flight_id 
JOIN tickets t ON t.ticket_no = bp.ticket_no 
JOIN ticket_flights tf ON tf.ticket_no = t.ticket_no 
JOIN aircrafts_data ad  ON ad.aircraft_code = f.aircraft_code 
WHERE 
  DATE(f.scheduled_departure) IN
  (
    SELECT scheduled_departure_date 
    FROM (  
      SELECT 
        DATE(f2.scheduled_departure) AS scheduled_departure_date,
        COUNT(DISTINCT(f2.flight_id))
      FROM flights f2
      WHERE f2.status IN ('Arrived', 'Scheduled')
        AND f2.scheduled_departure = f2.actual_departure
      GROUP BY DATE(f2.scheduled_departure)
      HAVING COUNT(DISTINCT(f2.flight_id)) >= 30
      ORDER BY COUNT(DISTINCT(f2.flight_id)) DESC
    ) AS arrived_high_count
  )
  AND ad.aircraft_code IN ('773', '763', '733', '319')
GROUP BY f.flight_id 
ORDER BY SUM(tf.amount) DESC, COUNT(DISTINCT(bp.ticket_no)) DESC ;

ANALYZE flights;
ANALYZE boarding_passes;
ANALYZE tickets;
ANALYZE aircrafts_data;
ANALYZE ticket_flights;


-- p1 b+ en flight con flight_id,aircraft_code,scheduled_departure
 CREATE INDEX q2_f_fid_ac_sd ON flights (flight_id,aircraft_code,scheduled_departure);
 ANALYZE q2_f_fid_ac_sd;
 
 
 -- p2  hash en f.shechuled_departure + P1
  CREATE INDEX q2_f_sd_hash ON flights USING HASH (scheduled_departure);
DROP INDEX q2_f_sd_hash;
 ANALYZE q2_f_sd_hash;
 
 -- p3 B+ ticket_flight con amount + P1
 CREATE INDEX q2_tf_amount ON ticket_flights (amount);
 