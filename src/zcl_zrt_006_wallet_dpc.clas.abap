class ZCL_ZRT_006_WALLET_DPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_DATA
  abstract
  create public .

public section.

  interfaces /IWBEP/IF_SB_DPC_COMM_SERVICES .
  interfaces /IWBEP/IF_SB_GENDPC_SHLP_DATA .
  interfaces /IWBEP/IF_SB_GEN_DPC_INJECTION .

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY
    redefinition .
protected section.

  data mo_injection type ref to /IWBEP/IF_SB_GEN_DPC_INJECTION .

  methods ZRT006SHDEALERID_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_DEALERID
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods ZRT006SHDEALERID_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZRT_006_WALLET_MPC=>TT_VH_DEALERID
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods ZRT006SHDEALERID_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_DEALERID
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods ZRT006SHDEALERID_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods ZRT006SHDEALERID_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_DEALERID
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods WALLETDATASET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_WALLETDATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods WALLETDATASET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZRT_006_WALLET_MPC=>TT_WALLETDATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods WALLETDATASET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_WALLETDATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods WALLETDATASET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods WALLETDATASET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_WALLETDATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_TRANSACTIONTY_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_TRANSACTIONTYPE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_TRANSACTIONTY_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZRT_006_WALLET_MPC=>TT_VH_TRANSACTIONTYPE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_TRANSACTIONTY_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_TRANSACTIONTYPE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_TRANSACTIONTY_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_TRANSACTIONTY_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_TRANSACTIONTYPE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_CURRENCYSET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_CURRENCY
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_CURRENCYSET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZRT_006_WALLET_MPC=>TT_VH_CURRENCY
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_CURRENCYSET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_CURRENCY
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_CURRENCYSET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods VH_CURRENCYSET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_CURRENCY
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods HT002SET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_LANGUAGE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods HT002SET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZRT_006_WALLET_MPC=>TT_VH_LANGUAGE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods HT002SET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_LANGUAGE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods HT002SET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods HT002SET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZRT_006_WALLET_MPC=>TS_VH_LANGUAGE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .

  methods CHECK_SUBSCRIPTION_AUTHORITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZRT_006_WALLET_DPC IMPLEMENTATION.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_CRT_ENTITY_BASE
*&* This class has been generated on 20.08.2020 17:56:58 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZRT_006_WALLET_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA walletdataset_create_entity TYPE zcl_zrt_006_wallet_mpc=>ts_walletdata.
 DATA vh_transactionty_create_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_transactiontype.
 DATA zrt006shdealerid_create_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_dealerid.
 DATA ht002set_create_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_language.
 DATA vh_currencyset_create_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_currency.
 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  WalletdataSet
*-------------------------------------------------------------------------*
     WHEN 'WalletdataSet'.
*     Call the entity set generated method
    walletdataset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = walletdataset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = walletdataset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_TransactionTypeSet
*-------------------------------------------------------------------------*
     WHEN 'VH_TransactionTypeSet'.
*     Call the entity set generated method
    vh_transactionty_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = vh_transactionty_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = vh_transactionty_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_DealerIdSet
*-------------------------------------------------------------------------*
     WHEN 'VH_DealerIdSet'.
*     Call the entity set generated method
    zrt006shdealerid_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = zrt006shdealerid_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = zrt006shdealerid_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_LanguageSet
*-------------------------------------------------------------------------*
     WHEN 'VH_LanguageSet'.
*     Call the entity set generated method
    ht002set_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = ht002set_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = ht002set_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_CurrencySet
*-------------------------------------------------------------------------*
     WHEN 'VH_CurrencySet'.
*     Call the entity set generated method
    vh_currencyset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = vh_currencyset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = vh_currencyset_create_entity
      CHANGING
        cr_data = er_entity
   ).

  when others.
    super->/iwbep/if_mgw_appl_srv_runtime~create_entity(
       EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         io_data_provider   = io_data_provider
         it_key_tab = it_key_tab
         it_navigation_path = it_navigation_path
      IMPORTING
        er_entity = er_entity
  ).
ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_DEL_ENTITY_BASE
*&* This class has been generated on 20.08.2020 17:56:58 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZRT_006_WALLET_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_TransactionTypeSet
*-------------------------------------------------------------------------*
      when 'VH_TransactionTypeSet'.
*     Call the entity set generated method
     vh_transactionty_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  WalletdataSet
*-------------------------------------------------------------------------*
      when 'WalletdataSet'.
*     Call the entity set generated method
     walletdataset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_DealerIdSet
*-------------------------------------------------------------------------*
      when 'VH_DealerIdSet'.
*     Call the entity set generated method
     zrt006shdealerid_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_LanguageSet
*-------------------------------------------------------------------------*
      when 'VH_LanguageSet'.
*     Call the entity set generated method
     ht002set_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_CurrencySet
*-------------------------------------------------------------------------*
      when 'VH_CurrencySet'.
*     Call the entity set generated method
     vh_currencyset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

   when others.
     super->/iwbep/if_mgw_appl_srv_runtime~delete_entity(
        EXPORTING
          iv_entity_name = iv_entity_name
          iv_entity_set_name = iv_entity_set_name
          iv_source_name = iv_source_name
          it_key_tab = it_key_tab
          it_navigation_path = it_navigation_path
 ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY.
*&-----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_GETENTITY_BASE
*&* This class has been generated  on 20.08.2020 17:56:58 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZRT_006_WALLET_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA walletdataset_get_entity TYPE zcl_zrt_006_wallet_mpc=>ts_walletdata.
 DATA zrt006shdealerid_get_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_dealerid.
 DATA ht002set_get_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_language.
 DATA vh_currencyset_get_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_currency.
 DATA vh_transactionty_get_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_transactiontype.
 DATA lv_entityset_name TYPE string.
 DATA lr_entity TYPE REF TO data.       "#EC NEEDED

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  WalletdataSet
*-------------------------------------------------------------------------*
      WHEN 'WalletdataSet'.
*     Call the entity set generated method
          walletdataset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = walletdataset_get_entity
                         es_response_context = es_response_context
          ).

        IF walletdataset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = walletdataset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_DealerIdSet
*-------------------------------------------------------------------------*
      WHEN 'VH_DealerIdSet'.
*     Call the entity set generated method
          zrt006shdealerid_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = zrt006shdealerid_get_entity
                         es_response_context = es_response_context
          ).

        IF zrt006shdealerid_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = zrt006shdealerid_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_LanguageSet
*-------------------------------------------------------------------------*
      WHEN 'VH_LanguageSet'.
*     Call the entity set generated method
          ht002set_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = ht002set_get_entity
                         es_response_context = es_response_context
          ).

        IF ht002set_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = ht002set_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_CurrencySet
*-------------------------------------------------------------------------*
      WHEN 'VH_CurrencySet'.
*     Call the entity set generated method
          vh_currencyset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = vh_currencyset_get_entity
                         es_response_context = es_response_context
          ).

        IF vh_currencyset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = vh_currencyset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_TransactionTypeSet
*-------------------------------------------------------------------------*
      WHEN 'VH_TransactionTypeSet'.
*     Call the entity set generated method
          vh_transactionty_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = vh_transactionty_get_entity
                         es_response_context = es_response_context
          ).

        IF vh_transactionty_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = vh_transactionty_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.

      WHEN OTHERS.
        super->/iwbep/if_mgw_appl_srv_runtime~get_entity(
           EXPORTING
             iv_entity_name = iv_entity_name
             iv_entity_set_name = iv_entity_set_name
             iv_source_name = iv_source_name
             it_key_tab = it_key_tab
             it_navigation_path = it_navigation_path
          IMPORTING
            er_entity = er_entity
    ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TMP_ENTITYSET_BASE
*&* This class has been generated on 20.08.2020 17:56:58 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZRT_006_WALLET_DPC_EXT
*&-----------------------------------------------------------------------------------------------*
 DATA walletdataset_get_entityset TYPE zcl_zrt_006_wallet_mpc=>tt_walletdata.
 DATA zrt006shdealerid_get_entityset TYPE zcl_zrt_006_wallet_mpc=>tt_vh_dealerid.
 DATA ht002set_get_entityset TYPE zcl_zrt_006_wallet_mpc=>tt_vh_language.
 DATA vh_currencyset_get_entityset TYPE zcl_zrt_006_wallet_mpc=>tt_vh_currency.
 DATA vh_transactionty_get_entityset TYPE zcl_zrt_006_wallet_mpc=>tt_vh_transactiontype.
 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  WalletdataSet
*-------------------------------------------------------------------------*
   WHEN 'WalletdataSet'.
*     Call the entity set generated method
      walletdataset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = walletdataset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = walletdataset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_DealerIdSet
*-------------------------------------------------------------------------*
   WHEN 'VH_DealerIdSet'.
*     Call the entity set generated method
      zrt006shdealerid_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = zrt006shdealerid_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = zrt006shdealerid_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_LanguageSet
*-------------------------------------------------------------------------*
   WHEN 'VH_LanguageSet'.
*     Call the entity set generated method
      ht002set_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = ht002set_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = ht002set_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_CurrencySet
*-------------------------------------------------------------------------*
   WHEN 'VH_CurrencySet'.
*     Call the entity set generated method
      vh_currencyset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = vh_currencyset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = vh_currencyset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  VH_TransactionTypeSet
*-------------------------------------------------------------------------*
   WHEN 'VH_TransactionTypeSet'.
*     Call the entity set generated method
      vh_transactionty_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = vh_transactionty_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = vh_transactionty_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

    WHEN OTHERS.
      super->/iwbep/if_mgw_appl_srv_runtime~get_entityset(
        EXPORTING
          iv_entity_name = iv_entity_name
          iv_entity_set_name = iv_entity_set_name
          iv_source_name = iv_source_name
          it_filter_select_options = it_filter_select_options
          it_order = it_order
          is_paging = is_paging
          it_navigation_path = it_navigation_path
          it_key_tab = it_key_tab
          iv_filter_string = iv_filter_string
          iv_search_string = iv_search_string
          io_tech_request_context = io_tech_request_context
       IMPORTING
         er_entityset = er_entityset ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_UPD_ENTITY_BASE
*&* This class has been generated on 20.08.2020 17:56:58 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZRT_006_WALLET_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA vh_transactionty_update_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_transactiontype.
 DATA vh_currencyset_update_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_currency.
 DATA ht002set_update_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_language.
 DATA zrt006shdealerid_update_entity TYPE zcl_zrt_006_wallet_mpc=>ts_vh_dealerid.
 DATA walletdataset_update_entity TYPE zcl_zrt_006_wallet_mpc=>ts_walletdata.
 DATA lv_entityset_name TYPE string.
 DATA lr_entity TYPE REF TO data. "#EC NEEDED

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_TransactionTypeSet
*-------------------------------------------------------------------------*
      WHEN 'VH_TransactionTypeSet'.
*     Call the entity set generated method
          vh_transactionty_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = vh_transactionty_update_entity
          ).
       IF vh_transactionty_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = vh_transactionty_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_CurrencySet
*-------------------------------------------------------------------------*
      WHEN 'VH_CurrencySet'.
*     Call the entity set generated method
          vh_currencyset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = vh_currencyset_update_entity
          ).
       IF vh_currencyset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = vh_currencyset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_LanguageSet
*-------------------------------------------------------------------------*
      WHEN 'VH_LanguageSet'.
*     Call the entity set generated method
          ht002set_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = ht002set_update_entity
          ).
       IF ht002set_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = ht002set_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  VH_DealerIdSet
*-------------------------------------------------------------------------*
      WHEN 'VH_DealerIdSet'.
*     Call the entity set generated method
          zrt006shdealerid_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = zrt006shdealerid_update_entity
          ).
       IF zrt006shdealerid_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = zrt006shdealerid_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  WalletdataSet
*-------------------------------------------------------------------------*
      WHEN 'WalletdataSet'.
*     Call the entity set generated method
          walletdataset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = walletdataset_update_entity
          ).
       IF walletdataset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = walletdataset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
      WHEN OTHERS.
        super->/iwbep/if_mgw_appl_srv_runtime~update_entity(
           EXPORTING
             iv_entity_name = iv_entity_name
             iv_entity_set_name = iv_entity_set_name
             iv_source_name = iv_source_name
             io_data_provider   = io_data_provider
             it_key_tab = it_key_tab
             it_navigation_path = it_navigation_path
          IMPORTING
            er_entity = er_entity
    ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~COMMIT_WORK.
* Call RFC commit work functionality
DATA lt_message      TYPE bapiret2. "#EC NEEDED
DATA lv_message_text TYPE BAPI_MSG.
DATA lo_logger       TYPE REF TO /iwbep/cl_cos_logger.
DATA lv_subrc        TYPE syst-subrc.

lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).

  IF iv_rfc_dest IS INITIAL OR iv_rfc_dest EQ 'NONE'.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
      wait   = abap_true
    IMPORTING
      return = lt_message.
  ELSE.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      DESTINATION iv_rfc_dest
    EXPORTING
      wait                  = abap_true
    IMPORTING
      return                = lt_message
    EXCEPTIONS
      communication_failure = 1000 MESSAGE lv_message_text
      system_failure        = 1001 MESSAGE lv_message_text
      OTHERS                = 1002.

  IF sy-subrc <> 0.
    lv_subrc = sy-subrc.
    /iwbep/cl_sb_gen_dpc_rt_util=>rfc_exception_handling(
        EXPORTING
          iv_subrc            = lv_subrc
          iv_exp_message_text = lv_message_text
          io_logger           = lo_logger ).
  ENDIF.
  ENDIF.
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~GET_GENERATION_STRATEGY.
* Get generation strategy
  rv_generation_strategy = '1'.
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~LOG_MESSAGE.
* Log message in the application log
DATA lo_logger TYPE REF TO /iwbep/cl_cos_logger.
DATA lv_text TYPE /iwbep/sup_msg_longtext.

  MESSAGE ID iv_msg_id TYPE iv_msg_type NUMBER iv_msg_number
    WITH iv_msg_v1 iv_msg_v2 iv_msg_v3 iv_msg_v4 INTO lv_text.

  lo_logger = mo_context->get_logger( ).
  lo_logger->log_message(
    EXPORTING
     iv_msg_type   = iv_msg_type
     iv_msg_id     = iv_msg_id
     iv_msg_number = iv_msg_number
     iv_msg_text   = lv_text
     iv_msg_v1     = iv_msg_v1
     iv_msg_v2     = iv_msg_v2
     iv_msg_v3     = iv_msg_v3
     iv_msg_v4     = iv_msg_v4
     iv_agent      = 'DPC' ).
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_EXCEPTION_HANDLING.
* RFC call exception handling
DATA lo_logger  TYPE REF TO /iwbep/cl_cos_logger.

lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).

/iwbep/cl_sb_gen_dpc_rt_util=>rfc_exception_handling(
  EXPORTING
    iv_subrc            = iv_subrc
    iv_exp_message_text = iv_exp_message_text
    io_logger           = lo_logger ).
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_SAVE_LOG.
  DATA lo_logger  TYPE REF TO /iwbep/cl_cos_logger.
  DATA lo_message_container TYPE REF TO /iwbep/if_message_container.

  lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).
  lo_message_container = /iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

  " Save the RFC call log in the application log
  /iwbep/cl_sb_gen_dpc_rt_util=>rfc_save_log(
    EXPORTING
      is_return            = is_return
      iv_entity_type       = iv_entity_type
      it_return            = it_return
      it_key_tab           = it_key_tab
      io_logger            = lo_logger
      io_message_container = lo_message_container ).
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~SET_INJECTION.
* Unit test injection
  IF io_unit IS BOUND.
    mo_injection = io_unit.
  ELSE.
    mo_injection = me.
  ENDIF.
  endmethod.


  method /IWBEP/IF_SB_GENDPC_SHLP_DATA~GET_SEARCH_HELP_VALUES.
* Call to Search Help run time mechanism to get values
  DATA lo_sh_data TYPE REF TO /iwbep/if_sb_shlp_data.

  CLEAR: et_return_list, es_message.
  lo_sh_data = /iwbep/cl_sb_shlp_data_factory=>get_sh_data_obj( ).

  lo_sh_data->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
    EXPORTING
      iv_shlp_name  = iv_shlp_name
      iv_maxrows  = iv_maxrows
      iv_sort = iv_sort
      iv_call_shlt_exit = iv_call_shlt_exit
      it_selopt = it_selopt
    IMPORTING
      et_return_list = et_return_list
      es_message = es_message ).
  endmethod.


  method CHECK_SUBSCRIPTION_AUTHORITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CHECK_SUBSCRIPTION_AUTHORITY'.
  endmethod.


  method HT002SET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'HT002SET_CREATE_ENTITY'.
  endmethod.


  method HT002SET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'HT002SET_DELETE_ENTITY'.
  endmethod.


  method HT002SET_GET_ENTITY.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lv_max_hits TYPE i VALUE 1.
DATA ls_converted_keys LIKE er_entity.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA lv_source_entity_set_name TYPE string.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get key table information - for direct call
io_tech_request_context->get_converted_keys(
  IMPORTING
    es_key_values = ls_converted_keys ).

* Maps key fields to function module parameters

lv_source_entity_set_name = io_tech_request_context->get_source_entity_set_name( ).

ls_selopt-sign = 'I'.
ls_selopt-option = 'EQ'.
ls_selopt-low = ls_converted_keys-spras.
ls_selopt-shlpfield = 'SPRAS'.
ls_selopt-shlpname = 'H_T002'.
APPEND ls_selopt TO lt_selopt.
CLEAR ls_selopt.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'H_T002'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR er_entity.
LOOP AT lt_result_list INTO ls_result_list.

  " Move SH results to GW request responce table
  CASE ls_result_list-field_name.
    WHEN 'SPRAS'.
      er_entity-spras = ls_result_list-field_value.
    WHEN 'SPTXT'.
      er_entity-sptxt = ls_result_list-field_value.
  ENDCASE.

ENDLOOP.

  endmethod.


  method HT002SET_GET_ENTITYSET.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lo_filter TYPE  REF TO /iwbep/if_mgw_req_filter.
DATA lt_filter_select_options TYPE /iwbep/t_mgw_select_option.
DATA lv_filter_str TYPE string.
DATA lv_max_hits TYPE i.
DATA ls_paging TYPE /iwbep/s_mgw_paging.
DATA ls_converted_keys LIKE LINE OF et_entityset.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA ls_filter TYPE /iwbep/s_mgw_select_option.
DATA ls_filter_range TYPE /iwbep/s_cod_select_option.
DATA lr_sptxt LIKE RANGE OF ls_converted_keys-sptxt.
DATA ls_sptxt LIKE LINE OF lr_sptxt.
DATA lr_spras LIKE RANGE OF ls_converted_keys-spras.
DATA ls_spras LIKE LINE OF lr_spras.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA lv_next TYPE i VALUE 1.
DATA ls_entityset LIKE LINE OF et_entityset.
DATA ls_result_list_next LIKE LINE OF lt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get filter or select option information
lo_filter = io_tech_request_context->get_filter( ).
lt_filter_select_options = lo_filter->get_filter_select_options( ).
lv_filter_str = lo_filter->get_filter_string( ).

* Check if the supplied filter is supported by standard gateway runtime process
IF  lv_filter_str            IS NOT INITIAL
AND lt_filter_select_options IS INITIAL.
  " If the string of the Filter System Query Option is not automatically converted into
  " filter option table (lt_filter_select_options), then the filtering combination is not supported
  " Log message in the application log
  me->/iwbep/if_sb_dpc_comm_services~log_message(
    EXPORTING
      iv_msg_type   = 'E'
      iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
      iv_msg_number = 025 ).
  " Raise Exception
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
    EXPORTING
      textid = /iwbep/cx_mgw_tech_exception=>internal_error.
ENDIF.

* Get key table information
io_tech_request_context->get_converted_source_keys(
  IMPORTING
    es_key_values  = ls_converted_keys ).

ls_paging-top = io_tech_request_context->get_top( ).
ls_paging-skip = io_tech_request_context->get_skip( ).

" Calculate the number of max hits to be fetched from the function module
" The lv_max_hits value is a summary of the Top and Skip values
IF ls_paging-top > 0.
  lv_max_hits = is_paging-top + is_paging-skip.
ENDIF.

* Maps filter table lines to the Search Help select option table
LOOP AT lt_filter_select_options INTO ls_filter.

  CASE ls_filter-property.
    WHEN 'SPTXT'.              " Equivalent to 'Sptxt' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_sptxt ).

      LOOP AT lr_sptxt INTO ls_sptxt.
        ls_selopt-high = ls_sptxt-high.
        ls_selopt-low = ls_sptxt-low.
        ls_selopt-option = ls_sptxt-option.
        ls_selopt-sign = ls_sptxt-sign.
        ls_selopt-shlpfield = 'SPTXT'.
        ls_selopt-shlpname = 'H_T002'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'SPRAS'.              " Equivalent to 'Spras' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_spras ).

      LOOP AT lr_spras INTO ls_spras.
        ls_selopt-high = ls_spras-high.
        ls_selopt-low = ls_spras-low.
        ls_selopt-option = ls_spras-option.
        ls_selopt-sign = ls_spras-sign.
        ls_selopt-shlpfield = 'SPRAS'.
        ls_selopt-shlpname = 'H_T002'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.

    WHEN OTHERS.
      " Log message in the application log
      me->/iwbep/if_sb_dpc_comm_services~log_message(
        EXPORTING
          iv_msg_type   = 'E'
          iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
          iv_msg_number = 020
          iv_msg_v1     = ls_filter-property ).
      " Raise Exception
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>internal_error.
  ENDCASE.
ENDLOOP.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'H_T002'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR et_entityset.

LOOP AT lt_result_list INTO ls_result_list
  WHERE record_number > ls_paging-skip.

  " Move SH results to GW request responce table
  lv_next = sy-tabix + 1. " next loop iteration
  CASE ls_result_list-field_name.
    WHEN 'SPRAS'.
      ls_entityset-spras = ls_result_list-field_value.
    WHEN 'SPTXT'.
      ls_entityset-sptxt = ls_result_list-field_value.
  ENDCASE.

  " Check if the next line in the result list is a new record
  READ TABLE lt_result_list INTO ls_result_list_next INDEX lv_next.
  IF sy-subrc <> 0
  OR ls_result_list-record_number <> ls_result_list_next-record_number.
    " Save the collected SH result in the GW request table
    APPEND ls_entityset TO et_entityset.
    CLEAR: ls_result_list_next, ls_entityset.
  ENDIF.

ENDLOOP.

  endmethod.


  method HT002SET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'HT002SET_UPDATE_ENTITY'.
  endmethod.


  method VH_CURRENCYSET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'VH_CURRENCYSET_CREATE_ENTITY'.
  endmethod.


  method VH_CURRENCYSET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'VH_CURRENCYSET_DELETE_ENTITY'.
  endmethod.


  method VH_CURRENCYSET_GET_ENTITY.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lv_max_hits TYPE i VALUE 1.
DATA ls_converted_keys LIKE er_entity.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA lv_source_entity_set_name TYPE string.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get key table information - for direct call
io_tech_request_context->get_converted_keys(
  IMPORTING
    es_key_values = ls_converted_keys ).

* Maps key fields to function module parameters

lv_source_entity_set_name = io_tech_request_context->get_source_entity_set_name( ).

ls_selopt-sign = 'I'.
ls_selopt-option = 'EQ'.
ls_selopt-low = ls_converted_keys-waers.
ls_selopt-shlpfield = 'WAERS'.
ls_selopt-shlpname = 'H_TCURC'.
APPEND ls_selopt TO lt_selopt.
CLEAR ls_selopt.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'H_TCURC'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR er_entity.
LOOP AT lt_result_list INTO ls_result_list.

  " Move SH results to GW request responce table
  CASE ls_result_list-field_name.
    WHEN 'LTEXT'.
      er_entity-ltext = ls_result_list-field_value.
    WHEN 'WAERS'.
      er_entity-waers = ls_result_list-field_value.
  ENDCASE.

ENDLOOP.

  endmethod.


  method VH_CURRENCYSET_GET_ENTITYSET.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lo_filter TYPE  REF TO /iwbep/if_mgw_req_filter.
DATA lt_filter_select_options TYPE /iwbep/t_mgw_select_option.
DATA lv_filter_str TYPE string.
DATA lv_max_hits TYPE i.
DATA ls_paging TYPE /iwbep/s_mgw_paging.
DATA ls_converted_keys LIKE LINE OF et_entityset.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA ls_filter TYPE /iwbep/s_mgw_select_option.
DATA ls_filter_range TYPE /iwbep/s_cod_select_option.
DATA lr_ltext LIKE RANGE OF ls_converted_keys-ltext.
DATA ls_ltext LIKE LINE OF lr_ltext.
DATA lr_waers LIKE RANGE OF ls_converted_keys-waers.
DATA ls_waers LIKE LINE OF lr_waers.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA lv_next TYPE i VALUE 1.
DATA ls_entityset LIKE LINE OF et_entityset.
DATA ls_result_list_next LIKE LINE OF lt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get filter or select option information
lo_filter = io_tech_request_context->get_filter( ).
lt_filter_select_options = lo_filter->get_filter_select_options( ).
lv_filter_str = lo_filter->get_filter_string( ).

* Check if the supplied filter is supported by standard gateway runtime process
IF  lv_filter_str            IS NOT INITIAL
AND lt_filter_select_options IS INITIAL.
  " If the string of the Filter System Query Option is not automatically converted into
  " filter option table (lt_filter_select_options), then the filtering combination is not supported
  " Log message in the application log
  me->/iwbep/if_sb_dpc_comm_services~log_message(
    EXPORTING
      iv_msg_type   = 'E'
      iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
      iv_msg_number = 025 ).
  " Raise Exception
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
    EXPORTING
      textid = /iwbep/cx_mgw_tech_exception=>internal_error.
ENDIF.

* Get key table information
io_tech_request_context->get_converted_source_keys(
  IMPORTING
    es_key_values  = ls_converted_keys ).

ls_paging-top = io_tech_request_context->get_top( ).
ls_paging-skip = io_tech_request_context->get_skip( ).

" Calculate the number of max hits to be fetched from the function module
" The lv_max_hits value is a summary of the Top and Skip values
IF ls_paging-top > 0.
  lv_max_hits = is_paging-top + is_paging-skip.
ENDIF.

* Maps filter table lines to the Search Help select option table
LOOP AT lt_filter_select_options INTO ls_filter.

  CASE ls_filter-property.
    WHEN 'LTEXT'.              " Equivalent to 'Ltext' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_ltext ).

      LOOP AT lr_ltext INTO ls_ltext.
        ls_selopt-high = ls_ltext-high.
        ls_selopt-low = ls_ltext-low.
        ls_selopt-option = ls_ltext-option.
        ls_selopt-sign = ls_ltext-sign.
        ls_selopt-shlpfield = 'LTEXT'.
        ls_selopt-shlpname = 'H_TCURC'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'WAERS'.              " Equivalent to 'Waers' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_waers ).

      LOOP AT lr_waers INTO ls_waers.
        ls_selopt-high = ls_waers-high.
        ls_selopt-low = ls_waers-low.
        ls_selopt-option = ls_waers-option.
        ls_selopt-sign = ls_waers-sign.
        ls_selopt-shlpfield = 'WAERS'.
        ls_selopt-shlpname = 'H_TCURC'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.

    WHEN OTHERS.
      " Log message in the application log
      me->/iwbep/if_sb_dpc_comm_services~log_message(
        EXPORTING
          iv_msg_type   = 'E'
          iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
          iv_msg_number = 020
          iv_msg_v1     = ls_filter-property ).
      " Raise Exception
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>internal_error.
  ENDCASE.
ENDLOOP.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'H_TCURC'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR et_entityset.

LOOP AT lt_result_list INTO ls_result_list
  WHERE record_number > ls_paging-skip.

  " Move SH results to GW request responce table
  lv_next = sy-tabix + 1. " next loop iteration
  CASE ls_result_list-field_name.
    WHEN 'LTEXT'.
      ls_entityset-ltext = ls_result_list-field_value.
    WHEN 'WAERS'.
      ls_entityset-waers = ls_result_list-field_value.
  ENDCASE.

  " Check if the next line in the result list is a new record
  READ TABLE lt_result_list INTO ls_result_list_next INDEX lv_next.
  IF sy-subrc <> 0
  OR ls_result_list-record_number <> ls_result_list_next-record_number.
    " Save the collected SH result in the GW request table
    APPEND ls_entityset TO et_entityset.
    CLEAR: ls_result_list_next, ls_entityset.
  ENDIF.

ENDLOOP.

  endmethod.


  method VH_CURRENCYSET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'VH_CURRENCYSET_UPDATE_ENTITY'.
  endmethod.


  method VH_TRANSACTIONTY_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'VH_TRANSACTIONTY_CREATE_ENTITY'.
  endmethod.


  method VH_TRANSACTIONTY_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'VH_TRANSACTIONTY_DELETE_ENTITY'.
  endmethod.


  method VH_TRANSACTIONTY_GET_ENTITY.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lv_max_hits TYPE i VALUE 1.
DATA ls_converted_keys LIKE er_entity.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA lv_source_entity_set_name TYPE string.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get key table information - for direct call
io_tech_request_context->get_converted_keys(
  IMPORTING
    es_key_values = ls_converted_keys ).

* Maps key fields to function module parameters

lv_source_entity_set_name = io_tech_request_context->get_source_entity_set_name( ).

ls_selopt-sign = 'I'.
ls_selopt-option = 'EQ'.
ls_selopt-low = ls_converted_keys-prio.
ls_selopt-shlpfield = 'PRIO'.
ls_selopt-shlpname = 'ZRT_006_SH_TRANSACTION_TYPE'.
APPEND ls_selopt TO lt_selopt.
CLEAR ls_selopt.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'ZRT_006_SH_TRANSACTION_TYPE'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR er_entity.
LOOP AT lt_result_list INTO ls_result_list.

  " Move SH results to GW request responce table
  CASE ls_result_list-field_name.
    WHEN 'PRIO'.
      er_entity-prio = ls_result_list-field_value.
    WHEN 'VALUE'.
      er_entity-value = ls_result_list-field_value.
  ENDCASE.

ENDLOOP.

  endmethod.


  method VH_TRANSACTIONTY_GET_ENTITYSET.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lo_filter TYPE  REF TO /iwbep/if_mgw_req_filter.
DATA lt_filter_select_options TYPE /iwbep/t_mgw_select_option.
DATA lv_filter_str TYPE string.
DATA lv_max_hits TYPE i.
DATA ls_paging TYPE /iwbep/s_mgw_paging.
DATA ls_converted_keys LIKE LINE OF et_entityset.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA ls_filter TYPE /iwbep/s_mgw_select_option.
DATA ls_filter_range TYPE /iwbep/s_cod_select_option.
DATA lr_value LIKE RANGE OF ls_converted_keys-value.
DATA ls_value LIKE LINE OF lr_value.
DATA lr_prio LIKE RANGE OF ls_converted_keys-prio.
DATA ls_prio LIKE LINE OF lr_prio.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA lv_next TYPE i VALUE 1.
DATA ls_entityset LIKE LINE OF et_entityset.
DATA ls_result_list_next LIKE LINE OF lt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get filter or select option information
lo_filter = io_tech_request_context->get_filter( ).
lt_filter_select_options = lo_filter->get_filter_select_options( ).
lv_filter_str = lo_filter->get_filter_string( ).

* Check if the supplied filter is supported by standard gateway runtime process
IF  lv_filter_str            IS NOT INITIAL
AND lt_filter_select_options IS INITIAL.
  " If the string of the Filter System Query Option is not automatically converted into
  " filter option table (lt_filter_select_options), then the filtering combination is not supported
  " Log message in the application log
  me->/iwbep/if_sb_dpc_comm_services~log_message(
    EXPORTING
      iv_msg_type   = 'E'
      iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
      iv_msg_number = 025 ).
  " Raise Exception
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
    EXPORTING
      textid = /iwbep/cx_mgw_tech_exception=>internal_error.
ENDIF.

* Get key table information
io_tech_request_context->get_converted_source_keys(
  IMPORTING
    es_key_values  = ls_converted_keys ).

ls_paging-top = io_tech_request_context->get_top( ).
ls_paging-skip = io_tech_request_context->get_skip( ).

" Calculate the number of max hits to be fetched from the function module
" The lv_max_hits value is a summary of the Top and Skip values
IF ls_paging-top > 0.
  lv_max_hits = is_paging-top + is_paging-skip.
ENDIF.

* Maps filter table lines to the Search Help select option table
LOOP AT lt_filter_select_options INTO ls_filter.

  CASE ls_filter-property.
    WHEN 'VALUE'.              " Equivalent to 'Value' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_value ).

      LOOP AT lr_value INTO ls_value.
        ls_selopt-high = ls_value-high.
        ls_selopt-low = ls_value-low.
        ls_selopt-option = ls_value-option.
        ls_selopt-sign = ls_value-sign.
        ls_selopt-shlpfield = 'VALUE'.
        ls_selopt-shlpname = 'ZRT_006_SH_TRANSACTION_TYPE'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'PRIO'.              " Equivalent to 'Prio' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_prio ).

      LOOP AT lr_prio INTO ls_prio.
        ls_selopt-high = ls_prio-high.
        ls_selopt-low = ls_prio-low.
        ls_selopt-option = ls_prio-option.
        ls_selopt-sign = ls_prio-sign.
        ls_selopt-shlpfield = 'PRIO'.
        ls_selopt-shlpname = 'ZRT_006_SH_TRANSACTION_TYPE'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.

    WHEN OTHERS.
      " Log message in the application log
      me->/iwbep/if_sb_dpc_comm_services~log_message(
        EXPORTING
          iv_msg_type   = 'E'
          iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
          iv_msg_number = 020
          iv_msg_v1     = ls_filter-property ).
      " Raise Exception
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>internal_error.
  ENDCASE.
ENDLOOP.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'ZRT_006_SH_TRANSACTION_TYPE'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR et_entityset.

LOOP AT lt_result_list INTO ls_result_list
  WHERE record_number > ls_paging-skip.

  " Move SH results to GW request responce table
  lv_next = sy-tabix + 1. " next loop iteration
  CASE ls_result_list-field_name.
    WHEN 'PRIO'.
      ls_entityset-prio = ls_result_list-field_value.
    WHEN 'VALUE'.
      ls_entityset-value = ls_result_list-field_value.
  ENDCASE.

  " Check if the next line in the result list is a new record
  READ TABLE lt_result_list INTO ls_result_list_next INDEX lv_next.
  IF sy-subrc <> 0
  OR ls_result_list-record_number <> ls_result_list_next-record_number.
    " Save the collected SH result in the GW request table
    APPEND ls_entityset TO et_entityset.
    CLEAR: ls_result_list_next, ls_entityset.
  ENDIF.

ENDLOOP.

  endmethod.


  method VH_TRANSACTIONTY_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'VH_TRANSACTIONTY_UPDATE_ENTITY'.
  endmethod.


  method WALLETDATASET_CREATE_ENTITY.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
 DATA return  TYPE zif_zrt_006_wallet_create=>__bapiret2.
 DATA walletdata  TYPE zif_zrt_006_wallet_create=>__zrt_006_t_wlt_i.
 DATA ls_return  TYPE LINE OF zif_zrt_006_wallet_create=>__bapiret2.
 DATA ls_walletdata  TYPE LINE OF zif_zrt_006_wallet_create=>__zrt_006_t_wlt_i.
 DATA lv_rfc_name TYPE tfdir-funcname.
 DATA lv_destination TYPE rfcdest.
 DATA lv_subrc TYPE syst-subrc.
 DATA lv_exc_msg TYPE /iwbep/mgw_bop_rfc_excep_text.
 DATA lx_root TYPE REF TO cx_root.
 DATA ls_request_input_data TYPE zcl_zrt_006_wallet_mpc=>ts_walletdata.
 DATA ls_entity TYPE REF TO data.
 DATA lo_tech_read_request_context TYPE REF TO /iwbep/cl_sb_gen_read_aftr_crt.
 DATA ls_key TYPE /iwbep/s_mgw_tech_pair.
 DATA lt_keys TYPE /iwbep/t_mgw_tech_pairs.
 DATA lv_entityset_name TYPE string.
 DATA lv_entity_name TYPE string.
 FIELD-SYMBOLS: <ls_data> TYPE any.
 DATA ls_converted_keys LIKE er_entity.
 DATA lo_dp_facade TYPE REF TO /iwbep/if_mgw_dp_facade.

*-------------------------------------------------------------
*  Map the runtime request to the RFC - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get request input data
 io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

* Map request input fields to function module parameters
 ls_walletdata-slip_number = ls_request_input_data-slip_number.
 ls_walletdata-transaction_date = ls_request_input_data-transaction_date.
 ls_walletdata-waerk = ls_request_input_data-waerk.
 ls_walletdata-amount = ls_request_input_data-amount.
 ls_walletdata-sign = ls_request_input_data-sign.
 ls_walletdata-statu = ls_request_input_data-statu.
 ls_walletdata-dealer_id = ls_request_input_data-dealer_id.
 ls_walletdata-transaction_type = ls_request_input_data-transaction_type.
 ls_walletdata-transaction_no = ls_request_input_data-transaction_no.

* Append lines of table parameters in the function call
 IF ls_walletdata IS NOT INITIAL.
   APPEND ls_walletdata TO walletdata.
 ENDIF.

* Get RFC destination
 lo_dp_facade = /iwbep/if_mgw_conv_srv_runtime~get_dp_facade( ).
 lv_destination = /iwbep/cl_sb_gen_dpc_rt_util=>get_rfc_destination( io_dp_facade = lo_dp_facade ).

*-------------------------------------------------------------
*  Call RFC function module
*-------------------------------------------------------------
 lv_rfc_name = 'ZRT_006_WALLET_CREATE'.

 IF lv_destination IS INITIAL OR lv_destination EQ 'NONE'.

   TRY.
       CALL FUNCTION lv_rfc_name
         TABLES
           return         = return
           walletdata     = walletdata
         EXCEPTIONS
           system_failure = 1000 message lv_exc_msg
           OTHERS         = 1002.

       lv_subrc = sy-subrc.
*in case of co-deployment the exception is raised and needs to be caught
     CATCH cx_root INTO lx_root.
       lv_subrc = 1001.
       lv_exc_msg = lx_root->if_message~get_text( ).
   ENDTRY.

 ELSE.

   CALL FUNCTION lv_rfc_name DESTINATION lv_destination
     TABLES
       return                = return
       walletdata            = walletdata
     EXCEPTIONS
       system_failure        = 1000 MESSAGE lv_exc_msg
       communication_failure = 1001 MESSAGE lv_exc_msg
       OTHERS                = 1002.

   lv_subrc = sy-subrc.

 ENDIF.

*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------
 IF lv_subrc <> 0.
* Execute the RFC exception handling process
   me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
     EXPORTING
       iv_subrc            = lv_subrc
       iv_exp_message_text = lv_exc_msg ).
 ENDIF.

 IF return IS NOT INITIAL.
   me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
     EXPORTING
       iv_entity_type = iv_entity_name
       it_return      = return
       it_key_tab     = it_key_tab ).
 ENDIF.

* Call RFC commit work
 me->/iwbep/if_sb_dpc_comm_services~commit_work(
        EXPORTING
          iv_rfc_dest = lv_destination
     ) .
*-------------------------------------------------------------------------*
*             - Read After Create -
*-------------------------------------------------------------------------*
 CREATE OBJECT lo_tech_read_request_context.

 READ TABLE walletdata INTO ls_walletdata INDEX 1.
* Create key table for the read operation

 ls_key-name = 'TRANSACTION_NO'.
 ls_key-value = ls_walletdata-transaction_no.
 IF ls_key-value IS NOT INITIAL.
   APPEND ls_key TO lt_keys.
 ENDIF.

* Set into request context object the key table and the entity set name
 lo_tech_read_request_context->set_keys( EXPORTING  it_keys = lt_keys ).
 lv_entityset_name = io_tech_request_context->get_entity_set_name( ).
 lo_tech_read_request_context->set_entityset_name( EXPORTING iv_entityset_name = lv_entityset_name ).
 lv_entity_name = io_tech_request_context->get_entity_type_name( ).
 lo_tech_read_request_context->set_entity_type_name( EXPORTING iv_entity_name = lv_entity_name ).

* Call read after create
 /iwbep/if_mgw_appl_srv_runtime~get_entity(
   EXPORTING
     iv_entity_name     = iv_entity_name
     iv_entity_set_name = iv_entity_set_name
     iv_source_name     = iv_source_name
     it_key_tab         = it_key_tab
     io_tech_request_context = lo_tech_read_request_context
     it_navigation_path = it_navigation_path
   IMPORTING
     er_entity          = ls_entity ).

* Send the read response to the caller interface
 ASSIGN ls_entity->* TO <ls_data>.
 er_entity = <ls_data>.
  endmethod.


  method WALLETDATASET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'WALLETDATASET_DELETE_ENTITY'.
  endmethod.


  method WALLETDATASET_GET_ENTITY.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
 DATA iv_transaction_no TYPE zif_zrt_006_wallet_read_entity=>zrt_006_d_trans.
 DATA walletdata TYPE zif_zrt_006_wallet_read_entity=>zrt_006_t_wlt_i.
 DATA return  TYPE zif_zrt_006_wallet_read_entity=>__bapiret2.
 DATA ls_return  TYPE LINE OF zif_zrt_006_wallet_read_entity=>__bapiret2.
 DATA lv_rfc_name TYPE tfdir-funcname.
 DATA lv_destination TYPE rfcdest.
 DATA lv_subrc TYPE syst-subrc.
 DATA lv_exc_msg TYPE /iwbep/mgw_bop_rfc_excep_text.
 DATA lx_root TYPE REF TO cx_root.
 DATA ls_converted_keys LIKE er_entity.
 DATA lv_source_entity_set_name TYPE string.
 DATA lo_dp_facade TYPE REF TO /iwbep/if_mgw_dp_facade.

*-------------------------------------------------------------
*  Map the runtime request to the RFC - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get key table information - for direct call
 io_tech_request_context->get_converted_keys(
   IMPORTING
     es_key_values = ls_converted_keys ).

* Maps key fields to function module parameters

 lv_source_entity_set_name = io_tech_request_context->get_source_entity_set_name( ).

 IF lv_source_entity_set_name = 'WalletdataSet' AND
    lv_source_entity_set_name NE io_tech_request_context->get_entity_set_name( ).

   io_tech_request_context->get_converted_source_keys(
   IMPORTING es_key_values = ls_converted_keys ).

 ENDIF.

 iv_transaction_no = ls_converted_keys-transaction_no.
* Get RFC destination
 lo_dp_facade = /iwbep/if_mgw_conv_srv_runtime~get_dp_facade( ).
 lv_destination = /iwbep/cl_sb_gen_dpc_rt_util=>get_rfc_destination( io_dp_facade = lo_dp_facade ).

*-------------------------------------------------------------
*  Call RFC function module
*-------------------------------------------------------------
 lv_rfc_name = 'ZRT_006_WALLET_READ_ENTITY'.

 IF lv_destination IS INITIAL OR lv_destination EQ 'NONE'.

   TRY.
       CALL FUNCTION lv_rfc_name
         EXPORTING
           iv_transaction_no = iv_transaction_no
         IMPORTING
           walletdata        = walletdata
         TABLES
           return            = return
         EXCEPTIONS
           system_failure    = 1000 message lv_exc_msg
           OTHERS            = 1002.

       lv_subrc = sy-subrc.
*in case of co-deployment the exception is raised and needs to be caught
     CATCH cx_root INTO lx_root.
       lv_subrc = 1001.
       lv_exc_msg = lx_root->if_message~get_text( ).
   ENDTRY.

 ELSE.

   CALL FUNCTION lv_rfc_name DESTINATION lv_destination
     EXPORTING
       iv_transaction_no     = iv_transaction_no
     IMPORTING
       walletdata            = walletdata
     TABLES
       return                = return
     EXCEPTIONS
       system_failure        = 1000 MESSAGE lv_exc_msg
       communication_failure = 1001 MESSAGE lv_exc_msg
       OTHERS                = 1002.

   lv_subrc = sy-subrc.

 ENDIF.

*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------
 IF lv_subrc <> 0.
* Execute the RFC exception handling process
   me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
     EXPORTING
       iv_subrc            = lv_subrc
       iv_exp_message_text = lv_exc_msg ).
 ENDIF.

 IF return IS NOT INITIAL.
   me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
     EXPORTING
       iv_entity_type = iv_entity_name
       it_return      = return
       it_key_tab     = it_key_tab ).
 ENDIF.

*-------------------------------------------------------------------------*
*             - Post Backend Call -
*-------------------------------------------------------------------------*
* Map properties from the backend to the Gateway output response structure

 er_entity-slip_number = walletdata-slip_number.
 er_entity-transaction_date = walletdata-transaction_date.
 er_entity-waerk = walletdata-waerk.
 er_entity-amount = walletdata-amount.
 er_entity-sign = walletdata-sign.
 er_entity-statu = walletdata-statu.
 er_entity-dealer_id = walletdata-dealer_id.
 er_entity-transaction_type = walletdata-transaction_type.
 er_entity-transaction_no = walletdata-transaction_no.
  endmethod.


  method WALLETDATASET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'WALLETDATASET_GET_ENTITYSET'.
  endmethod.


  method WALLETDATASET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'WALLETDATASET_UPDATE_ENTITY'.
  endmethod.


  method ZRT006SHDEALERID_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'ZRT006SHDEALERID_CREATE_ENTITY'.
  endmethod.


  method ZRT006SHDEALERID_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'ZRT006SHDEALERID_DELETE_ENTITY'.
  endmethod.


  method ZRT006SHDEALERID_GET_ENTITY.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lv_max_hits TYPE i VALUE 1.
DATA ls_converted_keys LIKE er_entity.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA lv_source_entity_set_name TYPE string.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get key table information - for direct call
io_tech_request_context->get_converted_keys(
  IMPORTING
    es_key_values = ls_converted_keys ).

* Maps key fields to function module parameters

lv_source_entity_set_name = io_tech_request_context->get_source_entity_set_name( ).

ls_selopt-sign = 'I'.
ls_selopt-option = 'EQ'.
ls_selopt-low = ls_converted_keys-dealer_id.
ls_selopt-shlpfield = 'DEALER_ID'.
ls_selopt-shlpname = 'ZRT_006_SH_DEALER_ID'.
APPEND ls_selopt TO lt_selopt.
CLEAR ls_selopt.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'ZRT_006_SH_DEALER_ID'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR er_entity.
LOOP AT lt_result_list INTO ls_result_list.

  " Move SH results to GW request responce table
  CASE ls_result_list-field_name.
    WHEN 'CITY'.
      er_entity-city = ls_result_list-field_value.
    WHEN 'COUNTRY'.
      er_entity-country = ls_result_list-field_value.
    WHEN 'DEALER_ID'.
      er_entity-dealer_id = ls_result_list-field_value.
    WHEN 'DISTRICT'.
      er_entity-district = ls_result_list-field_value.
    WHEN 'NAME_ORG1'.
      er_entity-name_org1 = ls_result_list-field_value.
    WHEN 'WERKS'.
      er_entity-werks = ls_result_list-field_value.
  ENDCASE.

ENDLOOP.

  endmethod.


  method ZRT006SHDEALERID_GET_ENTITYSET.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
DATA lo_filter TYPE  REF TO /iwbep/if_mgw_req_filter.
DATA lt_filter_select_options TYPE /iwbep/t_mgw_select_option.
DATA lv_filter_str TYPE string.
DATA lv_max_hits TYPE i.
DATA ls_paging TYPE /iwbep/s_mgw_paging.
DATA ls_converted_keys LIKE LINE OF et_entityset.
DATA ls_message TYPE bapiret2.
DATA lt_selopt TYPE ddshselops.
DATA ls_selopt LIKE LINE OF lt_selopt.
DATA ls_filter TYPE /iwbep/s_mgw_select_option.
DATA ls_filter_range TYPE /iwbep/s_cod_select_option.
DATA lr_dealer_id LIKE RANGE OF ls_converted_keys-dealer_id.
DATA ls_dealer_id LIKE LINE OF lr_dealer_id.
DATA lr_district LIKE RANGE OF ls_converted_keys-district.
DATA ls_district LIKE LINE OF lr_district.
DATA lr_city LIKE RANGE OF ls_converted_keys-city.
DATA ls_city LIKE LINE OF lr_city.
DATA lr_name_org1 LIKE RANGE OF ls_converted_keys-name_org1.
DATA ls_name_org1 LIKE LINE OF lr_name_org1.
DATA lr_werks LIKE RANGE OF ls_converted_keys-werks.
DATA ls_werks LIKE LINE OF lr_werks.
DATA lr_country LIKE RANGE OF ls_converted_keys-country.
DATA ls_country LIKE LINE OF lr_country.
DATA lt_result_list TYPE /iwbep/if_sb_gendpc_shlp_data=>tt_result_list.
DATA lv_next TYPE i VALUE 1.
DATA ls_entityset LIKE LINE OF et_entityset.
DATA ls_result_list_next LIKE LINE OF lt_result_list.
DATA ls_result_list LIKE LINE OF lt_result_list.

*-------------------------------------------------------------
*  Map the runtime request to the Search Help select option - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get filter or select option information
lo_filter = io_tech_request_context->get_filter( ).
lt_filter_select_options = lo_filter->get_filter_select_options( ).
lv_filter_str = lo_filter->get_filter_string( ).

* Check if the supplied filter is supported by standard gateway runtime process
IF  lv_filter_str            IS NOT INITIAL
AND lt_filter_select_options IS INITIAL.
  " If the string of the Filter System Query Option is not automatically converted into
  " filter option table (lt_filter_select_options), then the filtering combination is not supported
  " Log message in the application log
  me->/iwbep/if_sb_dpc_comm_services~log_message(
    EXPORTING
      iv_msg_type   = 'E'
      iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
      iv_msg_number = 025 ).
  " Raise Exception
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
    EXPORTING
      textid = /iwbep/cx_mgw_tech_exception=>internal_error.
ENDIF.

* Get key table information
io_tech_request_context->get_converted_source_keys(
  IMPORTING
    es_key_values  = ls_converted_keys ).

ls_paging-top = io_tech_request_context->get_top( ).
ls_paging-skip = io_tech_request_context->get_skip( ).

" Calculate the number of max hits to be fetched from the function module
" The lv_max_hits value is a summary of the Top and Skip values
IF ls_paging-top > 0.
  lv_max_hits = is_paging-top + is_paging-skip.
ENDIF.

* Maps filter table lines to the Search Help select option table
LOOP AT lt_filter_select_options INTO ls_filter.

  CASE ls_filter-property.
    WHEN 'DEALER_ID'.              " Equivalent to 'DealerId' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_dealer_id ).

      LOOP AT lr_dealer_id INTO ls_dealer_id.
        ls_selopt-high = ls_dealer_id-high.
        ls_selopt-low = ls_dealer_id-low.
        ls_selopt-option = ls_dealer_id-option.
        ls_selopt-sign = ls_dealer_id-sign.
        ls_selopt-shlpfield = 'DEALER_ID'.
        ls_selopt-shlpname = 'ZRT_006_SH_DEALER_ID'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'DISTRICT'.              " Equivalent to 'District' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_district ).

      LOOP AT lr_district INTO ls_district.
        ls_selopt-high = ls_district-high.
        ls_selopt-low = ls_district-low.
        ls_selopt-option = ls_district-option.
        ls_selopt-sign = ls_district-sign.
        ls_selopt-shlpfield = 'DISTRICT'.
        ls_selopt-shlpname = 'ZRT_006_SH_DEALER_ID'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'CITY'.              " Equivalent to 'City' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_city ).

      LOOP AT lr_city INTO ls_city.
        ls_selopt-high = ls_city-high.
        ls_selopt-low = ls_city-low.
        ls_selopt-option = ls_city-option.
        ls_selopt-sign = ls_city-sign.
        ls_selopt-shlpfield = 'CITY'.
        ls_selopt-shlpname = 'ZRT_006_SH_DEALER_ID'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'NAME_ORG1'.              " Equivalent to 'NameOrg1' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_name_org1 ).

      LOOP AT lr_name_org1 INTO ls_name_org1.
        ls_selopt-high = ls_name_org1-high.
        ls_selopt-low = ls_name_org1-low.
        ls_selopt-option = ls_name_org1-option.
        ls_selopt-sign = ls_name_org1-sign.
        ls_selopt-shlpfield = 'NAME_ORG1'.
        ls_selopt-shlpname = 'ZRT_006_SH_DEALER_ID'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'WERKS'.              " Equivalent to 'Werks' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_werks ).

      LOOP AT lr_werks INTO ls_werks.
        ls_selopt-high = ls_werks-high.
        ls_selopt-low = ls_werks-low.
        ls_selopt-option = ls_werks-option.
        ls_selopt-sign = ls_werks-sign.
        ls_selopt-shlpfield = 'WERKS'.
        ls_selopt-shlpname = 'ZRT_006_SH_DEALER_ID'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.
    WHEN 'COUNTRY'.              " Equivalent to 'Country' property in the service
      lo_filter->convert_select_option(
        EXPORTING
          is_select_option = ls_filter
        IMPORTING
          et_select_option = lr_country ).

      LOOP AT lr_country INTO ls_country.
        ls_selopt-high = ls_country-high.
        ls_selopt-low = ls_country-low.
        ls_selopt-option = ls_country-option.
        ls_selopt-sign = ls_country-sign.
        ls_selopt-shlpfield = 'COUNTRY'.
        ls_selopt-shlpname = 'ZRT_006_SH_DEALER_ID'.
        APPEND ls_selopt TO lt_selopt.
        CLEAR ls_selopt.
      ENDLOOP.

    WHEN OTHERS.
      " Log message in the application log
      me->/iwbep/if_sb_dpc_comm_services~log_message(
        EXPORTING
          iv_msg_type   = 'E'
          iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
          iv_msg_number = 020
          iv_msg_v1     = ls_filter-property ).
      " Raise Exception
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>internal_error.
  ENDCASE.
ENDLOOP.

*-------------------------------------------------------------
*  Call to Search Help get values mechanism
*-------------------------------------------------------------
* Get search help values
me->/iwbep/if_sb_gendpc_shlp_data~get_search_help_values(
  EXPORTING
    iv_shlp_name = 'ZRT_006_SH_DEALER_ID'
    iv_maxrows = lv_max_hits
    iv_sort = 'X'
    iv_call_shlt_exit = 'X'
    it_selopt = lt_selopt
  IMPORTING
    et_return_list = lt_result_list
    es_message = ls_message ).

*-------------------------------------------------------------
*  Map the Search Help returned results to the caller interface - Only mapped attributes
*-------------------------------------------------------------
IF ls_message IS NOT INITIAL.
* Call RFC call exception handling
  me->/iwbep/if_sb_dpc_comm_services~rfc_save_log(
    EXPORTING
      is_return      = ls_message
      iv_entity_type = iv_entity_name
      it_key_tab     = it_key_tab ).
ENDIF.

CLEAR et_entityset.

LOOP AT lt_result_list INTO ls_result_list
  WHERE record_number > ls_paging-skip.

  " Move SH results to GW request responce table
  lv_next = sy-tabix + 1. " next loop iteration
  CASE ls_result_list-field_name.
    WHEN 'CITY'.
      ls_entityset-city = ls_result_list-field_value.
    WHEN 'COUNTRY'.
      ls_entityset-country = ls_result_list-field_value.
    WHEN 'DEALER_ID'.
      ls_entityset-dealer_id = ls_result_list-field_value.
    WHEN 'DISTRICT'.
      ls_entityset-district = ls_result_list-field_value.
    WHEN 'NAME_ORG1'.
      ls_entityset-name_org1 = ls_result_list-field_value.
    WHEN 'WERKS'.
      ls_entityset-werks = ls_result_list-field_value.
  ENDCASE.

  " Check if the next line in the result list is a new record
  READ TABLE lt_result_list INTO ls_result_list_next INDEX lv_next.
  IF sy-subrc <> 0
  OR ls_result_list-record_number <> ls_result_list_next-record_number.
    " Save the collected SH result in the GW request table
    APPEND ls_entityset TO et_entityset.
    CLEAR: ls_result_list_next, ls_entityset.
  ENDIF.

ENDLOOP.

  endmethod.


  method ZRT006SHDEALERID_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'ZRT006SHDEALERID_UPDATE_ENTITY'.
  endmethod.
ENDCLASS.
