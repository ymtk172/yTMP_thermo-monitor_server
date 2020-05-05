-- for thermo-monitor DB schema=test01
--- users table
create table users
(
  user_id text UNIQUE,
  password text NOT NULL,
  insert_date timestamptz,
  update_date timestamptz
);

---- sample data
insert into users
  (user_id, password)
values
  ('admin', 'change_to_encrypted_password'),
  ('user', 'change_to_encrypted_password');

--- authorities table(master table)
create table authorities
(
  authority_id smallint PRIMARY KEY,
  authority text NOT NULL
);

---- sample data
insert into authorities
  (authority_id, authority)
values
  ('1', 'ROLE_ADMIN'),
  ('2', 'ROLE_USER');

--- users_authorities table
create table users_authorities
(
  user_id text,
  authority_id smallint,
  PRIMARY KEY (user_id, authority_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) on delete cascade on update cascade,
  FOREIGN KEY (authority_id) REFERENCES authorities(authority_id) on delete cascade on update cascade
);

---- sample data
insert into users_authorities
  (user_id, authority_id)
values
  ('admin', 1),
  ('user', 2);

--- for user-api DB schema=test00
create database test00;
\c test00;
create table user_properties
(
  user_id text PRIMARY KEY,
  display_name text,
  insert_date timestamptz,
  update_date timestamptz
);

---- sample data
insert into user_properties
  (user_id, display_name)
values
  ('admin', 'admin1'),
  ('user', 'user1');

--- for thermo-api DB schema=test02
create database test02;
\c test02;
create table user_body_temperatures
(
  user_id text,
  body_temperatures real,
  data_timestamp timestamptz,
  insert_date timestamptz,
  update_date timestamptz
);

---- sample data
insert into user_body_temperatures
  (user_id, data_timestamp, body_temperatures)
values
  ('admin', '2020-04-01 01:00:00 +0900', 36.1),
  ('user', '2020-04-01 01:00:00 +0900', 36.2);
