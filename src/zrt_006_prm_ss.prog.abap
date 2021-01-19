*&---------------------------------------------------------------------*
*& Include zrt_006_prm_ss
*&---------------------------------------------------------------------*
TABLES: zrt_006_t_prm.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-005.
  SELECT-OPTIONS: s_dealer  FOR zrt_006_t_prm-dealer_id.
  SELECT-OPTIONS: s_arrv    FOR zrt_006_t_prm-arrival_date.
*  PARAMETERS    : p_guid    TYPE char1 AS CHECKBOX DEFAULT ''.
SELECTION-SCREEN END OF BLOCK b1.
