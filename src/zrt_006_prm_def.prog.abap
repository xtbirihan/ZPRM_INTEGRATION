*&---------------------------------------------------------------------*
*& Include zrt_006_prm_def
*&---------------------------------------------------------------------*
CLASS lcl_rt_006_prm_01 DEFINITION.

  PUBLIC SECTION.

    METHODS: fetch_data     RETURNING VALUE(et_data) TYPE ZRT_006_TT_PRM
                            RAISING    zcx_rt_006_prm,
             initialize_alv CHANGING  t_table        TYPE TABLE.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS: modify_data CHANGING et_data  TYPE ZRT_006_TT_PRM,
             enable_layout_settings,
             optimize_column_width,
             hide_client_column,
             set_icon,
             set_column_names,
             set_toolbar,
             display_settings,
             set_hotspot_click,
             display_alv.

ENDCLASS.
