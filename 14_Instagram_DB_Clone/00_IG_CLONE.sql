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
