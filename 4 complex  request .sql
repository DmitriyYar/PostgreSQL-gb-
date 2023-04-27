
-- Результат выполнения запрососв-------------------------------------------------------------------------
"id_video"	"owner"	            "url_photo_owner"	               "url_video"	                    "size"
     51	    "Noelani Parsons"	"https://walmart.com/sub"	       "http://baidu.com/one"	        100
     35	    "Harper Dotson"	    "https://nytimes.com/sub"	       "http://yahoo.com/site"	        99
     96	    "Damon Mitchell"	"https://reddit.com/site"	       "https://netflix.com/group/9"	97
     44	    "Hadassah Sweeney"	"https://reddit.com/en-ca"	       "http://zoom.us/group/9"	        96
     47	    "Harper Dotson"	    "https://nytimes.com/sub"	       "https://youtube.com/one"	    96
     23	    "Frances Williams"	"http://netflix.com/sub/cars"	   "https://facebook.com/user/110"	95
     45	    "Anjolie Waller"	"http://ebay.com/sub"	           "http://cnn.com/group/9"	        95
     29	    "Kristen Randolph"	"https://nytimes.com/sub"	       "https://reddit.com/en-ca"	    94
     87	    "Logan Olsen"	    "http://google.com/en-us"	       "http://ebay.com/sub"	        94
     46	    "Maggy Goodman"	    "https://guardian.co.uk/user/110"  "http://google.com/user/110"	    93
----------------------------------------------------------------------------------------------------------

-- решение на вложенных запросах
SELECT 
  id AS id_video, 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = video.owner_id) AS owner, 
  (SELECT url FROM photo WHERE id = (SELECT main_photo_id FROM users WHERE id = video.owner_id)) AS url_photo_owner,
  url AS url_video, 
  size
FROM video
ORDER BY size DESC
LIMIT 10;


-- Решение с помощью объединения JOIN
SELECT
  video.id AS id_video,
  CONCAT(first_name, ' ', last_name) AS owner,
  photo.url AS url_photo_owner,
  video.url AS url_video,
  video.size
  FROM video
   JOIN users
    ON video.owner_id = users.id
   JOIN photo
    ON users.main_photo_id = photo.id
  ORDER BY size DESC
LIMIT 10;

-- Решение с использованием временной таблицы
CREATE TEMPORARY TABLE big_video (
  id INT, 
  url VARCHAR(50),
  size INT,
  owner_id INT
);
INSERT INTO big_video
SELECT id, url, size, owner_id
 FROM video
 ORDER BY size DESC
LIMIT 10;
SELECT
  big_video.id AS id_video,
  CONCAT(first_name, ' ', last_name) as owner,
  photo.url as url_photo_owner,  
  big_video.url as url_video,
  big_video.size
   FROM users
    JOIN big_video
     ON big_video.owner_id = users.id
	JOIN photo
     ON users.main_photo_id = photo.id;

-- Решение с использованием общего табличного выражения
WITH big_video AS (
 SELECT  id, url, size, owner_id
 FROM video
)
SELECT
  big_video.id AS id_video,
  CONCAT(first_name, ' ', last_name) as owner,
  photo.url as url_photo_owner,
  big_video.url as url_video,
  big_video.size
   FROM users
    JOIN big_video
     ON big_video.owner_id = users.id
    JOIN photo
     ON users.main_photo_id = photo.id
  ORDER BY size DESC 
LIMIT 10;