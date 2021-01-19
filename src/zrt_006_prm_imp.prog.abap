*&---------------------------------------------------------------------*
*& Include zrt_006_prm_imp
*&---------------------------------------------------------------------*
CLASS lcl_rt_006_prm_01 IMPLEMENTATION.

  METHOD fetch_data.

*    DATA: lt_modify TYPE STANDARD TABLE OF zssi_fi_03_t_01.
*    DATA: ls_modify TYPE zssi_fi_03_t_01.
*    DATA: lt_log    TYPE STANDARD TABLE OF zssi_fi_04_t_03.

*    IF p_guid IS NOT INITIAL.
*      APPEND VALUE PLMT_RANGES_ROLE_WA( sign = 'I'
*                                        option = 'EQ'
*                                        low   )
*    ENDIF.

    SELECT z1~*, b~partner, b~partner_guid,
                 CASE WHEN b~partner <> @space THEN 'U'
                 ELSE 'I'
                 END AS process,
                 CASE WHEN b~partner <> @space THEN '@0V@' "ICON_OKAY
                 ELSE '@LD@'  "ICON_CREATE_POSITION
                 END AS created
                FROM  zrt_006_t_prm AS z1
                LEFT OUTER JOIN but000 AS b ON z1~dealer_id = b~bpext
                INTO CORRESPONDING FIELDS OF TABLE @et_data
                WHERE z1~dealer_id    in @s_dealer
                  AND z1~arrival_date IN @s_arrv.
    IF sy-subrc NE '0'.
      RAISE EXCEPTION TYPE zcx_rt_006_prm
        EXPORTING
          id = 'ZRT_006'
          no = '001'.
      RETURN.
*      LEAVE LIST-PROCESSING.
    ENDIF.

    me->modify_data(
      CHANGING
        et_data    = et_data ).

    IF sy-batch NE 'X'.
      me->initialize_alv( CHANGING t_table = et_data ).
      me->display_alv( ).
    ELSE.
*      LOOP AT gs_scr-1903-alv ASSIGNING FIELD-SYMBOL(<fs_alv>).
*        DATA(lt_bp) = NEW zcl_ssi_fi_04_01( )->process_bp_create( is_bp = <fs_alv> ).
*        LOOP AT lt_bp ASSIGNING FIELD-SYMBOL(<fs_bp>) WHERE type CA 'EAX'.
*          EXIT.
*        ENDLOOP.
*        IF sy-subrc EQ 0.
*          <fs_alv>-status = icon_action_fault.
*          <fs_alv>-t_messages = lt_bp.
*        ELSE.
*          LOOP AT lt_bp ASSIGNING <fs_bp> WHERE type EQ 'S'.
*            EXIT.
*          ENDLOOP.
*          IF sy-subrc EQ 0.
*            SELECT SINGLE partner, partner_guid FROM but000
*                   INTO (@<fs_alv>-partner, @<fs_alv>-partner_guid )
*                    WHERE partner = @<fs_bp>-object_key.
*          ENDIF.
*          IF <fs_alv>-process    = 'I'.
*            <fs_alv>-creationdate   = sy-datum.
*            <fs_alv>-creationtime   = sy-uzeit.
*            <fs_alv>-chancedate     =  sy-datum.
*            <fs_alv>-chancetime     =  sy-uzeit.
*            <fs_alv>-username       =  sy-uname.
*          ELSEIF <fs_alv>-process = 'U'.
*            <fs_alv>-chancedate     =  sy-datum.
*            <fs_alv>-chancetime     =  sy-uzeit.
*            <fs_alv>-username       =  sy-uname.
*          ENDIF.
*
*          ls_modify = CORRESPONDING #(  <fs_alv> ).
*          ls_modify-mandt = sy-mandt.
*          APPEND ls_modify TO lt_modify.
*
*          <fs_alv>-status     = icon_action_success.
*          <fs_alv>-created    = icon_okay.
*          <fs_alv>-process    = 'U'.
*          <fs_alv>-t_messages = lt_bp.
*
*          APPEND VALUE zssi_fi_04_t_03( mandt      = sy-mandt
*                                        retailerid = <fs_alv>-retailerid
*                                        partner    = <fs_alv>-partner
*                                        username   = sy-uname
*                                        udate      = sy-datum
*                                        utime      = sy-uzeit ) TO lt_log.
*        ENDIF.
*        CLEAR: lt_bp, ls_modify.
*      ENDLOOP.

*      IF lt_modify IS NOT INITIAL.
*        MODIFY zssi_fi_03_t_01 FROM TABLE lt_modify.
*        COMMIT WORK AND WAIT.
*      ENDIF.
*      IF lt_log IS NOT INITIAL.
*        MODIFY zssi_fi_04_t_03 FROM TABLE lt_log.
*        COMMIT WORK AND WAIT.
*      ENDIF.
*      me->initialize_alv( CHANGING t_table = et_data ).
*      me->display_alv( ).
    ENDIF.
  ENDMETHOD.

  METHOD modify_data.
    SELECT * FROM zrt_006_t_werks INTO TABLE @DATA(lt_werks) ORDER BY dealer_id.
    LOOP AT et_data ASSIGNING FIELD-SYMBOL(<fs_data>).
      READ TABLE lt_werks ASSIGNING FIELD-SYMBOL(<fs_werks>) WITH KEY dealer_id = <fs_data>-dealer_id BINARY SEARCH.
      IF sy-subrc EQ 0.
        <fs_data>-werks = <fs_werks>-werks.
        <fs_data>-partner = |{ <fs_werks>-werks  ALPHA = IN }|.
      ENDIF.

    ENDLOOP.
    gs_scr-1903-alv =  et_data.
    SORT gs_scr-1903-alv BY dealer_id.
  ENDMETHOD.

  METHOD display_alv.
    gs_scr-1903-r_alv->display( ).
  ENDMETHOD.

  METHOD display_settings.
    DATA display_settings TYPE REF TO cl_salv_display_settings.
    DATA: lv_tanim TYPE text70.
    DATA: lv_line TYPE i.
    lv_line  = lines(  gs_scr-1903-alv ).
    lv_tanim = TEXT-001 && | --> | && |{ lv_line } | && TEXT-002.

    display_settings =  gs_scr-1903-r_alv->get_display_settings( ).
    display_settings->set_striped_pattern( if_salv_c_bool_sap=>true ).
    display_settings->set_list_header( lv_tanim ).
  ENDMETHOD.

  METHOD enable_layout_settings.
    DATA layout_settings TYPE REF TO cl_salv_layout.
    DATA layout_key      TYPE salv_s_layout_key.


    layout_settings =  gs_scr-1903-r_alv->get_layout( ).
    layout_key-report = sy-repid.
    layout_settings->set_key( layout_key ).
    layout_settings->set_save_restriction( if_salv_c_layout=>restrict_none ).

    gs_scr-1903-r_selections =  gs_scr-1903-r_alv->get_selections( ).
    gs_scr-1903-r_selections->set_selection_mode( if_salv_c_selection_mode=>row_column ).
  ENDMETHOD.

  METHOD hide_client_column.
    DATA not_found TYPE REF TO cx_salv_not_found.
    TRY.
        gs_scr-1903-r_column =  gs_scr-1903-r_columns->get_column( 'T_MESSAGES' ).
        gs_scr-1903-r_column->set_visible( if_salv_c_bool_sap=>false ).
      CATCH cx_salv_not_found INTO not_found.
        " error handling
    ENDTRY.

  ENDMETHOD.

  METHOD initialize_alv.
    DATA message   TYPE REF TO cx_salv_msg.

    TRY.
        cl_salv_table=>factory(
        IMPORTING
          r_salv_table =  gs_scr-1903-r_alv
        CHANGING
          t_table      =  gs_scr-1903-alv ).

        gs_scr-1903-r_columns =  gs_scr-1903-r_alv->get_columns( ).
        me->enable_layout_settings( ).
        me->optimize_column_width( ).
        me->hide_client_column( ).
        me->set_icon( ).
        me->set_column_names( ).
        me->set_toolbar( ).
        me->display_settings( ).
        me->set_hotspot_click( ).

        " ...
        " PERFORM setting_n.
      CATCH cx_salv_msg INTO message.
        " error handling
    ENDTRY.
  ENDMETHOD.

  METHOD optimize_column_width.
    gs_scr-1903-r_columns->set_optimize( ).
  ENDMETHOD.

  METHOD set_column_names.
*  DATA not_found TYPE REF TO cx_salv_not_found.
*
*  TRY.
*      gr_column = gr_columns->get_column( 'WAVWR' ).
*      gr_column->set_short_text( 'Maliyet' ).
*      gr_column->set_medium_text( 'Maliyet' ).
*      gr_column->set_long_text( 'Maliyet' ).
*    CATCH cx_salv_not_found INTO not_found.
*      " error handling
*  ENDTRY.
  ENDMETHOD.

  METHOD set_hotspot_click.
    gs_scr-1903-r_events =  gs_scr-1903-r_alv->get_event( ).
    CREATE OBJECT event_handler.
    SET HANDLER event_handler->on_link_click   FOR  gs_scr-1903-r_events.
    SET HANDLER event_handler->on_user_command FOR  gs_scr-1903-r_events.
  ENDMETHOD.

  METHOD set_icon.

    DATA: lr_columns TYPE REF TO cl_salv_columns_table,
          lr_column  TYPE REF TO cl_salv_column_table.
*

    TRY.
        lr_columns =  gs_scr-1903-r_alv->get_columns( ).
        lr_column ?= lr_columns->get_column( 'CREATED' ).
        lr_column->set_icon( if_salv_c_bool_sap=>true ).
      CATCH cx_salv_not_found INTO DATA(lo_not_found).  "#EC NO_HANDLER
        DATA(lv_msg) = lo_not_found->get_text( ).
        MESSAGE lv_msg TYPE 'E'.
    ENDTRY.

    TRY.
        lr_column ?= lr_columns->get_column( 'STATUS' ).
        lr_column->set_icon( if_salv_c_bool_sap=>true ).
      CATCH cx_salv_not_found INTO lo_not_found.        "#EC NO_HANDLER
        lv_msg = lo_not_found->get_text( ).
        MESSAGE lv_msg TYPE 'E'.
    ENDTRY.

    TRY.
        lr_column ?= lr_columns->get_column( 'STATUS' ).
        lr_column->set_cell_type( if_salv_c_cell_type=>hotspot ).
      CATCH cx_salv_not_found INTO lo_not_found.        "#EC NO_HANDLER
        lv_msg = lo_not_found->get_text( ).
        MESSAGE lv_msg TYPE 'E'.
    ENDTRY.

  ENDMETHOD.

  METHOD set_toolbar.
    DATA functions TYPE REF TO cl_salv_functions_list.
    functions =  gs_scr-1903-r_alv->get_functions( ).
    functions->set_all( ).

    gs_scr-1903-r_alv->set_screen_status(
     pfstatus      = 'STANDARD'
     report        = sy-repid
     set_functions =  gs_scr-1903-r_alv->c_functions_all ).
  ENDMETHOD.
ENDCLASS.
