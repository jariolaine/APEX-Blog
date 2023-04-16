--------------------------------------------------------
--  DDL for View BLOG_V_ALL_COMMENTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_COMMENTS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "POST_ID", "PARENT_ID", "POST_TITLE", "BODY_HTML", "COMMENT_BY", "CTX_SEARCH", "CTX_RID", "COMMENT_STATUS_CODE", "COMMENT_FLAG_CODE", "DATA_UNREAD", "COMMENT_STATUS_TEXT", "COMMENT_FLAG_TEXT", "COMMENT_STATUS_ICON", "COMMENT_FLAG_ICON", "SEARCH_DESC")  AS
with q1 as(
  select
     t1.id
    ,t1.row_version
    ,t1.created_on
    ,t1.created_by
    ,t1.changed_on
    ,t1.changed_by
    ,t1.is_active
    ,t1.post_id
    ,t1.parent_id
    ,t1.body_html
    ,t1.comment_by
    ,t1.ctx_search
    ,t1.rowid as ctx_rid
    ,case
      when exists(
        select 1
        from blog_comment_flags f1
        where f1.flag = 'MODERATE'
          and f1.comment_id = t1.id
      )
        then 'MODERATE'
      when t1.is_active = 1
        then 'ENABLED'
        else 'DISABLED'
    end as comment_status_code
    ,case
      when exists(
        select 1
        from blog_comment_flags f1
        where f1.flag = 'NEW'
          and f1.comment_id = t1.id
      )
        then 'NEW'
      when exists(
        select 1
        from blog_comment_flags f1
        where f1.flag = 'UNREAD'
          and f1.comment_id = t1.id
      )
        then 'UNREAD'
      when t1.parent_id is not null
        then 'REPLY'
        else 'READ'
    end as comment_flag_code
    ,apex_escape.striphtml(
      p_string => t1.body_html
    ) as search_desc
  from blog_comments t1
)
select
   q1.id                  as id
  ,q1.row_version         as row_version
  ,q1.created_on          as created_on
  ,lower( q1.created_by ) as created_by
  ,q1.changed_on          as changed_on
  ,lower( q1.changed_by ) as changed_by
  ,q1.is_active           as is_active
  ,q1.post_id             as post_id
  ,q1.parent_id           as parent_id
  ,t2.title               as post_title
  ,q1.body_html           as body_html
  ,q1.comment_by          as comment_by
  ,q1.ctx_search          as ctx_search
  ,q1.rowid               as ctx_rid
  ,q1.comment_status_code as comment_status_code
  ,q1.comment_flag_code   as comment_flag_code
  ,case
    when q1.comment_flag_code in( 'NEW', 'UNREAD' )
      then 'true'
      else 'false'
  end                     as data_unread
  ,(
    select
      lov.display_value
    from blog_v_lov lov
    where lov.lov_name = 'COMMENT_STATUS'
    and lov.return_value = q1.comment_status_code
  )                       as comment_status_text
  ,(
    select
      lov.display_value
    from blog_v_lov lov
    where lov.lov_name = 'COMMENT_FLAG'
    and lov.return_value = q1.comment_flag_code
  )                       as comment_flag_text
  ,case q1.comment_status_code
    when 'MODERATE'
      then 'fa-exclamation-circle u-warning-text'
    when 'ENABLED'
      then 'fa-check-circle u-success-text'
      else 'fa-minus-circle u-danger-text'
  end                     as comment_status_icon
  ,case q1.comment_flag_code
    when 'REPLY'
      then 'fa-send-o'
    when 'NEW'
      then 'fa-envelope-arrow-down'
    when 'UNREAD'
      then 'fa-envelope-o'
      else 'fa-envelope-open-o'
  end                     as comment_flag_icon
  ,substr( q1.search_desc, 1 , 128 ) || case when length( q1.search_desc ) > 128
    then ' ...'
  end                     as search_desc
from q1
join blog_posts t2 on q1.post_id = t2.id
where 1 = 1
/
