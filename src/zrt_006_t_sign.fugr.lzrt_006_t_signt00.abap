*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 26.08.2020 at 11:25:58
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZRT_006_T_SIGN..................................*
DATA:  BEGIN OF STATUS_ZRT_006_T_SIGN                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRT_006_T_SIGN                .
CONTROLS: TCTRL_ZRT_006_T_SIGN
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZRT_006_T_SIGN                .
TABLES: ZRT_006_T_SIGN                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
