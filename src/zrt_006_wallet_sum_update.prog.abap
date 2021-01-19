*&---------------------------------------------------------------------*
*& Report zrt_006_wallet_sum_update
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrt_006_wallet_sum_update.


CLASS lcx_t100 DEFINITION INHERITING FROM cx_dynamic_check.
  PUBLIC SECTION.
    INTERFACES if_t100_message.
    METHODS constructor IMPORTING id    TYPE symsgid
                                  no    TYPE symsgno
                                  text1 TYPE csequence OPTIONAL
                                  text2 TYPE csequence OPTIONAL
                                  text3 TYPE csequence OPTIONAL
                                  text4 TYPE csequence OPTIONAL.
    DATA text1 TYPE c LENGTH 50.
    DATA text2 TYPE c LENGTH 50.
    DATA text3 TYPE c LENGTH 50.
    DATA text4 TYPE c LENGTH 50.
ENDCLASS.

CLASS lcx_t100 IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    me->text1 = text1.
    me->text2 = text2.
    me->text3 = text3.
    me->text4 = text4.
    if_t100_message~t100key-msgid = id.
    if_t100_message~t100key-msgno = no.
    if_t100_message~t100key-attr1 = 'TEXT1'.
    if_t100_message~t100key-attr2 = 'TEXT2'.
    if_t100_message~t100key-attr3 = 'TEXT3'.
    if_t100_message~t100key-attr4 = 'TEXT4'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO lcl_main.
    METHODS: fetch_data RETURNING VALUE(rt_wallet_header) TYPE zrt_006_tt_wlt_h
                        RAISING   lcx_t100.


  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS: display_alv EXPORTING et_wallet_header TYPE zrt_006_tt_wlt_h.
ENDCLASS.
CLASS lcl_main IMPLEMENTATION.

  METHOD create.
    r_result = NEW #( ).
  ENDMETHOD.
  METHOD fetch_data.
    DATA: ls_wallet TYPE zrt_006_t_wlt_h.
    SELECT dealer_id,
           werks,
           wallet_balance
      FROM zrt_006_wallet_sum_01
      INTO CORRESPONDING FIELDS OF TABLE @rt_wallet_header.

    IF sy-subrc NE 0.
      RAISE EXCEPTION TYPE lcx_t100
        EXPORTING
          id = 'ZSD'
          no = '001'.
    ENDIF.
    ls_wallet-mandt = sy-mandt.
    MODIFY rt_wallet_header FROM ls_wallet TRANSPORTING mandt WHERE mandt IS INITIAL.
    IF sy-batch IS INITIAL.
      me->display_alv( IMPORTING et_wallet_header = rt_wallet_header ).
    ELSE.
      MODIFY zrt_006_t_wlt_h FROM TABLE rt_wallet_header.
      COMMIT WORK AND WAIT.
      me->display_alv( IMPORTING et_wallet_header = rt_wallet_header ).
    ENDIF.
  ENDMETHOD.

  METHOD display_alv.
    DATA: lr_alv          TYPE REF TO cl_salv_table.
    TRY.
        CALL METHOD cl_salv_table=>factory
          EXPORTING
            list_display = if_salv_c_bool_sap=>false
          IMPORTING
            r_salv_table = lr_alv
          CHANGING
            t_table      = et_wallet_header.
        ##NO_HANDLER.
      CATCH cx_salv_msg .
    ENDTRY.
    CALL METHOD lr_alv->display.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.
  TRY.
      lcl_main=>create( )->fetch_data( ).
    CATCH lcx_t100 INTO DATA(lo_ref).
      MESSAGE lo_ref TYPE 'E'.
  ENDTRY.
