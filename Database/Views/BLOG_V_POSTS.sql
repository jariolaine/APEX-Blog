--------------------------------------------------------
--  DDL for View BLOG_V_POSTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS" ("POST_ID", "CATEGORY_ID", "BLOGGER_ID", "BLOGGER_NAME", "POST_TITLE", "CATEGORY_TITLE", "POST_DESC", "FIRST_PARAGRAPH", "BODY_HTML", "PUBLISHED_ON", "CHANGED_ON", "ARCHIVE_YEAR_MONTH", "ARCHIVE_YEAR", "CATEGORY_SEQ", "CTX_SEARCH", "COMMENTS_COUNT") AS
  select
   t1.id                  as post_id
  ,t3.id                  as category_id
  ,t2.id                  as blogger_id
  ,t2.blogger_name        as blogger_name
  ,t1.title               as post_title
  ,t3.title               as category_title
  ,t1.post_desc           as post_desc
  ,t1.first_paragraph     as first_paragraph
  ,t1.body_html           as body_html
  ,t1.published_on        as published_on
  ,t1.changed_on          as changed_on
  ,t1.archive_year_month  as archive_year_month
  ,t1.archive_year        as archive_year
  ,t3.display_seq         as category_seq
  ,t4.dummy               as ctx_search
  ,(
    select count( l1.id )
    from blog_comments l1
    where 1 = 1
    and l1.is_active = 1
    and l1.post_id  = t1.id
  )                       as comments_count
from blog_posts t1
join blog_bloggers t2
  on t1.blogger_id  = t2.id
join blog_categories t3
  on t1.category_id = t3.id
join blog_post_uds t4
  on t1.id = t4.post_id
where 1 = 1
and t1.is_active = 1
and t2.is_active = 1
and t3.is_active = 1
and t1.published_on <= localtimestamp
with read only
/
