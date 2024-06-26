CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- +------------+--------------+------+-----+-------------------+-------------------+
-- | Field      | Type         | Null | Key | Default           | Extra             |
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | id         | int          | NO   | PRI | NULL              | auto_increment    |
-- | username   | varchar(255) | NO   | UNI | NULL              |                   |
-- | created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +------------+--------------+------+-----+-------------------+-------------------+

INSERT INTO users (username) VALUES 
    ('Blue'),
    ('Charlie'),
    ('Luke');

-- SELECT * FROM users;
-- +----+----------+---------------------+
-- | id | username | created_at          |
-- +----+----------+---------------------+
-- |  1 | Blue     | 2024-04-20 07:40:26 |
-- |  2 | Charlie  | 2024-04-20 07:40:26 |
-- |  3 | Luke     | 2024-04-20 07:40:26 |
-- +----+----------+---------------------+

CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- DESC photos;
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | Field      | Type         | Null | Key | Default           | Extra             |
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | id         | int          | NO   | PRI | NULL              | auto_increment    |
-- | image_url  | varchar(255) | NO   |     | NULL              |                   |
-- | user_id    | int          | NO   | MUL | NULL              |                   |
-- | created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +------------+--------------+------+-----+-------------------+-------------------+

INSERT INTO photos (image_url, user_id) VALUES 
('randomimageurls12123/', 1),
('randomimageurls155243/', 2),
('randomimageurls128998/', 3);

-- SELECT * FROM photos;
-- +----+------------------------+---------+---------------------+
-- | id | image_url              | user_id | created_at          |
-- +----+------------------------+---------+---------------------+
-- |  1 | randomimageurls12123/  |       1 | 2024-04-20 07:50:27 |
-- |  2 | randomimageurls155243/ |       2 | 2024-04-20 07:50:27 |
-- |  3 | randomimageurls128998/ |       3 | 2024-04-20 07:50:27 |
-- +----+------------------------+---------+---------------------+

-- SELECT * FROM photos
-- JOIN users ON photos.user_id = users.id;

-- +----+------------------------+---------+---------------------+----+----------+---------------------+
-- | id | image_url              | user_id | created_at          | id | username | created_at          |
-- +----+------------------------+---------+---------------------+----+----------+---------------------+
-- |  1 | randomimageurls12123/  |       1 | 2024-04-20 07:50:27 |  1 | Blue     | 2024-04-20 07:40:26 |
-- |  2 | randomimageurls155243/ |       2 | 2024-04-20 07:50:27 |  2 | Charlie  | 2024-04-20 07:40:26 |
-- |  3 | randomimageurls128998/ |       3 | 2024-04-20 07:50:27 |  3 | Luke     | 2024-04-20 07:40:26 |
-- +----+------------------------+---------+---------------------+----+----------+---------------------+

-- SELECT photos.image_url, users.username FROM photos
-- JOIN users ON photos.user_id = users.id;

-- +------------------------+----------+
-- | image_url              | username |
-- +------------------------+----------+
-- | randomimageurls12123/  | Blue     |
-- | randomimageurls155243/ | Charlie  |
-- | randomimageurls128998/ | Luke     |
-- +------------------------+----------+

-- NOTE that comments are written by a user, but also connected 
-- to a specific photo, so we'll need two foreign keys 

CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

-- DESC comments;
-- +--------------+--------------+------+-----+-------------------+-------------------+
-- | Field        | Type         | Null | Key | Default           | Extra             |
-- +--------------+--------------+------+-----+-------------------+-------------------+
-- | id           | int          | NO   | PRI | NULL              | auto_increment    |
-- | comment_text | varchar(255) | NO   |     | NULL              |                   |
-- | user_id      | int          | NO   | MUL | NULL              |                   |
-- | photo_id     | int          | NO   | MUL | NULL              |                   |
-- | created_at   | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +--------------+--------------+------+-----+-------------------+-------------------+

INSERT INTO comments (comment_text, user_id, photo_id) VALUES
('Meow', 1, 2),
('Nice', 3, 2),
('hello', 2, 1);

-- SELECT * FROM comments;
-- +----+--------------+---------+----------+---------------------+
-- | id | comment_text | user_id | photo_id | created_at          |
-- +----+--------------+---------+----------+---------------------+
-- |  1 | Meow         |       1 |        2 | 2024-04-20 08:10:09 |
-- |  2 | Nice         |       3 |        2 | 2024-04-20 08:10:09 |
-- |  3 | hello        |       2 |        1 | 2024-04-20 08:10:09 |
-- +----+--------------+---------+----------+---------------------+

-- #### What about likes? 

-- For likes we'll probably need to reference the user_id,
-- photo_id, and created_at, note we don't need to add 
-- an id field to likes, we'll only ever need to reference 
-- likes in the context of users and photos, note the 
-- PRIMARY KEY(user_id, photo_id) this line ensures a like 
-- can only be left once, one single user can't then like 
-- a photo more than once 

CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes (user_id, photo_id) VALUES 
(1,1),
(2,1),
(3,2),
(2,3);

-- SELECT * FROM likes;
-- +---------+----------+---------------------+
-- | user_id | photo_id | created_at          |
-- +---------+----------+---------------------+
-- |       1 |        1 | 2024-04-20 08:40:43 |
-- |       2 |        1 | 2024-04-20 08:40:43 |
-- |       2 |        3 | 2024-04-20 08:40:43 |
-- |       3 |        2 | 2024-04-20 08:40:43 |
-- +---------+----------+---------------------+

-- BELOW WON'T WORK BECAUSE OF THE PRIMARY KEY CONSTRAINT
-- PRIMARY KEY(user_id, photo_id)
-- User 1 has already liked photo id of 1, this prevents 
-- liking more than once 

-- INSERT INTO likes(user_id, photo_id) VALUES 
-- (1,1);

-- FOLLOWERS SCHEMA 

-- How will this work? If I follow a user, then they can 
-- also follow back, or not, how would we keep track of 
-- this? 

-- Essentially we need two follower id', both are foreign 
-- keys referring to a user id, so follower_id of 1 follows 
-- follower_id of 2

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows (follower_id, followee_id) 
VALUES 
(1, 2),
(2, 3),
(3, 1),
(2, 1);

SELECT * FROM follows;

-- +-------------+-------------+---------------------+
-- | follower_id | followee_id | created_at          |
-- +-------------+-------------+---------------------+
-- |           1 |           2 | 2024-04-20 09:31:40 |
-- |           2 |           1 | 2024-04-20 09:31:40 |
-- |           2 |           3 | 2024-04-20 09:31:40 |
-- |           3 |           1 | 2024-04-20 09:31:40 |
-- +-------------+-------------+---------------------+

-- HASHTAGS TABLE 

CREATE TABLE tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name varchar(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL, 
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

SHOW TABLES;

-- +---------------------------+
-- | Tables_in_instagram_clone |
-- +---------------------------+
-- | comments                  |
-- | follows                   |
-- | likes                     |
-- | photo_tags                |
-- | photos                    |
-- | tags                      |
-- | users                     |
-- +---------------------------+

INSERT INTO tags(tag_name) VALUES 
('adorable'),
('nice'),
('sunrise');

SELECT * FROM tags;
-- +----+----------+---------------------+
-- | id | tag_name | created_at          |
-- +----+----------+---------------------+
-- |  1 | adorable | 2024-04-22 06:42:03 |
-- |  2 | nice     | 2024-04-22 06:42:03 |
-- |  3 | sunrise  | 2024-04-22 06:42:03 |
-- +----+----------+---------------------+

INSERT INTO photo_tags (photo_id, tag_id) VALUES 
(1,1),
(1,2),
(2,3),
(3,2);

SELECT * FROM photo_tags;

-- +----------+--------+
-- | photo_id | tag_id |
-- +----------+--------+
-- |        1 |      1 |
-- |        1 |      2 |
-- |        3 |      2 |
-- |        2 |      3 |
-- +----------+--------+

INSERT INTO photo_tags(photo_id, tag_id) VALUES
(1,1);
-- The above query returns an error since we already tagged that 
-- photo:

-- ERROR 1062 (23000): Duplicate entry '1-1' for key
-- 'photo_tags.PRIMARY'
