-- for thermo-monitor DB
--- users table
create table users
(
  user_id text UNIQUE,
  username text NOT NULL,
  password text NOT NULL,
  insert_date timestamptz,
  update_date timestamptz
);

---- sample data
insert into users
  (user_id, password, username)
values
  ('admin', 'change_to_encrypted_password', 'admin1'),
  ('user', 'change_to_encrypted_password', 'user1');

--- authorities table
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
  authority_id smallint UNIQUE,
  PRIMARY KEY (user_id, authority_id),
  FOREIGN KEY (user_id) REFERENCES public.users(user_id) on delete cascade on update cascade,
  FOREIGN KEY (authority_id) REFERENCES public.authorities(authority_id) on delete cascade on update cascade
);

---- sample data
insert into users_authorities
  (user_id, authority_id)
values
  ('admin', 1),
  ('user', 2);
