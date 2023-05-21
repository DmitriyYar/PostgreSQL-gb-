-- Задание 1
SELECT users.id, friendship.requested_by_user_id, friendship.requested_to_user_id
FROM users 
  LEFT JOIN friendship 
   ON users.id = friendship.requested_by_user_id
   OR users.id = friendship.requested_to_user_id;

SELECT users.id, friendship.requested_by_user_id, friendship.requested_to_user_id
FROM users
  LEFT JOIN friendship 
   ON users.id = friendship.requested_by_user_id
   OR users.id = friendship.requested_to_user_id
WHERE friendship.requested_by_user_id IS NULL 
  AND friendship.requested_to_user_id IS NULL;
  
SELECT * FROM friendship_statuses;

SELECT users.id, friendship.requested_by_user_id, friendship.requested_to_user_id, friendship_statuses.id, friendship_statuses.name
FROM users
  LEFT JOIN friendship 
   ON users.id = friendship.requested_by_user_id
   OR users.id = friendship.requested_to_user_id
 LEFT JOIN friendship_statuses
   ON friendship.status_id = friendship_statuses.id
WHERE friendship_statuses.name = ('confirmed');

CREATE VIEW users_without_confirmed_friendship AS 
SELECT id FROM users WHERE id NOT IN
 (SELECT id FROM users_with_confirmed_friendship); 

BEGIN;
 DELETE 
  FROM video 
   USING users_without_confirmed_friendship
 WHERE video.owner_id = users_without_confirmed_friendship.id;

 DELETE 
  FROM photo 
   USING users_without_confirmed_friendship
 WHERE photo.owner_id = users_without_confirmed_friendship.id;
 
 DELETE 
  FROM communities 
   USING users_with_confirmed_friendship
  WHERE communities.creator_id = users_without_confirmed_friendship.id;
 
 DELETE 
  FROM communities_users 
   USING users_with_confirmed_friendship
  WHERE communities_users.user_id = users_without_confirmed_friendship.id;
  
 DELETE 
  FROM profiles 
   USING users_without_confirmed_friendship
 WHERE profiles.user_id = users_without_confirmed_friendship.id;
 
 DELETE 
  FROM users 
   USING users_with_confirmed_friendship
  WHERE users.id = users_without_confirmed_friendship.id;
ROLLBACK;

-- Задание 2
WITH users_photo_and_video_rating AS (
SELECT DISTINCT users.first_name, users.last_name,
  COUNT(DISTINCT photo.id) AS photo_count,
  COUNT(DISTINCT video.id) AS video_count
FROM users 
  LEFT JOIN photo 
    ON users.id = photo.owner_id
  LEFT JOIN video
    ON users.id = video.owner_id
GROUP BY users.id)	
SELECT first_name, last_name, photo_count, video_count,
 DENSE_RANK() OVER (ORDER BY photo_count DESC) AS photo_rank,
 DENSE_RANK() OVER (ORDER BY video_count DESC) AS video_rank
   FROM users_photo_and_video_rating
ORDER BY photo_rank, video_rank;

-- Задание 3
WITH selected_videos AS (
SELECT 
  communities.name AS community_name,
  communities_users.user_id,
  video.size AS video_size
FROM video
  INNER JOIN communities_users
	ON video.owner_id  = communities_users.user_id
  RIGHT JOIN communities
    ON communities.id = communities_users.community_id	
)
SELECT 
  community_name,
  AVG(video_size) OVER (PARTITION BY community_name),
  FIRST_VALUE(first_name || ' ' || last_name) 
   OVER (PARTITION BY community_name ORDER BY video_size DESC NULLS LAST)
FROM selected_videos
  LEFT JOIN users 
   ON selected_videos.user_id = users.id;