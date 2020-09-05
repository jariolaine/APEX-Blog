prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Add/Edit Link'
,p_alias=>'LINK-PROPERTIES'
,p_page_mode=>'MODAL'
,p_step_title=>'Link Properties'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(4073365241705286)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200701114131'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6814521408894774)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6836938600100844)
,p_plug_name=>'Link Properties'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>0
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_LINKS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6846441506100854)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6814521408894774)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6848058635100856)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6814521408894774)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P18_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6847268801100855)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6814521408894774)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P18_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6847626032100855)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6814521408894774)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P18_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4028380161368801)
,p_name=>'P18_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4028933739368807)
,p_name=>'P18_DISPLAY_SEQ'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.get_link_seq(',
'  p_link_group_id => :P18_LINK_GROUP_ID',
')'))
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Sequency'
,p_source=>'DISPLAY_SEQ'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4029055021368808)
,p_name=>'P18_LINK_GROUP_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_source=>'LINK_GROUP_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4029138969368809)
,p_name=>'P18_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>512
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4029280696368810)
,p_name=>'P18_LINK_DESC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_prompt=>'Description'
,p_source=>'LINK_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4029320640368811)
,p_name=>'P18_LINK_URL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_prompt=>'URL'
,p_source=>'LINK_URL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1024
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'URL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6840581208100849)
,p_name=>'P18_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_default=>'1'
,p_prompt=>'Status'
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'IS_ACTIVE'
,p_lov=>'.'||wwv_flow_api.id(8819403626737334)||'.'
,p_tag_css_classes=>'z-switch'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_required_patch=>wwv_flow_api.id(24687510906079791)
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
,p_item_comment=>'Considere use switch in future. APEX 19.2 switch has bug: off value can''t be zero (0)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22957548391076032)
,p_name=>'P18_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(6836938600100844)
,p_item_source_plug_id=>wwv_flow_api.id(6836938600100844)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>16000
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(18443448266293031)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6846441506100854)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(18443540061293032)
,p_event_id=>wwv_flow_api.id(18443448266293031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6814318057894772)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(6836938600100844)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Link Properties'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26581851606331647)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Purge Public Application Cache'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.cache_purge_by_page(',
'   p_application => :G_PUB_APP_ID',
'  ,p_page => 10',
');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24908122539771820)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog Create'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6848058635100856)
,p_process_success_message=>'Link created.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26969493438257322)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog Update'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6847626032100855)
,p_process_success_message=>'Link updated.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26969597375257323)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Dialog Clode Delete'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6847268801100855)
,p_process_success_message=>'Link deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6848831750100856)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(6836938600100844)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Link Properties'
);
wwv_flow_api.component_end;
end;
/
