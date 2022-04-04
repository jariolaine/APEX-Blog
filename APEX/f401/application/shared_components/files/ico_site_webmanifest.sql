prompt --application/shared_components/files/ico_site_webmanifest
begin
--   Manifest
--     APP STATIC FILES: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B0A2020226E616D65223A2022222C0A20202273686F72745F6E616D65223A2022222C0A20202269636F6E73223A205B0A202020207B0A20202020202022737263223A2022616E64726F69642D6368726F6D652D313932783139322E706E67222C0A2020';
wwv_flow_api.g_varchar2_table(2) := '202020202273697A6573223A202231393278313932222C0A2020202020202274797065223A2022696D6167652F706E67220A202020207D2C0A202020207B0A20202020202022737263223A2022616E64726F69642D6368726F6D652D353132783531322E';
wwv_flow_api.g_varchar2_table(3) := '706E67222C0A2020202020202273697A6573223A202235313278353132222C0A2020202020202274797065223A2022696D6167652F706E67220A202020207D0A20205D2C0A2020227468656D655F636F6C6F72223A202223666666666666222C0A202022';
wwv_flow_api.g_varchar2_table(4) := '6261636B67726F756E645F636F6C6F72223A202223666666666666222C0A202022646973706C6179223A20227374616E64616C6F6E65220A7D0A';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(24231171402728404)
,p_file_name=>'ico/site.webmanifest'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
