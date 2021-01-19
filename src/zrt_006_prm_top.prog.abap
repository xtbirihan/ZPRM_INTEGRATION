*&---------------------------------------------------------------------*
*& Include zrt_006_prm_top
*&---------------------------------------------------------------------*
    DATA: BEGIN OF gs_scr.
    DATA: BEGIN OF 1903.
    DATA: ucomm            TYPE sy-ucomm.
    DATA: error            TYPE char1.
    DATA: alv              TYPE zrt_006_tt_prm.
    DATA: r_alv            TYPE REF TO cl_salv_table.
    DATA: r_columns        TYPE REF TO cl_salv_columns_table.
    DATA: r_column         TYPE REF TO cl_salv_column.
    DATA: r_events         TYPE REF TO cl_salv_events_table.
    DATA: r_selections     TYPE REF TO cl_salv_selections.
    DATA: END OF 1903.
    DATA: END OF gs_scr.
*----------------------------------------------------------------------*
*       CLASS lcl_handle_events DEFINITION
*----------------------------------------------------------------------*
    CLASS lcl_handle_events DEFINITION.
      PUBLIC SECTION.
*    METHODS: constructor IMPORTING mo_scr .
        METHODS: on_link_click  FOR EVENT link_click OF cl_salv_events_table
          IMPORTING row column,

          on_user_command FOR EVENT added_function OF cl_salv_events
            IMPORTING e_salv_function.
      PRIVATE SECTION.
        METHODS: show_alv IMPORTING VALUE(iv_tanim) TYPE text70
                          CHANGING  ct_table        TYPE table.

    ENDCLASS.                    "lcl_handle_events DEFINITION

    DATA: event_handler TYPE REF TO lcl_handle_events.
*----------------------------------------------------------------------*
*       CLASS lcl_handle_events IMPLEMENTATION
*----------------------------------------------------------------------*
    CLASS lcl_handle_events IMPLEMENTATION.
      METHOD on_link_click.
        CASE column.
          WHEN 'STATUS'.
            READ TABLE gs_scr-1903-alv INTO DATA(ls_alv) INDEX row.
            IF sy-subrc EQ 0.
              DATA(lt_messages) = ls_alv-t_messages.
              IF lt_messages IS NOT INITIAL.
                me->show_alv(  EXPORTING iv_tanim = TEXT-003
                               CHANGING ct_table = lt_messages ).

              ENDIF.
            ENDIF.
*
        ENDCASE.

      ENDMETHOD.                    "on_link_click

      METHOD on_user_command.
*        DATA: lt_rows TYPE salv_t_row.
        DATA: lt_modify      TYPE STANDARD TABLE OF zrt_006_t_prm,
              ls_modify      TYPE zrt_006_t_prm,
              lv_status_text TYPE char20.

        CASE e_salv_function.
          WHEN '&CREATE'.
            DATA(lt_rows) = gs_scr-1903-r_selections->get_selected_rows( ).
            IF lt_rows IS INITIAL.
              MESSAGE i002(zrt_006).
              RETURN.
            ENDIF.
            LOOP AT lt_rows INTO DATA(ls_rows).
              READ TABLE gs_scr-1903-alv ASSIGNING FIELD-SYMBOL(<fs_alv>) INDEX ls_rows.
              DATA(lv_proces) = <fs_alv>-process.
              TRY.
                  DATA(lt_bp) = NEW zcl_rt_006_prm( )->process_bp_create( CHANGING cs_bp = <fs_alv> ).
                  LOOP AT lt_bp ASSIGNING FIELD-SYMBOL(<fs_bp>) WHERE type CA 'EAX'.
                    EXIT.
                  ENDLOOP.
                  IF sy-subrc EQ 0.
                    <fs_alv>-status = icon_action_fault.
                    <fs_alv>-t_messages = lt_bp.
                    lv_status_text = TEXT-010.
                  ELSE.
                    lv_status_text = TEXT-011.
                    LOOP AT lt_bp ASSIGNING <fs_bp> WHERE type EQ 'S'.
                      EXIT.
                    ENDLOOP.
                    IF sy-subrc EQ 0.
                      SELECT SINGLE partner, partner_guid FROM but000
                             INTO (@<fs_alv>-partner, @<fs_alv>-partner_guid )
                              WHERE partner = @<fs_bp>-object_key.
                    ENDIF.
*
                    IF <fs_alv>-process    = 'I'.
                      <fs_alv>-creationdate   = sy-datum.
                      <fs_alv>-creationtime   = sy-uzeit.
                      <fs_alv>-updatedate     = sy-datum.
                      <fs_alv>-updatetime     = sy-uzeit.
                    ELSEIF <fs_alv>-process  = 'U'.
                      <fs_alv>-updatedate     = sy-datum.
                      <fs_alv>-updatetime     = sy-uzeit.
                    ENDIF.
                    <fs_alv>-status     = icon_action_success.
                    <fs_alv>-created    = icon_okay.
                    <fs_alv>-process    = 'U'.
                    <fs_alv>-t_messages = lt_bp.
                  ENDIF.
                  ls_modify = CORRESPONDING #(  <fs_alv> ).
                  ls_modify-mandt = sy-mandt.
                  APPEND ls_modify TO lt_modify.
                  CLEAR: lt_bp, ls_modify.
                  CLEAR: lv_proces, lv_status_text.
                CATCH zcx_rt_006_prm INTO DATA(lo_rt_006_prm).
                  "update message later
              ENDTRY.
            ENDLOOP.
        ENDCASE.
        IF lt_modify IS NOT INITIAL.
          MODIFY zrt_006_t_prm FROM TABLE lt_modify.
          COMMIT WORK AND WAIT.
        ENDIF.
        IF sy-batch IS INITIAL.
          gs_scr-1903-r_alv->refresh( ).
        ENDIF.

      ENDMETHOD.                    "on_user_command

      METHOD show_alv.
        DATA: lo_alv   TYPE REF TO cl_salv_table,
              lv_tanim TYPE text70.
        TRY.
            cl_salv_table=>factory(
              IMPORTING
                r_salv_table = lo_alv
              CHANGING
                t_table      = ct_table ).
            DATA(lv_line)  = lines(  ct_table ).
            lv_tanim  = iv_tanim && | --> | && |{ lv_line } | && TEXT-002.
            DATA(display_settings) =  lo_alv->get_display_settings( ).
            display_settings->set_striped_pattern( if_salv_c_bool_sap=>true ).
            display_settings->set_list_header( lv_tanim ).
            DATA(lo_columns) = lo_alv->get_columns( ).
            lo_columns->set_optimize( abap_true ).
            lo_alv->display( ).
          CATCH cx_salv_msg.
        ENDTRY.
      ENDMETHOD.

    ENDCLASS.                    "lcl_handle_events IMPLEMENTATION
