prompt --application/shared_components/logic/application_processes/get_blogger_details
begin
--   Manifest
--     APPLICATION PROCESS: Get Blogger Details
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(27393260249598885)
,p_process_sequence=>20
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Blogger Details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.get_blogger_details(',
'   p_app_id    => :APP_ID',
'  ,p_username  => :APP_USER',
'  ,p_id        => :G_BLOGGER_ID',
'  ,p_name      => :G_BLOGGER_NAME',
');'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_api.component_end;
end;
/
