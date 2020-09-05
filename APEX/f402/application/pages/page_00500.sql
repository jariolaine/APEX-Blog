prompt --application/pages/page_00500
begin
--   Manifest
--     PAGE: 00500
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
 p_id=>500
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Process Succeeded'
,p_page_mode=>'MODAL'
,p_step_title=>'Process Succeeded'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8928435152589675)
,p_step_template=>wwv_flow_api.id(8454173643518178)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200511181546'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19256943246964354)
,p_plug_name=>'Process Suceeded'
,p_region_css_classes=>'u-textCenter u-bold'
,p_icon_css_classes=>'fa-check-circle'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--success:t-Alert--removeHeading'
,p_plug_template=>wwv_flow_api.id(8471603023518189)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'sys.htp.p(apex_lang.message(:REQUEST));'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19257888570965927)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24794075099170242)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(19257888570965927)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19019553214830219)
,p_computation_sequence=>10
,p_computation_item=>'G_USER_DATE_TIME_FORMAT'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'SET_ITEM_EQUAL_THIS_PREFERENCE'
,p_computation=>'BLOG_DISPLAY_DATE_FORMAT'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19019913731830223)
,p_computation_sequence=>20
,p_computation_item=>'G_USER_INPUT_DATE_TIME_FORMAT'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'SET_ITEM_EQUAL_THIS_PREFERENCE'
,p_computation=>'BLOG_INPUT_DATE_FORMAT'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24472066278361540)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(24794075099170242)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24472100297361541)
,p_event_id=>wwv_flow_api.id(24472066278361540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_api.component_end;
end;
/
