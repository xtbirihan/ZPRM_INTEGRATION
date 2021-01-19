class ZCL_ZRT_006_OD_WALLET_MPC_EXT definition
  public
  inheriting from ZCL_ZRT_006_OD_WALLET_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.

  constants GC_INCL_NAME type STRING value 'ZCL_ZRT_006_OD_WALLET_MPC_EXT====CP' ##NO_TEXT.

  methods DEFINE_VH_CURRENCY .
  methods DEFINE_VH_TRANSACTIONTYPE .
  methods DEFINE_VH_DEALERID .
  methods DEFINE_VH_SIGN .
ENDCLASS.



CLASS ZCL_ZRT_006_OD_WALLET_MPC_EXT IMPLEMENTATION.


  METHOD define.

    super->define( ).
    define_vh_transactiontype( ). "bunun yerini değiştirmeyin neden bilmiyorum ama diğer anatasyonları bozuyor.
    define_vh_sign( ).
    define_vh_currency( ).
    define_vh_dealerid( ).

    DATA:
      lo_entity_type TYPE REF TO /iwbep/if_mgw_odata_entity_typ,
      lo_property    TYPE REF TO /iwbep/if_mgw_odata_property,
*      lr_med_exception      TYPE REF TO /iwbep/cx_mgw_med_exception,
*      lo_private_annotation TYPE REF TO /iwbep/if_mgw_odata_annotation,
      lo_model       TYPE REF TO /iwbep/cl_mgw_odata_model,
      lt_entities    TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_entity_types,
      lt_properties  TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_properties,
      lv_entity      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      lo_annotation  TYPE REF TO /iwbep/if_mgw_odata_annotation.

    lv_entity = 'Walletdata'.

*    BREAK-POINT.

    lo_entity_type = model->get_entity_type( lv_entity ).
    lo_model ?=  model.
    lt_entities = lo_model->mt_entities.

    IF line_exists( lt_entities[ name = lv_entity ] ).
      lt_properties = lt_entities[ name = lv_entity ]-properties.

      LOOP AT lt_properties ASSIGNING FIELD-SYMBOL(<ls_property>).
        CASE <ls_property>-name.
          WHEN 'TRANSACTION_NO'.
            lo_property = lo_entity_type->get_property( <ls_property>-external_name ).
            lo_property->set_creatable( abap_false ).
            lo_property->set_updatable( abap_false ).
            lo_property->set_filterable( abap_false ).

            lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
                  EXPORTING
                    iv_key      = 'unicode'
                    iv_value    = 'false' ).


          WHEN 'TRANSACTION_TYPE'.


*            lo_property = lo_entity_type->get_property( <ls_property>-external_name ).
*            lo_private_annotation = lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( /iwbep/if_mgw_med_odata_types=>gc_sap_namespace ).
*            lo_private_annotation->add( iv_key = 'field-control' iv_value = 'Uxfc01' ).

          WHEN 'DEALER_ID'.
            lo_property = lo_entity_type->get_property( <ls_property>-external_name ).
            lo_property->set_nullable( iv_nullable = abap_false ).
          WHEN 'TRANSACTION_DATE'.
            lo_property = lo_entity_type->get_property( <ls_property>-external_name ).
            lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation(
                  EXPORTING
                    iv_annotation_namespace = /iwbep/if_mgw_med_odata_types=>gc_sap_namespace
                  RECEIVING
                    ro_annotation           = lo_annotation ).
            lo_annotation->add( iv_key = 'display-format' iv_value = 'Date' ).

          WHEN 'UXFC_01'.
            lo_property = lo_entity_type->get_property( <ls_property>-external_name ).

            lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation(
                  EXPORTING
                    iv_annotation_namespace = /iwbep/if_mgw_med_odata_types=>gc_sap_namespace
                  RECEIVING
                    ro_annotation           = lo_annotation ).
            lo_annotation->add( iv_key = 'visible' iv_value = 'false' ).

            lo_property = lo_entity_type->get_property( 'SlipNumber' ).
            lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation(
                  EXPORTING
                    iv_annotation_namespace = /iwbep/if_mgw_med_odata_types=>gc_sap_namespace
                  RECEIVING
                    ro_annotation           = lo_annotation ).

            lo_annotation->add( iv_key = 'field-control' iv_value = 'Uxfc01' ).

          WHEN 'WAERK'.
            lo_property = lo_entity_type->get_property( <ls_property>-external_name ).


*            lo_property->set_creatable( abap_false ).
*            lo_property->set_updatable( abap_false ).
*            lo_property->set_filterable( abap_false ).

*            lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
*                  EXPORTING
*                    iv_key      = 'unicode'
*                    iv_value    = 'false' ).

          WHEN OTHERS.
        ENDCASE.


      ENDLOOP.
    ENDIF.
  ENDMETHOD.


  method DEFINE_VH_CURRENCY.


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
        iv_property                  = 'Waerk'
        iv_valuelist_entityset       = 'HTcurcSet'
        iv_valuelist_property        = 'Waers' ) .

    lr_annotation->add_display_parameter( iv_valuelist_property  = 'Waers' ) .
    lr_annotation->add_display_parameter( iv_valuelist_property  = 'Ltext' ) .

  endmethod.


  METHOD define_vh_dealerid.

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
        iv_property                  = 'DealerId'
        iv_valuelist_entityset       = 'Zrt006ShDealerIdSet'
        iv_valuelist_property        = 'DealerId' ) .

*    lr_annotation->add_display_parameter( iv_valuelist_property  = 'DealerId' ) .
    lr_annotation->add_display_parameter( iv_valuelist_property  = 'Werks' ) .
    lr_annotation->add_display_parameter( iv_valuelist_property  = 'NameOrg1' ) .
    lr_annotation->add_display_parameter( iv_valuelist_property  = 'City' ) .
    lr_annotation->add_display_parameter( iv_valuelist_property  = 'District' ) .
    lr_annotation->add_display_parameter( iv_valuelist_property  = 'Country' ) .

  ENDMETHOD.


  method DEFINE_VH_SIGN.


    DATA : lv_namespace   TYPE string.


    model->set_soft_state_enabled( iv_soft_state_enabled = abap_true ).
    model->get_schema_namespace( IMPORTING ev_namespace = lv_namespace ).
    cl_fis_shlp_annotation=>create(
          io_odata_model = model
          io_vocan_model = vocab_anno_model
          iv_namespace = 'sap'
          iv_entitytype = 'Walletdata'
          iv_property = 'Sign'
          iv_search_help = space
          iv_search_supported = abap_false
          iv_search_help_field = space
          iv_valuelist_entityset = 'Zrt006ShSignSet'
          iv_valuelist_property = 'Sign' ##NO_TEXT
          )->add_display_parameter( iv_valuelist_property  = 'SignText' ).

    DATA(lo_txt_property) = model->get_entity_type( 'Walletdata' )->get_property( 'Sign' ).
    lo_txt_property->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    DATA(lo_text_anno) = lo_txt_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' ).
    lo_text_anno->add( iv_key = 'text' iv_value = 'SignText').
    lo_txt_property = model->get_entity_type( 'Zrt006ShSign' )->get_property( 'Sign' ).
    lo_txt_property->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    lo_text_anno = lo_txt_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' ).
    lo_text_anno->add( iv_key = 'text' iv_value = 'SignText').

  endmethod.


  METHOD define_vh_transactiontype.


    DATA : lv_namespace   TYPE string.
*           lr_annotation  TYPE REF TO cl_fis_shlp_annotation,
*           lr_annotation2 TYPE REF TO cl_fis_shlp_annotation.
*
*    model->set_soft_state_enabled( iv_soft_state_enabled = abap_true ).
*    model->get_schema_namespace( IMPORTING ev_namespace = lv_namespace ).
*
*    lr_annotation = cl_fis_shlp_annotation=>create(
*        io_odata_model               = model
*        io_vocan_model               = vocab_anno_model
*        iv_namespace                 = lv_namespace
*        iv_entitytype                = 'Walletdata'
*        iv_property                  = 'TransactionType'
*        iv_valuelist_entityset       = 'Zrt006ShTransactionTypeSet'
*        iv_valuelist_property        = 'Prio' ) .
*
*    DATA(lo_txt_property) = model->get_entity_type( 'Walletdata' )->get_property( 'TransactionType' ).
*    lo_txt_property->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).


    model->set_soft_state_enabled( iv_soft_state_enabled = abap_true ).
    model->get_schema_namespace( IMPORTING ev_namespace = lv_namespace ).
    cl_fis_shlp_annotation=>create(
          io_odata_model = model
          io_vocan_model = vocab_anno_model
          iv_namespace = 'sap'
          iv_entitytype = 'Walletdata'
          iv_property = 'TransactionType'
          iv_search_help = space
          iv_search_supported = abap_false
          iv_search_help_field = space
          iv_valuelist_entityset = 'Zrt006ShTransactionTypeSet'
          iv_valuelist_property = 'TransactionType' ##NO_TEXT
          )->add_display_parameter( iv_valuelist_property  = 'TransactionTypeText' ).

    DATA(lo_txt_property) = model->get_entity_type( 'Walletdata' )->get_property( 'TransactionType' ).
    lo_txt_property->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    DATA(lo_text_anno) = lo_txt_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' ).
    lo_text_anno->add( iv_key = 'text' iv_value = 'TransactionTypeText').
    lo_txt_property = model->get_entity_type( 'Zrt006ShTransactionType' )->get_property( 'TransactionType' ).
    lo_txt_property->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    lo_text_anno = lo_txt_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' ).
    lo_text_anno->add( iv_key = 'text' iv_value = 'TransactionTypeText').

  ENDMETHOD.
ENDCLASS.
