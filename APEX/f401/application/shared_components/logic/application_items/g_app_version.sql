prompt --application/shared_components/logic/application_items/g_app_version
begin
--   Manifest
--     APPLICATION ITEM: G_APP_VERSION
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(26222870858137050)
,p_name=>'G_APP_VERSION'
,p_protection_level=>'I'
,p_item_comment=>'Application version. The value is set in the application process "Initialize Items"'
);
wwv_flow_api.component_end;
end;
/
