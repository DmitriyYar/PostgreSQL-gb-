--Задание №8
--Провести оценку эффективности выполнения одного или нескольких сложных запросов и 
--предложить пути решения проблемных мест, провести оптимизацию запросов.

-- Построим план выполнения следующего запроса с помощью команды EXPLAIN:
vk=> EXPLAIN SELECT
vk->   id AS id_video,
vk->   (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = video.owner_id) AS owner,
vk->   (SELECT url FROM photo WHERE id = (SELECT main_photo_id FROM profiles WHERE user_id = video.owner_id)) AS ur
l_photo_owner,
vk->   url AS url_video,
vk->   size
vk-> FROM video
vk-> ORDER BY size DESC
vk-> LIMIT 10;
                                  QUERY PLAN
------------------------------------------------------------------------------
 Limit  (cost=10.16..167.81 rows=10 width=581)
   ->  Result  (cost=10.16..1586.66 rows=100 width=581)
         ->  Sort  (cost=10.16..10.41 rows=100 width=37)
               Sort Key: video.size DESC
               ->  Seq Scan on video  (cost=0.00..8.00 rows=100 width=37)
         SubPlan 1
           ->  Seq Scan on users  (cost=0.00..5.25 rows=1 width=32)
                 Filter: (id = video.owner_id)
         SubPlan 3
           ->  Seq Scan on photo  (cost=4.25..10.50 rows=1 width=25)
                 Filter: (id = $2)
                 InitPlan 2 (returns $2)
                   ->  Seq Scan on profiles  (cost=0.00..4.25 rows=1 width=4)
                         Filter: (user_id = video.owner_id)
(14 rows)

-- Выполним реальный запрос командой EXPLAIN ANALYZE
vk=> EXPLAIN ANALYZE SELECT
vk->   id AS id_video,
vk->   (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = video.owner_id) AS owner,
vk->   (SELECT url FROM photo WHERE id = (SELECT main_photo_id FROM profiles WHERE user_id = video.owner_id)) AS url
_photo_owner,
vk->   url AS url_video,
vk->   size
vk-> FROM video
vk-> ORDER BY size DESC
vk-> LIMIT 10;
                                                       QUERY PLAN

--------------------------------------------------------------------------------------------------------------------
-----
 Limit  (cost=10.16..167.81 rows=10 width=581) (actual time=0.129..0.357 rows=10 loops=1)
   ->  Result  (cost=10.16..1586.66 rows=100 width=581) (actual time=0.128..0.355 rows=10 loops=1)
         ->  Sort  (cost=10.16..10.41 rows=100 width=37) (actual time=0.076..0.077 rows=10 loops=1)
               Sort Key: video.size DESC
               Sort Method: top-N heapsort  Memory: 26kB
               ->  Seq Scan on video  (cost=0.00..8.00 rows=100 width=37) (actual time=0.009..0.039 rows=100 loops=1
)
         SubPlan 1
           ->  Seq Scan on users  (cost=0.00..5.25 rows=1 width=32) (actual time=0.006..0.009 rows=1 loops=10)
                 Filter: (id = video.owner_id)
                 Rows Removed by Filter: 99
         SubPlan 3
           ->  Seq Scan on photo  (cost=4.25..10.50 rows=1 width=25) (actual time=0.013..0.017 rows=1 loops=10)
                 Filter: (id = $2)
                 Rows Removed by Filter: 99
                 InitPlan 2 (returns $2)
                   ->  Seq Scan on profiles  (cost=0.00..4.25 rows=1 width=4) (actual time=0.004..0.008 rows=1 loops
=10)
                         Filter: (user_id = video.owner_id)
                         Rows Removed by Filter: 99
 Planning Time: 0.240 ms
 Execution Time: 0.388 ms
(20 rows)

-- Количество строк в результирующей выборке ограничено LIMIT  10 - это хорошо.
-- Приблизительно полная стоимость подготовки запроса составляет 10.61, а полная стоимость выполнения запроса - 167.81.

-- Seq Scan on users  - последовательное сканирование строк в таблице users при больших объёмах данных это неоптимально.
-- Seq Scan on photo  - последовательное сканирование строк в таблице photo при больших объёмах данных это неоптимально.
-- Seq Scan on profiles  - последовательное сканирование строк в таблице profiles при больших объёмах данных это неоптимально.

-- Реальное время выполнения запроса 0.388 ms

-- Объединим в данном запросе таблицы video, users, photo, profiles 
vk=> EXPLAIN ANALYZE SELECT
vk->   video.id AS id_video,
vk->   CONCAT(first_name, ' ', last_name) AS owner,
vk->   photo.url AS url_photo_owner,
vk->   video.url AS url_video,
vk->   video.size
vk->   FROM video
vk->    JOIN users
vk->     ON video.owner_id = users.id
vk->    JOIN profiles
vk->     ON user_id = video.owner_id
vk->    JOIN photo
vk->     ON profiles.main_photo_id = photo.id
vk->   ORDER BY size DESC
vk-> LIMIT 10;
                                                               QUERY PLAN

-------------------------------------------------------------------------------------------------------------------
---------------------
 Limit  (cost=29.98..30.01 rows=10 width=90) (actual time=0.251..0.253 rows=10 loops=1)
   ->  Sort  (cost=29.98..30.23 rows=100 width=90) (actual time=0.250..0.251 rows=10 loops=1)
         Sort Key: video.size DESC
         Sort Method: top-N heapsort  Memory: 27kB
         ->  Hash Join  (cost=18.75..27.82 rows=100 width=90) (actual time=0.117..0.223 rows=99 loops=1)
               Hash Cond: (profiles.main_photo_id = photo.id)
               ->  Hash Join  (cost=11.50..20.05 rows=100 width=50) (actual time=0.065..0.133 rows=100 loops=1)
                     Hash Cond: (video.owner_id = profiles.user_id)
                     ->  Hash Join  (cost=6.25..14.52 rows=100 width=54) (actual time=0.036..0.082 rows=100 loops=1
)
                           Hash Cond: (video.owner_id = users.id)
                           ->  Seq Scan on video  (cost=0.00..8.00 rows=100 width=37) (actual time=0.001..0.015 row
s=100 loops=1)
                           ->  Hash  (cost=5.00..5.00 rows=100 width=17) (actual time=0.031..0.031 rows=100 loops=1
)
                                 Buckets: 1024  Batches: 1  Memory Usage: 14kB
                                 ->  Seq Scan on users  (cost=0.00..5.00 rows=100 width=17) (actual time=0.002..0.0
17 rows=100 loops=1)
                     ->  Hash  (cost=4.00..4.00 rows=100 width=8) (actual time=0.023..0.024 rows=100 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 12kB
                           ->  Seq Scan on profiles  (cost=0.00..4.00 rows=100 width=8) (actual time=0.002..0.013 r
ows=100 loops=1)
               ->  Hash  (cost=6.00..6.00 rows=100 width=29) (actual time=0.042..0.042 rows=100 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 15kB
                     ->  Seq Scan on photo  (cost=0.00..6.00 rows=100 width=29) (actual time=0.007..0.023 rows=100
loops=1)
 Planning Time: 0.570 ms
 Execution Time: 0.293 ms
(22 rows)


-- Реальное время выполнения запроса уменьшилось 0.293 ms
-- но в таблицах осталось последовательное сканирование Seq Scan

-- Создадим индексы 
CREATE INDEX video_owner_id_fk ON video (owner_id);
CREATE INDEX profiles_main_photo_id_fk ON profiles (main_photo_id);
-- в таблице users ("users_pkey") и photo ("photo_pkey") первичные ключи существуют, создавать дополнительно не будем


vk=> EXPLAIN ANALYZE SELECT
vk->   video.id AS id_video,
vk->   CONCAT(first_name, ' ', last_name) AS owner,
vk->   photo.url AS url_photo_owner,
vk->   video.url AS url_video,
vk->   video.size
vk->   FROM video
vk->    JOIN users
vk->     ON video.owner_id = users.id
vk->    JOIN profiles
vk->     ON user_id = video.owner_id
vk->    JOIN photo
vk->     ON profiles.main_photo_id = photo.id
vk->   ORDER BY size DESC
vk-> LIMIT 10;
                                                               QUERY PLAN

--------------------------------------------------------------------------------------------------------------------------------------
--
 Limit  (cost=29.98..30.01 rows=10 width=90) (actual time=0.249..0.252 rows=10 loops=1)
   ->  Sort  (cost=29.98..30.23 rows=100 width=90) (actual time=0.249..0.250 rows=10 loops=1)
         Sort Key: video.size DESC
         Sort Method: top-N heapsort  Memory: 27kB
         ->  Hash Join  (cost=18.75..27.82 rows=100 width=90) (actual time=0.122..0.225 rows=99 loops=1)
               Hash Cond: (profiles.main_photo_id = photo.id)
               ->  Hash Join  (cost=11.50..20.05 rows=100 width=50) (actual time=0.060..0.125 rows=100 loops=1)
                     Hash Cond: (video.owner_id = profiles.user_id)
                     ->  Hash Join  (cost=6.25..14.52 rows=100 width=54) (actual time=0.032..0.075 rows=100 loops=1)
                           Hash Cond: (video.owner_id = users.id)
                           ->  Seq Scan on video  (cost=0.00..8.00 rows=100 width=37) (actual time=0.001..0.013 rows=100 loops=1)
                           ->  Hash  (cost=5.00..5.00 rows=100 width=17) (actual time=0.027..0.027 rows=100 loops=1)
                                 Buckets: 1024  Batches: 1  Memory Usage: 14kB
                                 ->  Seq Scan on users  (cost=0.00..5.00 rows=100 width=17) (actual time=0.002..0.014 rows=100 loops=1
)
                     ->  Hash  (cost=4.00..4.00 rows=100 width=8) (actual time=0.025..0.025 rows=100 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 12kB
                           ->  Seq Scan on profiles  (cost=0.00..4.00 rows=100 width=8) (actual time=0.004..0.014 rows=100 loops=1)
               ->  Hash  (cost=6.00..6.00 rows=100 width=29) (actual time=0.055..0.055 rows=100 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 15kB
                     ->  Seq Scan on photo  (cost=0.00..6.00 rows=100 width=29) (actual time=0.007..0.039 rows=100 loops=1)
 Planning Time: 0.678 ms
 Execution Time: 0.282 ms
(22 rows)

-- После создания индексов сервер все равно выбирает последовательное сканирорванеи таблц Seq Scan on video, Seq Scan on profiles, Seq Scan on photo 
-- отключим принудительно последовательное сканирование 
SET enable_seqscan TO OFF;

-- Проанализируем запрос
vk=> EXPLAIN ANALYZE SELECT
vk->   video.id AS id_video,
vk->   CONCAT(first_name, ' ', last_name) AS owner,
vk->   photo.url AS url_photo_owner,
vk->   video.url AS url_video,
vk->   video.size
vk->   FROM video
vk->    JOIN users
vk->     ON video.owner_id = users.id
vk->    JOIN profiles
vk->     ON user_id = video.owner_id
vk->    JOIN photo
vk->     ON profiles.main_photo_id = photo.id
vk->   ORDER BY size DESC
vk-> LIMIT 10;
                                                                        QUERY PLAN

--------------------------------------------------------------------------------------------------------------------------------------
---------------------
 Limit  (cost=103.23..103.26 rows=10 width=90) (actual time=0.272..0.274 rows=10 loops=1)
   ->  Sort  (cost=103.23..103.48 rows=100 width=90) (actual time=0.271..0.272 rows=10 loops=1)
         Sort Key: video.size DESC
         Sort Method: top-N heapsort  Memory: 27kB
         ->  Hash Join  (cost=19.32..101.07 rows=100 width=90) (actual time=0.061..0.243 rows=99 loops=1)
               Hash Cond: (profiles.main_photo_id = photo.id)
               ->  Merge Join  (cost=0.43..81.66 rows=100 width=50) (actual time=0.015..0.157 rows=100 loops=1)
                     Merge Cond: (users.id = video.owner_id)
                     ->  Merge Join  (cost=0.29..43.09 rows=100 width=25) (actual time=0.010..0.077 rows=100 loops=1)
                           Merge Cond: (users.id = profiles.user_id)
                           ->  Index Scan using users_pkey on users  (cost=0.14..20.27 rows=100 width=17) (actual time=0.006..0.032 ro
ws=100 loops=1)
                           ->  Index Scan using profiles_pkey on profiles  (cost=0.14..21.32 rows=100 width=8) (actual time=0.002..0.0
18 rows=100 loops=1)
                     ->  Index Scan using video_owner_id_fk on video  (cost=0.14..37.50 rows=100 width=37) (actual time=0.002..0.040 r
ows=100 loops=1)
               ->  Hash  (cost=17.64..17.64 rows=100 width=29) (actual time=0.037..0.037 rows=100 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 15kB
                     ->  Index Scan using photo_pkey on photo  (cost=0.14..17.64 rows=100 width=29) (actual time=0.003..0.023 rows=100
 loops=1)
 Planning Time: 0.501 ms
 Execution Time: 0.323 ms
(18 rows)

-- Убеждаемся, что запрос выполняется по индексам, но время выполнения увеличилось до 0.323 ms.
-- Не смотря на то, что в данном случае опытным путём было установлено небольшое повышение производительности БД при использовании
-- индексного сканирования, при работе с огромными объёмами данных применение индексного сканирования даст значительный
-- прирост производительности.

-- Разрешаем СУБД использовать последовательное сканирование, т.к. иногда оно является более оптимальным и в реальных условиях отключать последовательное сканирование не стоит.
SET enable_seqscan TO ON;