USE twitter;
SELECT *
FROM faves;
INSERT INTO faves (user_id, tweet_id, created_at, updated_at)
VALUES (2, 12, NOW(), NOW());
DELETE FROM faves WHERE id = 10;
SELECT *
FROM faves;
UPDATE users SET first_name = 'Billy' WHERE id = 2;
SELECT *
FROM users;
