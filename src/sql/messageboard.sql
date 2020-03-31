CREATE DATABASE message_board
CREATE TABLE user(
id int identity primary ,
name varchar(100),
password varchar(100),
insert_time timestamp ,
update_time timestamp
);

CREATE TABLE message(
id int identity primary ,
user_name varchar(100),
body varchar(500),
parent_id int ,
insert_time timestamp ,
update_time timestamp
);

