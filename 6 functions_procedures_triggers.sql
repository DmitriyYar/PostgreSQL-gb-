
-- 1. Функция, которая по идентификатору пользователя ищет того, кто написал пользователю наибольшее количество сообщений.
--    (возвращает id пользователя написаышего найбольшее кол-во сообщений )
CREATE FUNCTION user_id_active_by_messages(user_id INTEGER)
RETURNS INTEGER AS
$$
SELECT 
  messages.to_user_id
  FROM users
   JOIN messages
   ON messages.from_user_id = users.id
  WHERE users.id = user_id
  GROUP BY messages.to_user_id
  ORDER BY COUNT(*) DESC
  LIMIT 1;
$$
LANGUAGE SQL;

-- 2. Создать два представления для таблицы видео. Одно представление должно быть неизменяемым, другое - изменяемым
CREATE VIEW users_video_size AS
SELECT users.id, users.first_name, users.last_name, video.size
  FROM users
  LEFT JOIN video
   ON users.id = video.owner_id
   WHERE size BETWEEN 20 AND 50 
 ORDER BY size; 

-- выполнение запроса
SELECT * FROM users_video_size
 
 
CREATE VIEW change_description AS
SELECT * FROM video WHERE url LIKE '%youtube%';

-- выполнение запроса
UPDATE change_video_description SET description = 'Description changed' WHERE id = 28;

-- 3. Создать процедуру, которая проверяет владельца фотографий
CREATE OR REPLACE PROCEDURE identify_owners_photo(
  id_user INTEGER
)
LANGUAGE PLPGSQL AS
$$ 
DECLARE 
    photo_id INTEGER;
    photo_owner_id INTEGER;
BEGIN
  photo_id := (SELECT main_photo_id FROM profiles WHERE user_id = id_user);
  photo_owner_id := (SELECT owner_id FROM photo WHERE id = photo_id);
  IF photo_id != photo_owner_id THEN 
    UPDATE profiles SET main_photo_id = NULL WHERE user_id = id_user;
  END IF;
  COMMIT;
END;
$$;

-- выполнение процедуры
CALL identify_owners_photo(26);