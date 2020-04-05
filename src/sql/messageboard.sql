CREATE DATABASE message_board

create table message_board.message
(
    id          int auto_increment
        primary key,
    user_id     int          not null,
    user_name   varchar(100) not null,
    body        varchar(500) not null,
    parent_id   int          not null,
    insert_time timestamp    not null,
    update_time timestamp    not null
);


create table message_board.message
(
    id          int auto_increment
        primary key,
    user_id     int          not null,
    user_name   varchar(100) not null,
    body        varchar(500) not null,
    parent_id   int          not null,
    insert_time timestamp    not null,
    update_time timestamp    not null
);


