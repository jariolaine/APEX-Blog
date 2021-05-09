--------------------------------------------------------
--  DDL for View BLOG_V_ALL_SETTINGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_SETTINGS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_NULLABLE", "DISPLAY_SEQ", "ATTRIBUTE_NAME", "ATTRIBUTE_VALUE", "DATA_TYPE", "GROUP_NAME", "ATTRIBUTE_DESC", "ATTRIBUTE_GROUP", "POST_EXPRESSION", "INT_MIN", "INT_MAX") AS
  select
   t1.id                    as id
  ,t1.row_version           as row_version
  ,t1.created_on            as created_on
  ,lower(t1.created_by)     as created_by
  ,t1.changed_on            as changed_on
  ,lower(t1.changed_by)     as changed_by
  ,t1.is_nullable           as is_nullable
  ,t1.display_seq           as display_seq
  ,t1.attribute_name        as attribute_name
  ,t1.attribute_value       as attribute_value
  ,t1.data_type             as data_type
  ,t1.group_name            as group_name
  ,apex_lang.message(
    'BLOG_PAR_'
    || t1.attribute_name
  )                         as attribute_desc
  ,apex_lang.message(
    t1.group_name
  )                         as attribute_group
  ,t1.post_expression       as post_expression
  ,t1.int_min               as int_min
  ,t1.int_max               as int_max
from blog_settings t1
where 1 = 1
/
