prompt --application/shared_components/files/js_blog_min_js
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
wwv_flow_api.g_varchar2_table(1) := '76617220626C6F673D626C6F677C7C7B7D3B2866756E6374696F6E28612C62297B612866756E6374696F6E28297B617065782E7468656D6534322E7574696C2E636F6E666967415045584D736773287B6175746F4469736D6973733A747275652C647572';
wwv_flow_api.g_varchar2_table(2) := '6174696F6E3A31303030307D297D293B622E55493D7B7365744C69737443757272656E744974656D3A66756E6374696F6E2863297B633D612E657874656E64287B63757272656E74436C6173733A2269732D63757272656E74222C64617461417474724E';
wwv_flow_api.g_varchar2_table(3) := '616D653A22626C6F672D636F6E74656E742D6964227D2C63293B632E6166666563746564456C656D656E74732E66696E6428226C6922292E66696C7465722866756E6374696F6E28297B76617220653D612874686973292E6368696C6472656E28226122';
wwv_flow_api.g_varchar2_table(4) := '292E6461746128632E64617461417474724E616D65292C643D66616C73653B69662865297B643D24765F436865636B56616C7565416761696E737428632E706167654974656D2C65297D72657475726E20647D292E616464436C61737328632E63757272';
wwv_flow_api.g_varchar2_table(5) := '656E74436C617373297D7D7D2928617065782E6A51756572792C626C6F67293B';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(19759584790129057)
,p_file_name=>'js/blog.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
