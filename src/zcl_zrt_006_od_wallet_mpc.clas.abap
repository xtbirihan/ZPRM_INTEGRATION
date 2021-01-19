class ZCL_ZRT_006_OD_WALLET_MPC definition
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
  begin of TS_HTCURC,
     WAERS type WAERS_CURC,
     LTEXT type LTEXT,
  end of TS_HTCURC .
  types:
TT_HTCURC type standard table of TS_HTCURC .
  types:
  begin of TS_ZRT006SHDEALERID,
     DEALER_ID type ZRT_006_D_DEALER_ID,
     WERKS type WERKS_D,
     NAME_ORG1 type BU_NAMEOR1,
     CITY type AD_CITY1,
     DISTRICT type AD_CITY2,
     COUNTRY type LAND1,
  end of TS_ZRT006SHDEALERID .
  types:
TT_ZRT006SHDEALERID type standard table of TS_ZRT006SHDEALERID .
  types:
  begin of TS_ZRT006SHTRANSACTIONTYPE,
     TRANSACTION_TYPE type ZRT_006_D_TR_TYPE,
     TRANSACTION_TYPE_TEXT type ZRT_006_D_TR_TYPE_TEXT,
  end of TS_ZRT006SHTRANSACTIONTYPE .
  types:
TT_ZRT006SHTRANSACTIONTYPE type standard table of TS_ZRT006SHTRANSACTIONTYPE .
  types:
  begin of TS_ZRT006SHSIGN,
     SIGN type ZRT_006_D_SIGN,
     SIGN_TEXT type ZRT_006_D_SIGN_TEXT,
  end of TS_ZRT006SHSIGN .
  types:
TT_ZRT006SHSIGN type standard table of TS_ZRT006SHSIGN .

  constants GC_HTCURC type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'HTcurc' ##NO_TEXT.
  constants GC_WALLETDATA type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Walletdata' ##NO_TEXT.
  constants GC_ZRT006SHDEALERID type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zrt006ShDealerId' ##NO_TEXT.
  constants GC_ZRT006SHSIGN type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zrt006ShSign' ##NO_TEXT.
  constants GC_ZRT006SHTRANSACTIONTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zrt006ShTransactionType' ##NO_TEXT.

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

  constants GC_INCL_NAME type STRING value 'ZCL_ZRT_006_OD_WALLET_MPC=====CP' ##NO_TEXT.

  methods DEFINE_WALLETDATA
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_HTCURC
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_ZRT006SHDEALERID
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_ZRT006SHTRANSACTIONTYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_ZRT006SHSIGN
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_ASSOCIATIONS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
ENDCLASS.



CLASS ZCL_ZRT_006_OD_WALLET_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZRT_006_OD_WALLET_SRV' ).


define_walletdata( ).
define_htcurc( ).
define_zrt006shdealerid( ).
define_zrt006shtransactiontype( ).
define_zrt006shsign( ).
define_associations( ).
define_vocab_annotations( ).
 IF me->is_subscription_enabled( ) EQ abap_true.
    super->define( ).
  ENDIF.
  endmethod.


  method DEFINE_ASSOCIATIONS.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*





data:
lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                   "#EC NEEDED
lo_association    type ref to /iwbep/if_mgw_odata_assoc,                        "#EC NEEDED
lo_ref_constraint type ref to /iwbep/if_mgw_odata_ref_constr,                   "#EC NEEDED
lo_assoc_set      type ref to /iwbep/if_mgw_odata_assoc_set,                    "#EC NEEDED
lo_nav_property   type ref to /iwbep/if_mgw_odata_nav_prop.                     "#EC NEEDED

***********************************************************************************************************************************
*   ASSOCIATIONS
***********************************************************************************************************************************

 lo_association = model->create_association(
                            iv_association_name = 'Assoc_HTcurc_Wallet' "#EC NOTEXT
                            iv_left_type        = 'HTcurc' "#EC NOTEXT
                            iv_right_type       = 'Walletdata' "#EC NOTEXT
                            iv_right_card       = '1' "#EC NOTEXT
                            iv_left_card        = '1' ). "#EC NOTEXT

* Referential constraint for association - Assoc_HTcurc_Wallet
lo_ref_constraint = lo_association->create_ref_constraint( ).
lo_ref_constraint->add_property( iv_principal_property = 'Waers'   iv_dependent_property = 'Waerk' ). "#EC NOTEXT

* Association Sets for association - Assoc_HTcurc_Wallet
lo_assoc_set = lo_association->create_assoc_set( iv_assoc_set_name = 'Assoc_HTcurc_WalletSet' ). "#EC NOTEXT
 lo_association = model->create_association(
                            iv_association_name = 'Assoc_VH_DealerID_Wallet' "#EC NOTEXT
                            iv_left_type        = 'Zrt006ShDealerId' "#EC NOTEXT
                            iv_right_type       = 'Walletdata' "#EC NOTEXT
                            iv_right_card       = '0' "#EC NOTEXT
                            iv_left_card        = '1' ). "#EC NOTEXT

* Referential constraint for association - Assoc_VH_DealerID_Wallet
lo_ref_constraint = lo_association->create_ref_constraint( ).
lo_ref_constraint->add_property( iv_principal_property = 'DealerId'   iv_dependent_property = 'DealerId' ). "#EC NOTEXT

* Association Sets for association - Assoc_VH_DealerID_Wallet
lo_assoc_set = lo_association->create_assoc_set( iv_assoc_set_name = 'Assoc_VH_DealerID_WalletSet' ). "#EC NOTEXT

***********************************************************************************************************************************
*   NAVIGATION PROPERTIES
***********************************************************************************************************************************

* Navigation Properties for entity - HTcurc
lo_entity_type = model->get_entity_type( iv_entity_name = 'HTcurc' ). "#EC NOTEXT
lo_nav_property = lo_entity_type->create_navigation_property( iv_property_name  = 'HTcurcToWallet' "#EC NOTEXT
                                                          iv_association_name = 'Assoc_HTcurc_Wallet' ). "#EC NOTEXT


* Navigation Properties for entity - Zrt006ShDealerId
lo_entity_type = model->get_entity_type( iv_entity_name = 'Zrt006ShDealerId' ). "#EC NOTEXT
lo_nav_property = lo_entity_type->create_navigation_property( iv_property_name  = 'DealerIdToWallet' "#EC NOTEXT
                                                          iv_association_name = 'Assoc_VH_DealerID_Wallet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_HTCURC.
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
*   ENTITY - HTcurc
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'HTcurc' iv_def_entity_set = abap_false ). "#EC NOTEXT


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


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_OD_WALLET_MPC=>TS_HTCURC' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'HTcurcSet' ). "#EC NOTEXT
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
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_COMMUNICATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.Communication.v1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_MEASURES'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Measures.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_UI'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.UI.v1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = 'RSODP_CLOUD_DATA_INTEGRATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.DataIntegration.v1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_CAPABILITIES'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Capabilities.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_AUTHORIZATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Authorization.V1' ).    "#EC NOTEXT
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

lo_property->set_type_edm_string( ).


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'TransactionTypeText' iv_abap_fieldname = 'TRANSACTION_TYPE_TEXT' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Uxfc01' iv_abap_fieldname = 'UXFC_01' ). "#EC NOTEXT


lo_property->set_type_edm_byte( ).


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'SignText' iv_abap_fieldname = 'SIGN_TEXT' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'TransactionType' iv_abap_fieldname = 'TRANSACTION_TYPE' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Uxfc02' iv_abap_fieldname = 'UXFC_02' ). "#EC NOTEXT


lo_property->set_type_edm_byte( ).


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'DealerId' iv_abap_fieldname = 'DEALER_ID' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Uxfc03' iv_abap_fieldname = 'UXFC_03' ). "#EC NOTEXT


lo_property->set_type_edm_byte( ).


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Statu' iv_abap_fieldname = 'STATU' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Uxfc04' iv_abap_fieldname = 'UXFC_04' ). "#EC NOTEXT


lo_property->set_type_edm_byte( ).


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


  method DEFINE_ZRT006SHDEALERID.
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
*   ENTITY - Zrt006ShDealerId
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'Zrt006ShDealerId' iv_def_entity_set = abap_false ). "#EC NOTEXT


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


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_OD_WALLET_MPC=>TS_ZRT006SHDEALERID' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'Zrt006ShDealerIdSet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_ZRT006SHSIGN.
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
*   ENTITY - Zrt006ShSign
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'Zrt006ShSign' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'Sign' iv_abap_fieldname = 'SIGN' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'SignText' iv_abap_fieldname = 'SIGN_TEXT' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_OD_WALLET_MPC=>TS_ZRT006SHSIGN' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'Zrt006ShSignSet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_ZRT006SHTRANSACTIONTYPE.
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
*   ENTITY - Zrt006ShTransactionType
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'Zrt006ShTransactionType' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'TransactionType' iv_abap_fieldname = 'TRANSACTION_TYPE' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'TransactionTypeText' iv_abap_fieldname = 'TRANSACTION_TYPE_TEXT' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 20 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZRT_006_OD_WALLET_MPC=>TS_ZRT006SHTRANSACTIONTYPE' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'Zrt006ShTransactionTypeSet' ). "#EC NOTEXT
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20200828134246'.                  "#EC NOTEXT
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
ls_text_element-artifact_name          = 'Waers'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'HTcurc'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '001'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Ltext'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'HTcurc'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '002'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'DealerId'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShDealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '005'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Werks'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShDealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '006'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'NameOrg1'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShDealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '007'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'City'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShDealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '008'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'District'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShDealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '009'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Country'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShDealerId'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '010'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'TransactionType'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShTransactionType'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '011'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'TransactionTypeText'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShTransactionType'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '012'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'Sign'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShSign'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '013'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'SignText'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Zrt006ShSign'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '014'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
  endmethod.
ENDCLASS.
