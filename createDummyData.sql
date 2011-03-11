-- createDummyData.sql a script to load some testing data
-- make sure addInsertFuncs.sql is run before this

insert into sugg_user_view (userid, body)
values ('1','i am ross');

insert into sugg_user_view (userid, body)
values ('2','The West Division needs more applesauce');

insert into sugg_user_view (userid, body)
values ('3','The East Chair needs more salary');

insert into sugg_user_view (userid, body)
values ('4','Department One lacks chairs');

insert into sugg_user_view (userid, body)
values ('5','Department Two is quite sunny');

insert into sugg_user_view (userid, body)
values ('6','A Suggestion');

insert into sugg_user_view (userid, body)
values ('7','Yatta!');
