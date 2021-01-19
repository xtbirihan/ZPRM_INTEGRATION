*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZRT_006_T_SIGN
*   generation date: 26.08.2020 at 11:25:57
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZRT_006_T_SIGN     .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
