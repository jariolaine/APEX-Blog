prompt --application/pages/page_00051
begin
--   Manifest
--     PAGE: 00051
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>51
,p_name=>'Add/Edit Link'
,p_alias=>'LINK-PROPERTIES'
,p_page_mode=>'MODAL'
,p_step_title=>'Link Properties'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(4073365241705286)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20240408061209'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45211569698046322)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45233986889252392)
,p_plug_name=>'Link Properties'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>0
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_LINKS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38397603397151551)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(45211569698046322)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38398002144151551)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(45211569698046322)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P51_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38398436178151551)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(45211569698046322)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P51_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38398800674151552)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(45211569698046322)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P51_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38399528335151552)
,p_name=>'P51_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38399958146151553)
,p_name=>'P51_LINK_GROUP_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_source=>'LINK_GROUP_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38400395099151553)
,p_name=>'P51_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_default=>'1'
,p_prompt=>'Status'
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_tag_css_classes=>'blog-switch'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'0'
,p_attribute_05=>'Disabled'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38400728866151553)
,p_name=>'P51_DISPLAY_SEQ'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_cm.get_link_seq(',
'  p_link_group_id => :P51_LINK_GROUP_ID',
')'))
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Sequency'
,p_source=>'DISPLAY_SEQ'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_03=>'left'
,p_attribute_04=>'numeric'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38401122438151554)
,p_name=>'P51_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38401503571151554)
,p_name=>'P51_LINK_URL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_prompt=>'URL'
,p_source=>'LINK_URL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'URL'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38401963436151554)
,p_name=>'P51_EXTERNAL_LINK'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_default=>'1'
,p_prompt=>'External Link'
,p_source=>'EXTERNAL_LINK'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Indicates that the link is to an external site.'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Yes'
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38402885057151555)
,p_name=>'P51_TARGET_BLANK'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_default=>'1'
,p_prompt=>'Open link in new tab/window'
,p_source=>'TARGET_BLANK'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Clicking the link will open the link in a new tab/window.'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Yes'
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38403765176151556)
,p_name=>'P51_LINK_DESC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_prompt=>'Description'
,p_source=>'LINK_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38404153858151556)
,p_name=>'P51_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_inline_help_text=>'Enter any comments or notes here. These notes not displayed for public.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39213117623831927)
,p_name=>'P51_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_item_source_plug_id=>wwv_flow_imp.id(45233986889252392)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38409531653151561)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38397603397151551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38410063280151562)
,p_event_id=>wwv_flow_imp.id(38409531653151561)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38407599199151560)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(45233986889252392)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Link Properties'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38407599199151560
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39208375469806974)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Purge Public Application Links Page Cache'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_UTIL'
,p_attribute_04=>'CACHE_PURGE_BY_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>39208375469806974
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38594491166274345)
,p_page_process_id=>wwv_flow_imp.id(39208375469806974)
,p_page_id=>51
,p_name=>'p_application'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'G_PUB_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(39210601201831902)
,p_page_process_id=>wwv_flow_imp.id(39208375469806974)
,p_page_id=>51
,p_name=>'p_page'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>80
,p_value_type=>'STATIC'
,p_value=>'10'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38408763511151561)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38408763511151561
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38407907020151560)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(45233986889252392)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Link Properties'
,p_internal_uid=>38407907020151560
);
wwv_flow_imp.component_end;
end;
/
