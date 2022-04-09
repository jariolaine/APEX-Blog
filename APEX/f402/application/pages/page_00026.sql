prompt --application/pages/page_00026
begin
--   Manifest
--     PAGE: 00026
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Add/Edit Modal Popup Page'
,p_page_mode=>'MODAL'
,p_step_title=>'Add/Edit Modal Popup Page'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(43527387853454697)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220407085704'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41929607444116285)
,p_plug_name=>'Add/Edit Modal Popup Page'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_DYNAMIC_CONTENT'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41876660153408307)
,p_plug_name=>'Right Side'
,p_parent_plug_id=>wwv_flow_api.id(41929607444116285)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475523710518195)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>11
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41876700219408308)
,p_plug_name=>'Left Side'
,p_parent_plug_id=>wwv_flow_api.id(41929607444116285)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-right-none'
,p_plug_template=>wwv_flow_api.id(8475523710518195)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'padding-right-none'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41934854344116299)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41935248402116299)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(41934854344116299)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41936816891116303)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(41934854344116299)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P26_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41937289446116303)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(41934854344116299)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P26_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41937643384116303)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(41934854344116299)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P26_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(24943011266671411)
,p_branch_name=>'Go to Page 25'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:26::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24942445401671405)
,p_name=>'P26_CONTENT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(41876700219408308)
,p_item_source_plug_id=>wwv_flow_api.id(41929607444116285)
,p_source=>'CONTENT_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41929986176116286)
,p_name=>'P26_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41876700219408308)
,p_item_source_plug_id=>wwv_flow_api.id(41929607444116285)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41930304194116292)
,p_name=>'P26_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(41876660153408307)
,p_item_source_plug_id=>wwv_flow_api.id(41929607444116285)
,p_item_default=>'1'
,p_prompt=>'Status'
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Enable or disable link.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'0'
,p_attribute_05=>'Disabled'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41930737748116295)
,p_name=>'P26_DISPLAY_SEQ'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41876660153408307)
,p_item_source_plug_id=>wwv_flow_api.id(41929607444116285)
,p_item_default=>'#OWNER#.blog_cm.get_modal_page_seq'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Display Seq'
,p_source=>'DISPLAY_SEQ'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Link display sequence.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41931552108116295)
,p_name=>'P26_CONTENT_DESC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(41876700219408308)
,p_item_source_plug_id=>wwv_flow_api.id(41929607444116285)
,p_prompt=>'Description'
,p_source=>'CONTENT_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>256
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41931921805116295)
,p_name=>'P26_CONTENT_HTML'
,p_source_data_type=>'CLOB'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(41876700219408308)
,p_item_source_plug_id=>wwv_flow_api.id(41929607444116285)
,p_prompt=>'Content Html'
,p_source=>'CONTENT_HTML'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>60
,p_cMaxlength=>32700
,p_cHeight=>20
,p_field_template=>wwv_flow_api.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'Y'
,p_attribute_05=>'top'
,p_attribute_06=>'4'
,p_attribute_09=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(64761748434771401)
,p_name=>'P26_SHOW_CHANGED_ON'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(41876660153408307)
,p_item_source_plug_id=>wwv_flow_api.id(41929607444116285)
,p_item_default=>'1'
,p_prompt=>'Show Last Modified Date'
,p_source=>'SHOW_CHANGED_ON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Include last modified date after content. '
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'0'
,p_attribute_05=>'Disabled'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41938421768116304)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(41929607444116285)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Add/Edit Modal Popup Page'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(41938017733116304)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(41929607444116285)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Add/Edit Modal Popup Page'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
