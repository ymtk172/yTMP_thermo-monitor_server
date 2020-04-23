-- for user-api DB
create table users
(
  user_id text UNIQUE,
  password text,
  insert_date timestamptz,
  update_date timestamptz
);

insert into users
  (user_id, password, insert_date, update_date)
values
  ('user', 'pass', null, null);

-- for thermo-monitor DB
create database test00;

