prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_archive
begin
--   Manifest
--     SHORTCUT: BLOG_CANONICAL_LINK_ARCHIVE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(14616166855626773)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_ARCHIVE'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_comments=>'Get canonical link for archive. Used in page 15 page html header.'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_html.get_archive_canonical_link(',
'  p_archive_id  => :P15_ARCHIVE_ID',
', p_html        => blog_util.g_link_canonical',
', p_url         => :G_PAGE_URL',
');',
'return blog_util.g_link_canonical;'))
);
wwv_flow_imp.component_end;
end;
/
