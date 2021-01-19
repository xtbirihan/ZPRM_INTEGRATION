*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 07.08.2020 at 12:11:58
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZRT_006_T_WERKS.................................*
DATA:  BEGIN OF STATUS_ZRT_006_T_WERKS               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRT_006_T_WERKS               .
CONTROLS: TCTRL_ZRT_006_T_WERKS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZRT_006_T_WERKS               .
TABLES: ZRT_006_T_WERKS                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
