FUNCTION zrt_006_create_wallet.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(WALLETDATA) TYPE  ZRT_006_T_WLT_I
*"  EXPORTING
*"     VALUE(EV_TRANSACTION_NO) TYPE  ZRT_006_T_WLT_I-TRANSACTION_NO
*"  TABLES
*"      RETURN STRUCTURE  BAPIRET2 OPTIONAL
*"----------------------------------------------------------------------

*  walletdata-slip_number
  CLEAR: gv_dummy.
  IF walletdata-dealer_id IS INITIAL.
    MESSAGE e017(zrt_006) INTO gv_dummy.
    PERFORM sys_add_bapiret2 TABLES return.
    RETURN.
  ENDIF.
  SELECT SINGLE COUNT( * ) FROM zrt_006_t_prm WHERE dealer_id = @walletdata-dealer_id.
  IF sy-subrc NE 0.
    MESSAGE e011(zrt_006) INTO gv_dummy WITH walletdata-dealer_id 'Not Found!'.
    PERFORM sys_add_bapiret2 TABLES return.
    RETURN.
  ENDIF.
  IF walletdata-amount IS INITIAL.
    MESSAGE e013(zrt_006) INTO gv_dummy.
    PERFORM sys_add_bapiret2 TABLES return.
    RETURN.
  ENDIF.
  IF walletdata-waerk NE 'SAR'.
    MESSAGE e014(zrt_006) INTO gv_dummy.
    PERFORM sys_add_bapiret2 TABLES return.
    RETURN.
  ENDIF.
  IF walletdata-transaction_date IS INITIAL.
    MESSAGE e015(zrt_006) INTO gv_dummy.
    PERFORM sys_add_bapiret2 TABLES return.
    RETURN.
  ENDIF.

  IF walletdata-slip_number IS INITIAL AND walletdata-transaction_type NE '02'.
    MESSAGE e006(zrt_006) INTO gv_dummy.
    PERFORM sys_add_bapiret2 TABLES return.
    RETURN.
  ENDIF.

  walletdata-mandt  = sy-mandt.
  walletdata-statu  = '01'.
  walletdata-creation_date        = sy-datum.
  walletdata-creation_time        = sy-uzeit.
  walletdata-created_by           = sy-uname.
  walletdata-last_changed_date    = sy-datum.
  walletdata-last_changed_time    = sy-uzeit.
  walletdata-last_changed_by      = sy-uname.

  CALL FUNCTION 'GUID_CREATE'
    IMPORTING
      ev_guid_32 = walletdata-transaction_no.

  ev_transaction_no = walletdata-transaction_no .

  IF walletdata-transaction_type EQ '01'.
    walletdata-sign = '+'.
  ENDIF.

  PERFORM get_domain_value USING 'ZRT_006_D_TR_TYPE' walletdata-transaction_type CHANGING walletdata-transaction_type_text.
  PERFORM get_domain_value USING 'ZRT_006_D_SIGN'    walletdata-sign CHANGING walletdata-sign_text.

  MODIFY zrt_006_t_wlt_i FROM walletdata.

  CALL FUNCTION 'ZRT_006_WALLET_SUM_UPDATE'.


*  CALL FUNCTION 'BAPI_TRANSACTION_COMMIT' DESTINATION 'NONE'
*   EXPORTING
*     WAIT          = abap_true.


  MESSAGE s018(zrt_006) INTO gv_dummy.
  PERFORM sys_add_bapiret2 TABLES return.

  MESSAGE s019(zrt_006) INTO gv_dummy WITH walletdata-transaction_no.
  PERFORM sys_add_bapiret2 TABLES return.

ENDFUNCTION.
FORM get_domain_value USING pv_domain pv_value CHANGING pv_text.
  DATA: lt_dd007 TYPE STANDARD TABLE OF dd07v.

  IF pv_value IS INITIAL.
    RETURN.
  ENDIF.
  CALL FUNCTION 'DD_DOMVALUES_GET'
    EXPORTING
      domname        = pv_domain
      text           = 'X'
      langu          = 'E'
    TABLES
      dd07v_tab      = lt_dd007
    EXCEPTIONS
      wrong_textflag = 1
      OTHERS         = 2.

  READ TABLE lt_dd007 ASSIGNING FIELD-SYMBOL(<fs_dd007>) WITH KEY domvalue_l = pv_value .
  pv_text = <fs_dd007>-ddtext.
ENDFORM.
