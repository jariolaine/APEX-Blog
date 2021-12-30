prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_app_setting(
 p_id=>wwv_flow_api.id(19760760551290112)
,p_name=>'BLOG_RSS_XSL_CSS'
,p_value=>'css/rss-xsl.min.css'
,p_is_required=>'Y'
,p_comments=>'RSS feed HTML transformation CSS'
);
wwv_flow_api.component_end;
end;
/
