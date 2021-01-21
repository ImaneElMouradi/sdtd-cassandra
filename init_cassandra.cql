CREATE KEYSPACE keyspace01
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};

use keyspace01;


CREATE TABLE crimes (
   uuid uuid PRIMARY KEY,
   city_key text,
   country text,
   incident_description text,
   incident_latitude double,
   incident_longitude double,
   incident_type text,
   );



CREATE TABLE crimes_prediction (
   uuid uuid PRIMARY KEY,
   city_key text,
   country text,
   incident_latitude double,
   incident_longitude double,
   probability text,
   incident_type_predicted text,
   prediction text,
   );