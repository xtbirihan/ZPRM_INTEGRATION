FUNCTION zrt_006_wallet_sum_update.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  PERFORM wallet_sum_update.

ENDFUNCTION.
FORM wallet_sum_update.

  DATA: lt_wallet_header TYPE zrt_006_tt_wlt_h.
  SELECT dealer_id,
         werks,
         wallet_balance
    FROM zrt_006_wallet_sum_01
    INTO CORRESPONDING FIELDS OF TABLE @lt_wallet_header.

  IF  lt_wallet_header IS NOT INITIAL.
    MODIFY zrt_006_t_wlt_h FROM TABLE lt_wallet_header.
    COMMIT WORK AND WAIT.
  ENDIF.

ENDFORM.
