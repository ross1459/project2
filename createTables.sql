-- createTables.sql
-- creates basic table structure to be used in the database

-- create sequences
drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;

drop sequence if exists suggestion_id_seq cascade;
create sequence suggestion_id_seq;

--create tables
drop table if exists users cascade;
create table users(
  id integer not null primary key default nextval('user_id_seq'),
  name text,
  division text,
  department text,
  username text unique,
  password text,
  enc_pass text,
  salt text
);
drop table if exists suggestions cascade;
create table suggestions(
  id integer not null primary key default nextval('suggestion_id_seq'),
  body text,
  created_at timestamp,
  updated_at timestamp
);
drop table if exists users_suggestions cascade;
create table users_suggestions(
  user_id integer references users(id),
  suggestions_id integer references suggestions(id)
);

-- create views
-- users_view -a view to select all from users
drop view if exists users_view cascade;
create view users_view as
  select users.id as userid,users.name,users.division,users,department,
  users.username
  from users
  ;
  
--suggestions_view -a view to select all from suggestions
drop view if exists suggestions_view cascade;
create view suggestions_view as
  select suggestions.id as suggid,suggestions.body,suggestions.created_at,
  suggestions.updated_at
  from suggestions
  ;
--sugg_author_view -a view to show suggestions and authors
drop view if exists sugg_user_view cascade;
create view sugg_user_view as
  select users.id as userid,users.name,users.department,users.division, 
  users.username, suggestions.id as suggid,suggestions.body,
  suggestions.created_at,suggestions.updated_at
  from users 
  join users_suggestions on users.id=users_suggestions.user_id
  join suggestions on users_suggestions.suggestions_id=suggestions.id;
  
  
