prompt --application/pages/page_01001
begin
--   Manifest
--     PAGE: 01001
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>1001
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Post a Comment'
,p_alias=>'COMMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Leave your comment'
,p_reload_on_submit=>'A'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(65048103982446247)
,p_html_page_header=>'"BLOG_META_ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(7073708623458378)
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_deep_linking=>'N'
,p_rejoin_existing_sessions=>'N'
,p_read_only_when_type=>'ITEM_IS_NULL'
,p_read_only_when=>'P1001_POST_ID'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220402062552'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27990916738607115)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder'
,p_plug_template=>wwv_flow_api.id(6782379920267375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31617719508094013)
,p_plug_name=>'Moderated'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(6777727951267373)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'&APP_TEXT$BLOG_MSG_MODERATE_ENABLED.'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(28281277020489892)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147769743184406827)
,p_plug_name=>'Comment Form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6781372168267375)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_COMMENTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6283058393551656)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27990916738607115)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6283414650551656)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(27990916738607115)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'NEXT'
,p_icon_css_classes=>'fa-send-o'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6283829025551657)
,p_name=>'P1001_POST_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_item_source_plug_id=>wwv_flow_api.id(147769743184406827)
,p_source=>'POST_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6284602764551658)
,p_name=>'P1001_FIRST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_item_source_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Name'
,p_source=>'COMMENT_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>256
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_inline_help_text=>'Enter your name. The name is visible in the comments.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6285517297551658)
,p_name=>'P1001_LAST_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Last Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>256
,p_grid_column_css_classes=>'z-hidden'
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'Field is not for human input. Column CSS class hides item from screen. If field isn''t empty close dialog process is fired before submitting comment.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6286425900551659)
,p_name=>'P1001_EMAIL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>256
,p_display_when=>'#OWNER#.blog_util.get_attribute_value(''G_APP_EMAIL'') is not null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_api.id(6854643778267413)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_api.id(33703543205326403)
,p_inline_help_text=>'Provide your email address if you wish receive followup notification when new reply is posted. <br>Your email address will not be published or shared.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
,p_item_comment=>'Application email must be set and feature "Sent email notification of new comments" enabled before users can subscribe to get email notifications'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6289109968551661)
,p_name=>'P1001_COMMENT'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Comment'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_css_classes=>'padding-top-none'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_inline_help_text=>'You can use <strong>&lt;b&gt;</strong>, <strong>&lt;i&gt;</strong>, <strong>&lt;u&gt;</strong> and <strong>&lt;code&gt;</strong> HTML tags. Example, wrap program code to &lt;code&gt; &lt;&#x2f;code&gt; tag so it is easier to read.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_item_comment=>'Item visible to user for entering comment.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6290415932551662)
,p_name=>'P1001_QUESTION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Answer to'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_FI.JARIS.MATH_QUESTION_FIELD'
,p_cMaxlength=>20
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_protection_level=>'I'
,p_inline_help_text=>'Please answer this simple question before you submit comment.'
,p_attribute_01=>'1'
,p_attribute_02=>'32'
,p_attribute_03=>'8'
,p_attribute_04=>'64'
,p_attribute_05=>'P1001_ANSWER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26381104883542604)
,p_name=>'P1001_ANSWER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6433141607894071)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26385749217542650)
,p_name=>'P1001_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_item_source_plug_id=>wwv_flow_api.id(147769743184406827)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26968556051257313)
,p_name=>'P1001_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_item_source_plug_id=>wwv_flow_api.id(147769743184406827)
,p_item_default=>'1'
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'If comments need to be moderated, computation set value to zero (0). Else use default value 1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31617298354094008)
,p_name=>'P1001_COMMENT_HTML'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_item_source_plug_id=>wwv_flow_api.id(147769743184406827)
,p_source=>'BODY_HTML'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'This item is used on automatic form processing process. After submit computation stores formatted comment to item.'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(31616932627094005)
,p_computation_sequence=>10
,p_computation_item=>'P1001_COMMENT_HTML'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_comm.format_comment(',
'  p_comment => :P1001_COMMENT',
')',
''))
,p_computation_comment=>'Format comment and store result to item that is used automatic form processing process'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(31617467994094010)
,p_computation_sequence=>20
,p_computation_item=>'P1001_IS_ACTIVE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
,p_required_patch=>wwv_flow_api.id(28281277020489892)
,p_computation_comment=>'If comments need to be moderated, set is_active value to zero (0)'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26384992359542642)
,p_validation_name=>'Validate comment'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_comm.validate_comment(',
'  p_comment => :P1001_COMMENT_HTML',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(6289109968551661)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'Validate formatted comment length and HTML. Return error text if validation fails'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(37645903401287125)
,p_validation_name=>'Validate email'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_comm.is_email(',
'  p_email     => :P1001_EMAIL',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_EMAIL''',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P1001_EMAIL'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_associated_item=>wwv_flow_api.id(6286425900551659)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2754144221851926)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6283058393551656)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2754217615851927)
,p_event_id=>wwv_flow_api.id(2754144221851926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26968482248257312)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(147769743184406827)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Leave Reply'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6283414650551656)
,p_process_comment=>'Save comment'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36228428060379743)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set unread flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_comm.flag_comment(',
'   p_comment_id => :P1001_ID',
'  ,p_flag       => ''UNREAD''',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_comment=>'Mark new comment as unread'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36228592519379744)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set moderate flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_comm.flag_comment(',
'   p_comment_id => :P1001_ID',
'  ,p_flag       => ''MODERATE''',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(28281277020489892)
,p_process_comment=>'Mark new comment to be moderated if feature "Comments need to moderated" ia enabled'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26970862080257336)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Notify blogger'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_comm.new_comment_notify(',
'   p_post_id         => :P1001_POST_ID',
'  ,p_app_name        => :G_APP_NAME',
'  ,p_email_template  => ''BLOG_NEW_COMMENT_NOTIFY''',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_comment=>'Notify blogger about new comment for post'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31248826734982928)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Subscribe user'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_comm.subscribe(',
'   p_post_id  => :P1001_POST_ID',
'  ,p_email    => :P1001_EMAIL',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P1001_EMAIL'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_required_patch=>wwv_flow_api.id(33703543205326403)
,p_process_comment=>'Save user email for notification for new replies to comment if user provides email address and feature "Sent email notification of new comments" is enabled'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31247931198982919)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear items'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_comment=>'At least question answer item saves session state to disk. Clear all page items session state.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31617539210094011)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Comment will be moderated'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Thanks for commenting. Your comment will be published after author has review it.'
,p_required_patch=>wwv_flow_api.id(28281277020489892)
,p_process_comment=>'Comments are moderated'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26385226571542645)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Comment approved'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Thanks for commenting.'
,p_required_patch=>-wwv_flow_api.id(28281277020489892)
,p_process_comment=>'Comments aren''t moderated'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26385626116542649)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(147769743184406827)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Leave Reply'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26385135588542644)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'If Hidden Item P1001_LAST_NAME not Null'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P1001_LAST_NAME'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_comment=>'Close dialog if not for human input field is not null'
);
wwv_flow_api.component_end;
end;
/
