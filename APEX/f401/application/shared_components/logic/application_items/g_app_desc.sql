prompt --application/shared_components/logic/application_items/g_app_desc
begin
--   Manifest
--     APPLICATION ITEM: G_APP_DESC
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966805581190300)
,p_name=>'G_APP_DESC'
,p_protection_level=>'I'
,p_item_comment=>'Application description'
);
wwv_flow_api.component_end;
end;
/
