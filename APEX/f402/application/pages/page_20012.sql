prompt --application/pages/page_20012
begin
--   Manifest
--     PAGE: 20012
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20012
,p_name=>'Settings'
,p_alias=>'SETTINGS'
,p_page_mode=>'MODAL'
,p_step_title=>'Settings'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8574375481518289)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.configIG.initOnPageLoad({',
'  regionId: "preferences"',
'});'))
,p_step_template=>wwv_flow_imp.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221003075529'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27272383079075402)
,p_plug_name=>'Settings'
,p_region_name=>'preferences'
,p_region_css_classes=>'z-config-ig'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id                as id',
'  ,v1.row_version           as row_version',
'  ,v1.display_seq           as display_seq',
'-- HTML in query because IG not use HTM expression in control break column',
'  ,apex_string.format(',
'     p_message => ''<span data-sort-order="%s" class="u-bold">%s</span>''',
'    ,p0 => v1.attribute_group_seq',
'    ,p1 => apex_escape.html( v1.attribute_group )',
'  )                         as attribute_group',
'  ,v1.attribute_desc        as attribute_desc',
'  ,v1.attribute_value       as attribute_value',
'-- help button',
'  ,apex_lang.message(',
'    p_name => ''BLOG_BTN_TITLE_HELP'' ',
'  )                         as help_btn',
'-- required column fom LOV',
'  ,(',
'    select lov.display_value',
'    from #OWNER#.blog_v_lov lov',
'    where 1 = 1',
'    and lov.lov_name = ''YES_NO''',
'    and lov.return_value = ( v1.is_nullable - 1 ) * -1',
'  )                         as required',
'  ,v1.changed_by            as changed_by',
'  ,v1.changed_on            as changed_on',
'-- required column class',
'  ,case v1.is_nullable',
'    when 0',
'    then ''z-required''',
'  end                       as required_class',
'-- hidden columns for validation',
'  ,v1.is_nullable           as is_nullable',
'  ,v1.data_type             as data_type',
'  ,v1.int_min               as int_min',
'  ,v1.int_max               as int_max',
'from #OWNER#.blog_v_all_settings v1',
'where 1 = 1',
'and v1.attribute_group_message != ''INTERNAL''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11417791403329135)
,p_name=>'HELP_BTN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HELP_BTN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Help'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_link_target=>'f?p=&APP_ID.:20100:&SESSION.:SETTINGS:&DEBUG.::P20100_ID:&ID.'
,p_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-question-circle-o"></span>'
,p_link_attributes=>'title="&HELP_BTN." aria-label="&HELP_BTN." class="t-Button t-Button--noLabel t-Button--icon t-Button--link padding-none"'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11417836275329136)
,p_name=>'REQUIRED_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQUIRED_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26063278609107810)
,p_name=>'REQUIRED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQUIRED'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Required'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attribute_01=>'<div class="z-status-marker z-status-marker--left &REQUIRED_CLASS!ATTR.">&REQUIRED.</div>'
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27273666138075415)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27273715372075416)
,p_name=>'ROW_VERSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_VERSION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27273843526075417)
,p_name=>'CHANGED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_stretch=>'A'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27273923510075418)
,p_name=>'CHANGED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27274008313075419)
,p_name=>'DISPLAY_SEQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_SEQ'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Sequence'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_stretch=>'A'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27274156249075420)
,p_name=>'ATTRIBUTE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTRIBUTE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'padding-left-md'
,p_stretch=>'A'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27274299493075421)
,p_name=>'ATTRIBUTE_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTRIBUTE_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27274656113075425)
,p_name=>'DATA_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATA_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27275024747075429)
,p_name=>'IS_NULLABLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_NULLABLE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27863103480256830)
,p_name=>'ATTRIBUTE_GROUP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTRIBUTE_GROUP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Group'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attribute_05=>'HTML'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(40726648121800845)
,p_name=>'INT_MIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INT_MIN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(40726710687800846)
,p_name=>'INT_MAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INT_MAX'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(27273553203075414)
,p_internal_uid=>27273553203075414
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>'blog.admin.configIG.initRegion'
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(27305085557698518)
,p_interactive_grid_id=>wwv_flow_imp.id(27273553203075414)
,p_static_id=>'249341'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(27305179764698519)
,p_report_id=>wwv_flow_imp.id(27305085557698518)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(12008433965069617)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11417791403329135)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(12027024911115633)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11417836275329136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27305635511698520)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(27273666138075415)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27306101204698522)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(27273715372075416)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27306661998698523)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(27273843526075417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27307154357698525)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(27273923510075418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27307971348698527)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(27274008313075419)
,p_is_visible=>false
,p_is_frozen=>true
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27308473644698528)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(27274156249075420)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>500
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27308994449698530)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(27274299493075421)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>500
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27320546428776393)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(27274656113075425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27331691183910886)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(27275024747075429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27653547974962439)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(26063278609107810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(28295161229136601)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(27863103480256830)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(41191693488877410)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(40726648121800845)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(41192120028877414)
,p_view_id=>wwv_flow_imp.id(27305179764698519)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(40726710687800846)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36998038204037736)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:t-Alert--accessibleHeading:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(8471603023518189)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'&APP_TEXT$BLOG_MSG_BASIC_SETTINGS_INFO.'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(80220063138113444)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27224922474281870)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(80220063138113444)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27324432937857302)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(80220063138113444)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'js-actionButton'
,p_icon_css_classes=>'fa-save'
,p_button_cattributes=>'data-action="ig-save"'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27275185259075430)
,p_tabular_form_region_id=>wwv_flow_imp.id(27272383079075402)
,p_validation_name=>'Is not null'
,p_validation_sequence=>10
,p_validation=>'ATTRIBUTE_VALUE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please fill out this field.'
,p_validation_condition=>'IS_NULLABLE'
,p_validation_condition2=>'0'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'ATTRIBUTE_VALUE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27274827107075427)
,p_tabular_form_region_id=>wwv_flow_imp.id(27272383079075402)
,p_validation_name=>'Is Integer'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_cm.is_integer(',
'   p_value    => :ATTRIBUTE_VALUE',
'  ,p_min      => :INT_MIN',
'  ,p_max      => :INT_MAX',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_INTEGER''',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'DATA_TYPE'
,p_validation_condition2=>'INTEGER'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'ATTRIBUTE_VALUE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27274966551075428)
,p_tabular_form_region_id=>wwv_flow_imp.id(27272383079075402)
,p_validation_name=>'Is date format'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_cm.is_date_format(',
'  p_value     => :ATTRIBUTE_VALUE',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_DATE_FORMAT''',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'DATA_TYPE'
,p_validation_condition2=>'DATE_FORMAT'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'ATTRIBUTE_VALUE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27275284361075431)
,p_tabular_form_region_id=>wwv_flow_imp.id(27272383079075402)
,p_validation_name=>'Is URL'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_cm.is_url(',
'  p_value     => :ATTRIBUTE_VALUE',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_URL''',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'DATA_TYPE'
,p_validation_condition2=>'URL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'ATTRIBUTE_VALUE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(31248169277982921)
,p_tabular_form_region_id=>wwv_flow_imp.id(27272383079075402)
,p_validation_name=>'Is email'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_comm.is_email(',
'  p_email     => :ATTRIBUTE_VALUE',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_EMAIL''',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'DATA_TYPE'
,p_validation_condition2=>'EMAIL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'ATTRIBUTE_VALUE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27225137385283233)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(27224922474281870)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27225583723283233)
,p_event_id=>wwv_flow_imp.id(27225137385283233)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27863673994256835)
,p_name=>'Process After Changes'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(27272383079075402)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27863757403256836)
,p_event_id=>wwv_flow_imp.id(27863673994256835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.cache_purge_by_page(',
'   p_application => :G_PUB_APP_ID',
'  ,p_page => 0',
');',
''))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14806777327070101)
,p_name=>'Set Edit Mode'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14806855920070102)
,p_event_id=>wwv_flow_imp.id(14806777327070101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(27272383079075402)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region(this.affectedElements[0].id).call("getActions").set("edit", true);',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27274503365075424)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(27272383079075402)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Preferences - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
