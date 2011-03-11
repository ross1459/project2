-- addInsertFuncs.sql - this script will make it easier to add users and suggestions
-- make sure that createTables.sql is run before this
-- create plpgsql language
drop language if exists plpgsql cascade;
create language plpgsql;
-- create function for adding a user and returning user id

create or replace function createUser(_name text, _division text,
_department text, _username text, _password text)
returns integer as
$func$
begin
execute 'insert into users (name, division, department, username, password)' ||
'values (' || quote_literal(_name) || ',' ||
quote_literal(_division) || ',' || quote_literal(_department) || ','
|| quote_literal(_username) || ',' || quote_literal(_password) || ')';
return currval('user_id_seq');
end;
$func$
language 'plpgsql';

-- create function for adding suggestions and returning suggestion id
create or replace function createSuggestion(_body text)
returns integer as
$func$
begin
execute 'insert into suggestions (body, created_at, updated_at)
values (' || quote_literal(_body) || ',' ||
quote_literal(now()) || ',' || quote_literal(now()) || ')';
return currval('suggestion_id_seq');
end;
$func$
language 'plpgsql';

-- create function for inserting into users_suggestions (creator of the suggestion)
create or replace function createPost(_userid integer, _body text)
returns boolean as
$func$
declare
sql1 text;
sugg_id integer;
begin
sql1 := 'select createSuggestion(' || quote_literal (_body) || ')' ;
execute sql1;
sugg_id :=  currval('suggestion_id_seq');
execute 
  'insert into users_suggestions (user_id, suggestions_id) values (' 
  || _userid || ',' || sugg_id || ')';
return 't';
end;
$func$
language 'plpgsql';
-- create rule
create or replace rule users_sugg_ins as 
  on insert to sugg_user_view
    do instead
      select createPost(new.userid, new.body);
create or replace rule sugg_create as
  on insert to suggestions_view
    do instead
      select createSuggestion(new.body)
