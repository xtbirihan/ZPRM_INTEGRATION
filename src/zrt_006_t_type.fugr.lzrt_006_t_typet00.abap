*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 21.08.2020 at 20:42:13
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZRT_006_T_TYPE..................................*
DATA:  BEGIN OF STATUS_ZRT_006_T_TYPE                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRT_006_T_TYPE                .
CONTROLS: TCTRL_ZRT_006_T_TYPE
            TYPE TABLEVIEW USING SCREEN '0002'.
*.........table declarations:.................................*
TABLES: *ZRT_006_T_TYPE                .
TABLES: ZRT_006_T_TYPE                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
