FUNCTION zrt_006_messages.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_DEALER_ID) TYPE  ZRT_006_T_PRM-DEALER_ID
*"  EXPORTING
*"     VALUE(ET_RETURN) TYPE  ZRT_006_TT_MSG
*"----------------------------------------------------------------------

  SELECT * FROM zrt_006_t_msg
           INTO TABLE @et_return
                WHERE dealer_id = @IV_DEALER_ID.


ENDFUNCTION.
