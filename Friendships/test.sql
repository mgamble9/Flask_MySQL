SELECT user.first_name, user.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name
FROM user
LEFT JOIN friendships
ON user.id = friendships.user_id
LEFT JOIN user AS user2
ON user2.id = friendships.friend_id

