-- createDummyData.sql a script to load some testing data
-- make sure addInsertFuncs.sql is run before this

-- add a user
--insert into suggestions_view (title, body)
--values ('help','i am lost');

insert into sugg_user_view (userid, body)
values ('1','i am lost');
