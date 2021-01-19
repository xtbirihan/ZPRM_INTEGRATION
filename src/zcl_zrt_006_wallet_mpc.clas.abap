class ZCL_ZRT_006_WALLET_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  types:
     TS_WALLETDATA type ZRT_006_T_WLT_I .
  types:
TT_WALLETDATA type standard table of TS_WALLETDATA .
  types:
   begin of ts_text_element,
      artifact_name  type c length 40,       " technical name
      artifact_type  type c length 4,
      parent_artifact_name type c length 40, " technical name
      parent_artifact_type type c length 4,
      text_symbol    type textpoolky,
   end of ts_text_element .
  types:
         tt_text_elements type standard table of ts_text_element with key text_symbol .
  types:
  begin of TS_VH_DEALERID,
     DEALER_ID type ZRT_006_D_DEALER_ID,
     WERKS type WERKS_D,
     NAME_ORG1 type BU_NAMEOR1,
     CITY type AD_CITY1,
     DISTRICT type AD_CITY2,
     COUNTRY type LAND1,
  end of TS_VH_DEALERID .
  types:
TT_VH_DEALERID type standard table of TS_VH_DEALERID .
  types:
  begin of TS_VH_LANGUAGE,
     SPRAS type SPRAS,
     SPTXT type SPTXT,
  end of TS_VH_LANGUAGE .
  types:
TT_VH_LANGUAGE type standard table of TS_VH_LANGUAGE .
  types:
  begin of TS_VH_CURRENCY,
     WAERS type WAERS_CURC,
     LTEXT type LTEXT,
  end of TS_VH_CURRENCY .
  types:
TT_VH_CURRENCY type standard table of TS_VH_CURRENCY .
  types:
  begin of TS_VH_TRANSACTIONTYPE,
     PRIO type NUMC2,
     VALUE type CHAR20,
  end of TS_VH_TRANSACTIONTYPE .
  types:
TT_VH_TRANSACTIONTYPE type standard table of TS_VH_TRANSACTIONTYPE .

  constants GC_VH_CURRENCY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'VH_Currency' ##NO_TEXT.
  constants GC_VH_DEALERID type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'VH_DealerId' ##NO_TEXT.
  constants GC_VH_LANGUAGE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'VH_Language' ##NO_TEXT.
  constants GC_VH_TRANSACTIONTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'VH_TransactionType' ##NO_TEXT.
  constants GC_WALLETDATA type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Walletdata' ##NO_TEXT.

  methods LOAD_TEXT_ELEMENTS
  final
    returning
      value(RT_TEXT_ELEMENTS) type TT_TEXT_ELEMENTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.

  methods DEFINE_VOCAB_ANNOTATIONS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods IS_SUBSCRIPTION_ENABLED
    returning
      value(RT_SUBSCRIPTION_ENABLED) type ABAP_BOOL
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
private section.

  constants GC_INCL_NAME type STRING value 'ZCL_ZRT_006_WALLET_MPC========CP' ##NO_TEXT.

  methods DEFINE_WALLETDATA
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_VH_DEALERID
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_VH_LANGUAGE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_VH_CURRENCY
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_VH_TRANSACTIONTYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
ENDCLASS.



CLASS ZCL_ZRT_006_WALLET_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZRT_006_WALLET_SRV' ).


define_walletdata( ).
define_vh_dealerid( ).
define_vh_language( ).
define_vh_currency( ).
define_vh_transactiontype( ).
define_vocab_annotations( ).
 IF me->is_subscription_enabled( ) EQ abap_true.
    super->define( ).
  ENDIF.
  endmethod.


  method DEFINE_VH_CURRENCY.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - VH_Currency
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'VH_Currency' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'Waers' iv_abap_fieldname = 'WAERS' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 5 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Ltext' iv_abap_fieldname = 'LTEXT' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_WALLET_MPC=>TS_VH_CURRENCY' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'VH_CurrencySet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_VH_DEALERID.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - VH_DealerId
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'VH_DealerId' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'DealerId' iv_abap_fieldname = 'DEALER_ID' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Werks' iv_abap_fieldname = 'WERKS' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'NameOrg1' iv_abap_fieldname = 'NAME_ORG1' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'City' iv_abap_fieldname = 'CITY' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'District' iv_abap_fieldname = 'DISTRICT' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Country' iv_abap_fieldname = 'COUNTRY' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_WALLET_MPC=>TS_VH_DEALERID' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'VH_DealerIdSet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_VH_LANGUAGE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - VH_Language
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'VH_Language' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'Spras' iv_abap_fieldname = 'SPRAS' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT

lo_property->set_conversion_exit( 'ISOLA' ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Sptxt' iv_abap_fieldname = 'SPTXT' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 16 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_WALLET_MPC=>TS_VH_LANGUAGE' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'VH_LanguageSet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_VH_TRANSACTIONTYPE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - VH_TransactionType
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'VH_TransactionType' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'Prio' iv_abap_fieldname = 'PRIO' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Value' iv_abap_fieldname = 'VALUE' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_WALLET_MPC=>TS_VH_TRANSACTIONTYPE' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'VH_TransactionTypeSet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_VOCAB_ANNOTATIONS.
data: lo_ann_target type ref to /iwbep/if_mgw_vocan_ann_target.   " Vocabulary Annotation Target                     "#EC NEEDED
DATA: lo_annotation TYPE REF TO /iwbep/if_mgw_vocan_annotation.   " Vocabulary Annotation                            "#EC NEEDED
DATA: lo_collection TYPE REF TO /iwbep/if_mgw_vocan_collection.   " Vocabulary Annotation Collection                 "#EC NEEDED
DATA: lo_function   TYPE REF TO /iwbep/if_mgw_vocan_function.     " Vocabulary Annotation Function                   "#EC NEEDED
DATA: lo_fun_param  TYPE REF TO /iwbep/if_mgw_vocan_fun_param.    " Vocabulary Annotation Function Parameter         "#EC NEEDED
DATA: lo_property   TYPE REF TO /iwbep/if_mgw_vocan_property.     " Vocabulary Annotation Property                   "#EC NEEDED
DATA: lo_record     TYPE REF TO /iwbep/if_mgw_vocan_record.       " Vocabulary Annotation Record                     "#EC NEEDED
DATA: lo_simp_value TYPE REF TO /iwbep/if_mgw_vocan_simple_val.   " Vocabulary Annotation Simple Value               "#EC NEEDED
DATA: lo_url        TYPE REF TO /iwbep/if_mgw_vocan_url.          " Vocabulary Annotation URL                        "#EC NEEDED
DATA: lo_label_elem TYPE REF TO /iwbep/if_mgw_vocan_label_elem.   " Vocabulary Annotation Labeled Element            "#EC NEEDED
DATA: lo_reference  TYPE REF TO /iwbep/if_mgw_vocan_reference.    " Vocabulary Annotation Reference


  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_COMMON'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.Common.v1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_CORE'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Core.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_VALIDATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Validation.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_AGGREGATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Aggregation.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_UI'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.UI.v1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_COMMUNICATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.Communication.v1' ).    "#EC NOTEXT
  endmethod.


  method DEFINE_WALLETDATA.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - Walletdata
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'Walletdata' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'TransactionNo' iv_abap_fieldname = 'TRANSACTION_NO' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_guid( ).


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'TransactionType' iv_abap_fieldname = 'TRANSACTION_TYPE' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'DealerId' iv_abap_fieldname = 'DEALER_ID' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Statu' iv_abap_fieldname = 'STATU' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Sign' iv_abap_fieldname = 'SIGN' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Amount' iv_abap_fieldname = 'AMOUNT' ). "#EC NOTEXT


lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 16 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Waerk' iv_abap_fieldname = 'WAERK' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 5 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'TransactionDate' iv_abap_fieldname = 'TRANSACTION_DATE' ). "#EC NOTEXT


lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT


lo_property->set_nullable( abap_true ).

lo_property = lo_entity_type->create_property( iv_property_name = 'SlipNumber' iv_abap_fieldname = 'SLIP_NUMBER' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name   = 'ZRT_006_T_WLT_I'
                                iv_bind_conversions = 'X' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'WalletdataSet' ). "#EC NOTEXT
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20200820145656'.                  "#EC NOTEXT
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
  endmethod.


  method IS_SUBSCRIPTION_ENABLED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*

DATA:
     ls_subscription_enabled TYPE abap_bool value abap_false.

     rt_subscription_enabled = ls_subscription_enabled.
  endmethod.


  method LOAD_TEXT_ELEMENTS.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


DATA:
     ls_text_element TYPE ts_text_element.                                 "#EC NEEDED


clear ls_text_element.
ls_text_element-artifact_name          = 'DealerId'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_DealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '002'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Werks'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_DealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '003'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'NameOrg1'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_DealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '004'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'City'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_DealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '005'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'District'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_DealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '006'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Country'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_DealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '007'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'Spras'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_Language'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '011'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Sptxt'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_Language'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '012'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'Waers'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_Currency'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '013'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Ltext'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_Currency'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '014'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'Prio'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_TransactionType'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '015'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Value'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'VH_TransactionType'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '016'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
  endmethod.
ENDCLASS.
