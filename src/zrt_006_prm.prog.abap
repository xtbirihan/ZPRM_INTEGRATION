*&---------------------------------------------------------------------*
*& Report zrt_006_prm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrt_006_prm.

INCLUDE: zrt_006_prm_top,
         zrt_006_prm_ss,
         zrt_006_prm_def,
         zrt_006_prm_imp.

START-OF-SELECTION.
  TRY.
      DATA(lo_bp) = NEW lcl_rt_006_prm_01( ).
      lo_bp->fetch_data( ).
    CATCH zcx_rt_006_prm INTO DATA(lo_rt_006_prm).
      MESSAGE lo_rt_006_prm TYPE 'I'.
  ENDTRY.
