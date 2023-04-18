--- (Урок 3)

--- Внешние ключи
ALTER TABLE users
	ADD CONSTRAINT users_main_photo_id_fk
	FOREIGN KEY (main_photo_id)
	REFERENCES photo (id);

ALTER TABLE messages
	ADD CONSTRAINT messages_from_user_id_fk
	FOREIGN KEY (from_user_id)
	REFERENCES users (id);
	
ALTER TABLE messages
	ADD CONSTRAINT messages_to_user_id_fk
	FOREIGN KEY (to_user_id)
	REFERENCES users (id)
	ON DELETE CASCADE;
	
ALTER TABLE friendship
	ADD CONSTRAINT friendship_requested_by_user_id_fk
	FOREIGN KEY (requested_by_user_id)
	REFERENCES users (id);
	
ALTER TABLE friendship
	ADD CONSTRAINT friendship_requested_to_user_id_fk
	FOREIGN KEY (requested_to_user_id)
	REFERENCES users (id)
	ON DELETE CASCADE;
	
ALTER TABLE communities
	ADD CONSTRAINT communities_creator_id_fk
	FOREIGN KEY (creator_id)
	REFERENCES users (id)
	ON DELETE CASCADE;
	
ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_community_id_fk
	FOREIGN KEY (community_id)
	REFERENCES communities (id)
		
ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_user_id_fk
	FOREIGN KEY (user_id)
	REFERENCES users (id)
	
ALTER TABLE photo
	ADD CONSTRAINT photo_owner_id_fk
	FOREIGN KEY (owner_id)
	REFERENCES users (id);
	
ALTER TABLE video
	ADD CONSTRAINT video_owner_id_fk
	FOREIGN KEY (owner_id)
	REFERENCES users (id);
	
--- Тип данных JSON  
ALTER TABLE photo ADD COLUMN metadata JSON;
UPDATE photo SET metadata = json_build_object(
	'id', id,
	'url', url,
	'size', size
);

--- Тип данных Массив  
ALTER TABLE communities ADD COLUMN members INT[];
UPDATE communities SET members = (SELECT ARRAY_AGG(user_id) FROM communities_users WHERE community_id = 3) WHERE id = 3;

--- Пользовательский-Составной nип данных   
CREATE TYPE contacts AS (phone VARCHAR(15), email VARCHAR(120));
ALTER TABLE users ADD COLUMN user_contacts contacts;
UPDATE users SET user_contacts = (users.phone, users.email);
UPDATE users SET user_contacts.email = 'test@somemail.ru' WHERE id = 27;