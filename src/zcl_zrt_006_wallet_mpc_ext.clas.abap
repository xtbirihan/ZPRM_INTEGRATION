class ZCL_ZRT_006_WALLET_MPC_EXT definition
  public
  inheriting from ZCL_ZRT_006_WALLET_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.

  constants GC_INCL_NAME type STRING value 'ZCL_ZRT_006_WALLET_MPC_EXT====CP' ##NO_TEXT.

  methods DEFINE_VH_CURRENCY .
  methods DEFINE_VH_LANGUAGE .
  methods DEFINE_VH_DEALERID .
  methods DEFINE_VH_TRANSACTIONTYPE .
ENDCLASS.



CLASS ZCL_ZRT_006_WALLET_MPC_EXT IMPLEMENTATION.


  method DEFINE.
      super->define( ).
      DEFINE_VH_CURRENCY( ).
      DEFINE_VH_DEALERID( ).
      DEFINE_VH_LANGUAGE( ).
      DEFINE_VH_TRANSACTIONTYPE( ).

  endmethod.


  METHOD define_vh_currency.

    DATA:
      lo_annotation   TYPE REF TO /iwbep/if_mgw_odata_annotation, "#EC NEEDED
      lo_entity_type  TYPE REF TO /iwbep/if_mgw_odata_entity_typ, "#EC NEEDED
      lo_complex_type TYPE REF TO /iwbep/if_mgw_odata_cmplx_type, "#EC NEEDED
      lo_property     TYPE REF TO /iwbep/if_mgw_odata_property, "#EC NEEDED
      lo_entity_set   TYPE REF TO /iwbep/if_mgw_odata_entity_set. "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - VH_Currency
***********************************************************************************************************************************

    lo_entity_type = model->create_entity_type( iv_entity_type_name = 'VH_Currency' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

    lo_property = lo_entity_type->create_property( iv_property_name = 'Waers' iv_abap_fieldname = 'WAERS' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '012' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_is_key( ).
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 5 ).        "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).
    lo_property = lo_entity_type->create_property( iv_property_name = 'Ltext' iv_abap_fieldname = 'LTEXT' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '011' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 40 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).

    lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_WALLET_MPC_EXT=>TS_VH_CURRENCY' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
    lo_entity_set = lo_entity_type->create_entity_set( 'VH_CurrencySet' ). "#EC NOTEXT

    lo_entity_set->set_creatable( abap_false ).
    lo_entity_set->set_updatable( abap_false ).
    lo_entity_set->set_deletable( abap_false ).

    lo_entity_set->set_pageable( abap_false ).
    lo_entity_set->set_addressable( abap_true ).
    lo_entity_set->set_has_ftxt_search( abap_false ).
    lo_entity_set->set_subscribable( abap_false ).
    lo_entity_set->set_filter_required( abap_false ).

  ENDMETHOD.


  METHOD define_vh_dealerid.

    DATA:
      lo_annotation   TYPE REF TO /iwbep/if_mgw_odata_annotation, "#EC NEEDED
      lo_entity_type  TYPE REF TO /iwbep/if_mgw_odata_entity_typ, "#EC NEEDED
      lo_complex_type TYPE REF TO /iwbep/if_mgw_odata_cmplx_type, "#EC NEEDED
      lo_property     TYPE REF TO /iwbep/if_mgw_odata_property, "#EC NEEDED
      lo_entity_set   TYPE REF TO /iwbep/if_mgw_odata_entity_set. "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - VH_Country
***********************************************************************************************************************************

    lo_entity_type = model->create_entity_type( iv_entity_type_name = 'VH_DealerId' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

    lo_property = lo_entity_type->create_property( iv_property_name = 'DealerId' iv_abap_fieldname = 'DEALER_ID' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '001' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_is_key( ).
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 3 ).        "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).

    lo_property = lo_entity_type->create_property( iv_property_name = 'Werks' iv_abap_fieldname = 'WERKS' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '002' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 15 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).

    lo_property = lo_entity_type->create_property( iv_property_name = 'NameOrg1' iv_abap_fieldname = 'NAME_ORG1' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '003' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 40 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).



    lo_property = lo_entity_type->create_property( iv_property_name = 'City' iv_abap_fieldname = 'CITY' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '004' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 40 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).


    lo_property = lo_entity_type->create_property( iv_property_name = 'District' iv_abap_fieldname = 'DISTRICT' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '005' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 40 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).


    lo_property = lo_entity_type->create_property( iv_property_name = 'Country' iv_abap_fieldname = 'COUNTRY' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '006' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 25 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).

    lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_WALLET_MPC_EXT=>TS_VH_DEALERID' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
    lo_entity_set = lo_entity_type->create_entity_set( 'VH_DealerIdSet' ). "#EC NOTEXT

    lo_entity_set->set_creatable( abap_false ).
    lo_entity_set->set_updatable( abap_false ).
    lo_entity_set->set_deletable( abap_false ).

    lo_entity_set->set_pageable( abap_false ).
    lo_entity_set->set_addressable( abap_true ).
    lo_entity_set->set_has_ftxt_search( abap_false ).
    lo_entity_set->set_subscribable( abap_false ).
    lo_entity_set->set_filter_required( abap_false ).


  ENDMETHOD.


  METHOD define_vh_language.



    DATA:
      lo_annotation   TYPE REF TO /iwbep/if_mgw_odata_annotation, "#EC NEEDED
      lo_entity_type  TYPE REF TO /iwbep/if_mgw_odata_entity_typ, "#EC NEEDED
      lo_complex_type TYPE REF TO /iwbep/if_mgw_odata_cmplx_type, "#EC NEEDED
      lo_property     TYPE REF TO /iwbep/if_mgw_odata_property, "#EC NEEDED
      lo_entity_set   TYPE REF TO /iwbep/if_mgw_odata_entity_set. "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - VH_Language
***********************************************************************************************************************************

    lo_entity_type = model->create_entity_type( iv_entity_type_name = 'VH_Language' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

    lo_property = lo_entity_type->create_property( iv_property_name = 'Spras' iv_abap_fieldname = 'SPRAS' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '037' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_is_key( ).
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 2 ).        "#EC NOTEXT
    lo_property->set_conversion_exit( 'ISOLA' ).            "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).
    lo_property = lo_entity_type->create_property( iv_property_name = 'Sptxt' iv_abap_fieldname = 'SPTXT' ). "#EC NOTEXT
    lo_property->set_label_from_text_element( iv_text_element_symbol = '036' iv_text_element_container = gc_incl_name ). "#EC NOTEXT
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 16 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_false ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          EXPORTING
            iv_key      = 'unicode'
            iv_value    = 'false' ).

    lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_WALLET_MPC_EXT=>TS_VH_LANGUAGE' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
    lo_entity_set = lo_entity_type->create_entity_set( 'VH_LanguageSet' ). "#EC NOTEXT

    lo_entity_set->set_creatable( abap_false ).
    lo_entity_set->set_updatable( abap_false ).
    lo_entity_set->set_deletable( abap_false ).

    lo_entity_set->set_pageable( abap_false ).
    lo_entity_set->set_addressable( abap_true ).
    lo_entity_set->set_has_ftxt_search( abap_false ).
    lo_entity_set->set_subscribable( abap_false ).
    lo_entity_set->set_filter_required( abap_false ).

  ENDMETHOD.


  METHOD define_vh_transactiontype.

    DATA : lv_namespace   TYPE string,
           lr_annotation  TYPE REF TO cl_fis_shlp_annotation,
           lr_annotation2 TYPE REF TO cl_fis_shlp_annotation.

    model->set_soft_state_enabled( iv_soft_state_enabled = abap_true ).
    model->get_schema_namespace( IMPORTING ev_namespace = lv_namespace ).

    lr_annotation = cl_fis_shlp_annotation=>create(
        io_odata_model               = model
        io_vocan_model               = vocab_anno_model
        iv_namespace                 = lv_namespace
        iv_entitytype                = 'Walletdata'
        iv_property                  = 'TransactionType'
        iv_valuelist_entityset       = 'VH_TransactionType'
        iv_valuelist_property        = 'Prio' ) .

    DATA(lo_txt_property2) = model->get_entity_type( 'Walletdata' )->get_property( 'TransactionType' ).
    lo_txt_property2->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
  ENDMETHOD.
ENDCLASS.
