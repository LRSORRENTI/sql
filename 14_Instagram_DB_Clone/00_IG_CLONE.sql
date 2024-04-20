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