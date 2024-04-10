
## CHECK Constraints

CHECK is another keyword constraint, these are used to define custom constraints on a given column, we have a party but it's 18 years or older to be allowed entry, we could use a CHECK:

CREATE TABLE partiers (
    name VARCHAR(50),
    age INT CHECK (age >= 18)
);

Another example

CREATE TABLE users (
    username VARCHAR(120) NOT NULL,
    age INT CHECK (age > 0) NOT NULL
);

INSERT INTO users (username, age)
VALUES ('Steve123', 22),
    ('Beth86', 27);
Query OK, 2 rows affected (0.15 sec)


INSERT INTO users (username, age) 
VALUES ('jeff12', -4);

ERROR 3819 (HY000): Check constraint 'users_chk_1' is violated.

We get the above error since we define our CHECK constraint in the users table to be any age greater than 0, -4 doesn't satisfy the constraint so the error is thrown

Let's look at another example, we only want palindromes, racecar is an example of a palindrome, it's spelled the same forwards, and backwards 

CREATE TABLE palindrome  (
    word VARCHAR(100) CHECK (REVERSE(word) = word)
);

INSERT INTO palindrome (word) VALUES (
    'racecar'
);

But if we insert a non palindrome

INSERT INTO palindrome (word) VALUES (
    'testing'
);

ERROR 3819 (HY000): Check constraint 'palindrome_chk_1' is violated.
