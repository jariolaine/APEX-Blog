--------------------------------------------------------
--  DDL for View BLOG_V_COMMENTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_COMMENTS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "POST_ID", "PARENT_ID", "POST_TITLE", "BODY_HTML", "COMMENT_BY", "STATUS", "FLAG", "USER_ICON", "ICON_MODIFIER")  AS
  select
   t1.id            as id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.created_by    as created_by
  ,t1.changed_on    as changed_on
  ,t1.changed_by    as changed_by
  ,t1.is_active     as is_active
  ,t1.post_id       as post_id
  ,t1.parent_id     as parent_id
  ,(
    select title
    from blog_posts l1
    where 1 = 1
    and l1.id = t1.post_id
   )                as post_title
  ,t1.body_html     as body_html
  ,t1.comment_by    as comment_by
  ,case
    when exists(
      select 1
      from blog_comment_flags f1
      where 1 = 1
        and f1.comment_id = t1.id
        and f1.flag = 'MODERATE'
    )
    then 'MODERATE'
    else
      case t1.is_active
        when 1
        then 'ENABLED'
        else 'DISABLED'
      end
   end              as status
   ,case
     when exists(
       select 1
       from blog_comment_flags f1
       where 1 = 1
         and f1.comment_id = t1.id
         and f1.flag = 'NEW'
     )
     then 'NEW'
     when exists(
       select 1
       from blog_comment_flags f1
       where 1 = 1
         and f1.comment_id = t1.id
         and f1.flag = 'UNREAD'
     )
     then 'UNREAD'
     when t1.parent_id is not null
     then 'REPLY'
     else 'READ'
    end              as flag
  ,apex_string.get_initials(
    t1.comment_by
  )                 as user_icon
  ,'u-color-' ||
  (
    ora_hash( lower( t1.comment_by ), 44 ) + 1
  )                 as icon_modifier
from blog_comments t1
where 1 = 1
/
