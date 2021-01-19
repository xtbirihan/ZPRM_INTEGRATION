FUNCTION zrt_006_wallet_read_entity .
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_TRANSACTION_NO) TYPE  ZRT_006_D_TRANS
*"  EXPORTING
*"     VALUE(WALLETDATA) TYPE  ZRT_006_T_WLT_I
*"  TABLES
*"      RETURN STRUCTURE  BAPIRET2 OPTIONAL
*"----------------------------------------------------------------------
  CLEAR: gv_dummy.
  CASE iv_transaction_no.
    WHEN 'DUMMY'.
      CALL FUNCTION 'GUID_CREATE'
        IMPORTING
          ev_guid_32 = walletdata-transaction_no.

      walletdata-transaction_type = '01'.
      walletdata-dealer_id        = ''.
      walletdata-statu            = '01'.
      walletdata-sign             = '+'.
      walletdata-amount           = 0.
      walletdata-waerk            = 'SAR'.
      walletdata-transaction_date = sy-datum.
      walletdata-slip_number      = ''.
      walletdata-uxfc_01 = 7.


      MESSAGE s012(zrt_006)  INTO gv_dummy. "All records successfully saved.'
      PERFORM sys_add_bapiret2 TABLES return.
    WHEN OTHERS.

      SELECT SINGLE * FROM zrt_006_t_wlt_i
             INTO walletdata
             WHERE transaction_no = iv_transaction_no.
  ENDCASE.

ENDFUNCTION.
*&---------------------------------------------------------------------*
*& Form sys_add_bapiret2
*&---------------------------------------------------------------------*
FORM sys_add_bapiret2  TABLES pt_message   STRUCTURE bapiret2.

  DATA :ls_return    TYPE bapiret2.

  CALL FUNCTION 'FS_BAPI_BAPIRET2_FILL'
    EXPORTING
      type   = sy-msgty
      cl     = sy-msgid
      number = sy-msgno
      par1   = sy-msgv1
      par2   = sy-msgv2
      par3   = sy-msgv3
      par4   = sy-msgv4
    IMPORTING
      return = ls_return.

  APPEND ls_return TO pt_message.

ENDFORM.
