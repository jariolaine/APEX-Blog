prompt --application/pages/page_00021
begin
--   Manifest
--     PAGE: 00021
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>21
,p_name=>'Confirm Link Group Delete'
,p_alias=>'LINK-GROUP-DELETE-CONFIRM'
,p_page_mode=>'MODAL'
,p_step_title=>'Confirm'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(4073365241705286)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230310220631'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(19303429631329496)
,p_name=>'Links to be Deleted'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.title',
'  ,v1.link_desc',
'from #OWNER#.blog_v_all_links v1',
'where v1.link_group_id = :P21_ID',
'order by v1.display_seq'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8519378220518224)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20749380551206602)
,p_query_column_id=>1
,p_column_alias=>'TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Title'
,p_use_as_row_header=>'Y'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19305460519329503)
,p_query_column_id=>2
,p_column_alias=>'LINK_DESC'
,p_column_display_sequence=>2
,p_column_heading=>'Description'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23107718889422614)
,p_plug_name=>'Confirm Link Collection Deletion'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(8471603023518189)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_LINK_GROUPS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'&APP_TEXT$BLOG_CONFIRM_LINK_GROUP_DELETE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45092328064996858)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19319505952423724)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(45092328064996858)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Permanent Delete Link(s)'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19318775281423723)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(45092328064996858)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,21:P20_ID:\&P21_ID.\'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(19362911523013749)
,p_branch_name=>'Record Deleted'
,p_branch_action=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17,RIR::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23107964784422616)
,p_name=>'P21_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(23107718889422614)
,p_item_source_plug_id=>wwv_flow_imp.id(23107718889422614)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23108092674422617)
,p_name=>'P21_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(23107718889422614)
,p_item_source_plug_id=>wwv_flow_imp.id(23107718889422614)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(23109285545422629)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(23107718889422614)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process Form Link Group Delete'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'BLOG_LINK_GROUPS'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(23107819071422615)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(23107718889422614)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Link Group Delete'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
