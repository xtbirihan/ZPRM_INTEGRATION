FUNCTION zrt_006_get.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     REFERENCE(EV_DARK_UPDATE) TYPE  CHAR1
*"----------------------------------------------------------------------
  ev_dark_update = gv_dark_update.
  CLEAR: gv_dark_update.

ENDFUNCTION.
