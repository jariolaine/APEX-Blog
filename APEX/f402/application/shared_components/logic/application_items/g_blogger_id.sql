prompt --application/shared_components/logic/application_items/g_blogger_id
begin
--   Manifest
--     APPLICATION ITEM: G_BLOGGER_ID
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(8905163685110392)
,p_name=>'G_BLOGGER_ID'
,p_protection_level=>'I'
,p_item_comment=>'User ID'
);
wwv_flow_api.component_end;
end;
/
