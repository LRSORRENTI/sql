# Intro to Instagram Database Clone

This section we'll begin to work with and define a setup and database structure that instagram uses. This will also provide a chance to work with a very large dataset. 

If we think how Instagram works, we'll need the foloowing:

- Users
- Photos
- Likes
- Hashtags
- Comments
- Dates of posts
- Followers
- Following

## Brainstorm how to define the schema, probably foreign keys referencing other tables

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40),
    last_name VARCHAR(60),
);

CREATE TABLE photos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    photoURL VARCHAR(255),
    photo_id INT,
    FOREIGN KEY (photo_id) REFERENCES users(id)
);

