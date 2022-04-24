--  Patch 21.2.20220421
--------------------------------------------------------
--  DDL for Table BLOG_LIST_OF_VALUES
--------------------------------------------------------
create table blog_list_of_values(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  lov_name varchar2( 256 char ) not null,
  return_value varchar2(  256 char ) not null,
  display_message varchar2( 256 char ) not null,
  notes varchar2( 4000 byte ),
  constraint blog_list_of_values_pk primary key( id ),
  constraint blog_list_of_values_uk1 unique( lov_name, return_value ),
  constraint blog_list_of_values_ck1 check( row_version > 0 ),
  constraint blog_list_of_values_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_list_of_values_ck3 check( display_seq > 0 )
)
/
--------------------------------------------------------
--  DDL for Trigger BLOG_LIST_OF_VALUES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LIST_OF_VALUES_TRG"
before
insert or
update on blog_list_of_values
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  Inserting into BLOG_LIST_OF_VALUES
--------------------------------------------------------
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','COMMENT_FLAG','NEW','BLOG_LOV_COMMENT_FLAG_NEW');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','COMMENT_FLAG','UNREAD','BLOG_LOV_COMMENT_FLAG_UNREAD');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','COMMENT_FLAG','REPLY','BLOG_LOV_COMMENT_FLAG_REPLY');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','40','COMMENT_FLAG','READ','BLOG_LOV_COMMENT_FLAG_READ');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','COMMENT_STATUS','ENABLED','BLOG_LOV_COMMENT_STATUS_ENABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','COMMENT_STATUS','DISABLED','BLOG_LOV_COMMENT_STATUS_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','COMMENT_STATUS','MODERATE','BLOG_LOV_COMMENT_STATUS_MODERATE');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','IS_ACTIVE','1','BLOG_LOV_IS_ACTIVE_ENABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','IS_ACTIVE','0','BLOG_LOV_IS_ACTIVE_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','LINK_STATUS','ENABLED','BLOG_LOV_LINK_STATUS_ENABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','LINK_STATUS','DISABLED','BLOG_LOV_LINK_STATUS_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','LINK_STATUS','GROUP_DISABLED','BLOG_LOV_LINK_STATUS_LABEL_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','POST_STATUS','PUBLISHED','BLOG_LOV_POST_STATUS_PUBLISHED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','POST_STATUS','SCHEDULED','BLOG_LOV_POST_STATUS_SCHEDULED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','POST_STATUS','DRAFT','BLOG_LOV_POST_STATUS_DRAFT');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','40','POST_STATUS','CATEGORY_DISABLED','BLOG_LOV_POST_STATUS_CATEGORY_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','50','POST_STATUS','BLOGGER_DISABLED','BLOG_LOV_POST_STATUS_BLOGGER_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','YES_NO','0','BLOG_LOV_YES_NO_NO');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','YES_NO','1','BLOG_LOV_YES_NO_YES');
--------------------------------------------------------
--  Add constraint BLOG_FEATURES_FK1
--------------------------------------------------------
alter table blog_features add constraint blog_features_fk1 foreign key(build_option_parent) references blog_features(build_option_name)
;
--------------------------------------------------------
--  Drop not needed constraint BLOG_SETTINGS_CK5
--------------------------------------------------------
alter table blog_settings drop constraint blog_settings_ck5
;
--------------------------------------------------------
--  Rename BLOG_SETTINGS check constraints
--------------------------------------------------------
alter table blog_settings rename constraint blog_settings_ck6 to blog_settings_ck5
;
alter table blog_settings rename constraint blog_settings_ck7 to blog_settings_ck6
;
alter table blog_settings rename constraint blog_settings_ck8 to blog_settings_ck7
;
alter table blog_settings rename constraint blog_settings_ck9 to blog_settings_ck8
;
alter table blog_settings rename constraint blog_settings_ck10 to blog_settings_ck9
;
--------------------------------------------------------
--  Modify BLOG_SETTINGS columns
--------------------------------------------------------
alter table blog_settings modify int_min number( 10,0 )
;
alter table blog_settings modify int_max number( 10,0 )
;
--------------------------------------------------------
--  Update metadata
--------------------------------------------------------
-- update BLOG_SETTINGS
update blog_settings
  set display_seq = 410
  ,attribute_group_message = 'BLOG_SETTING_GROUP_COMMENTS'
where attribute_name = 'G_COMMENT_WATCH_MONTHS'
;
update blog_settings
  set display_seq = 610
  ,is_nullable = 1
  ,attribute_name = 'G_CANONICAL_HOST'
where attribute_name in( 'G_CANONICAL_URL', 'G_CANONICAL_HOST' )
;
update blog_settings
  set display_seq = 620
where attribute_name = 'G_RSS_URL'
;
update blog_settings
  set display_seq = 630
where attribute_name = 'G_RSS_XSL_URL'
;
-- fix previous patches bugs
update blog_settings
  set display_seq = 10
where attribute_name = 'G_APP_VERSION'
;
alter table blog_init_items modify constraint blog_init_items_fk1 disable
;
update blog_settings
  set display_seq = 210
  ,attribute_name = 'G_APP_DATE_FORMAT'
where 1 = 1
  and attribute_name in( 'G_APP_DATE_FORMAT', 'G_DATE_FORMAT' )
;
-- Update BLOG_INIT_ITEMS
update blog_init_items
  set item_name = 'G_APP_DATE_FORMAT'
where 1 = 1
  and item_name = 'G_DATE_FORMAT'
;
alter table blog_init_items modify constraint blog_init_items_fk1 enable
;
--------------------------------------------------------
--  Insert to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_group_message,attribute_name,data_type,attribute_value,int_min,int_max) values('510','0','BLOG_SETTING_GROUP_FILES','G_MAX_AGE_RSS','INTEGER','3600','0','31536000');
insert into blog_settings(display_seq,is_nullable,attribute_group_message,attribute_name,data_type,attribute_value,int_min,int_max) values('520','0','BLOG_SETTING_GROUP_FILES','G_MAX_AGE_RSS_XSL','INTEGER','604800','0','31536000');
insert into blog_settings(display_seq,is_nullable,attribute_group_message,attribute_name,data_type,attribute_value,int_min,int_max) values('530','0','BLOG_SETTING_GROUP_FILES','G_MAX_AGE_DOWNLOAD','INTEGER','3600','0','31536000');
insert into blog_settings(display_seq,is_nullable,attribute_group_message,attribute_name,data_type,attribute_value,int_min,int_max) values('540','0','BLOG_SETTING_GROUP_FILES','G_MAX_AGE_FILE','INTEGER','604800','0','31536000');
insert into blog_settings(display_seq,is_nullable,attribute_group_message,attribute_name,data_type,attribute_value,int_min,int_max) values('550','0','BLOG_SETTING_GROUP_FILES','G_MAX_AGE_SITEMAP','INTEGER','3600','0','31536000');
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq, is_nullable, attribute_name, data_type, attribute_group_message, attribute_value)
  values(10, 0, 'PATCH_20220421', 'STRING', 'INTERNAL', 'Patch 21.2.20220421')
;
