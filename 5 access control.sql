-- Урок 5

-- задание 1
postgres=# CREATE ROLE analysts;
postgres=# CREATE ROLE testers;
postgres=# CREATE ROLE Федор_Серов LOGIN;
postgres=# CREATE ROLE Роман_Белов LOGIN;
postgres=# ALTER ROLE Федор_Серов WITH PASSWORD '1234';
postgres=# ALTER ROLE Роман_Белов WITH PASSWORD '1235';
postgres=# GRANT analysts TO Федор_Серов;
postgres=# GRANT testers TO Роман_Белов;
postgres=# \c vk
vk=# GRANT SELECT ON ALL TABLES IN SCHEMA public TO analysts;
vk=# GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO analysts;
vk=# GRANT ALL ON ALL TABLES IN SCHEMA public TO testers;
vk=# GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO testers;

psql -U Федор_Серов -d vk -h 127.0.0.1 -W
vk=> SELECT * FROM users WHERE id = 4;
vk=> UPDATE users SET last_name = 'Ivanov' WHERE id = 4;
ERROR:  permission denied for table users

psql -U Роман_Белов -d vk -h 127.0.0.1 -W
vk=> SELECT * FROM users WHERE id = 4;
vk=> UPDATE users SET last_name = 'Ivanov' WHERE id = 4;
UPDATE 1


-- задание 2 (Расширение citext адаптирует данные для регистронезависимой проверки)
postgres=# CREATE EXTENSION "citext";
CREATE EXTENSION
postgres=# SELECT * FROM pg_extension WHERE extname = 'citext';
  oid  | extname | extowner | extnamespace | extrelocatable | extversion | extconfig | extcondition 
-------+---------+----------+--------------+----------------+------------+-----------+--------------
 81920 | citext  |       10 |         2200 | t              | 1.6        |           | 
(1 row)

postgres=# 


-- задание 3
CREATE TABLE profiles (
  user_id integer NULL,
  main_photo_id integer NULL,
  created_at varchar(255),
  user_contacts contacts,
  PRIMARY KEY (user_id)
);

ALTER TABLE profiles
	ADD CONSTRAINT profiles_user_id_fk
	FOREIGN KEY (user_id)
	REFERENCES users (id);

ALTER TABLE profiles
	ADD CONSTRAINT profiles_main_photo_id_fk
	FOREIGN KEY (main_photo_id)
	REFERENCES photo (id);

INSERT INTO profiles (user_id, main_photo_id, created_at, user_contacts)
  SELECT id, main_photo_id, created_at, user_contacts FROM users;
  
ALTER TABLE users
  DROP COLUMN main_photo_id,
  DROP COLUMN created_at,
  DROP COLUMN user_contacts;