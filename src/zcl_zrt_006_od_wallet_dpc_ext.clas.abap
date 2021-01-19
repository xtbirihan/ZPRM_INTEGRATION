class ZCL_ZRT_006_OD_WALLET_DPC_EXT definition
  public
  inheriting from ZCL_ZRT_006_OD_WALLET_DPC
  create public .

public section.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END
    redefinition .
protected section.

  methods WALLETDATASET_GET_ENTITY
    redefinition .
  methods WALLETDATASET_CREATE_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZRT_006_OD_WALLET_DPC_EXT IMPLEMENTATION.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN.
**TRY.
*SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN(
*  EXPORTING
*    IT_OPERATION_INFO = IT_OPERATION_INFO
**  CHANGING
**    cv_defer_mode     = cv_defer_mode
*       ).
**  CATCH /iwbep/cx_mgw_busi_exception.
**  CATCH /iwbep/cx_mgw_tech_exception.
**ENDTRY.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END.
**TRY.
*SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END(
*       ).
**  CATCH /iwbep/cx_mgw_busi_exception.
**  CATCH /iwbep/cx_mgw_tech_exception.
**ENDTRY.
  endmethod.


  METHOD walletdataset_create_entity.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
    DATA walletdata TYPE zif_zrt_006_create_wallet=>zrt_006_t_wlt_i.
    DATA return  TYPE zif_zrt_006_create_wallet=>__bapiret2.
    DATA ls_return  TYPE LINE OF zif_zrt_006_create_wallet=>__bapiret2.
    DATA lv_rfc_name TYPE tfdir-funcname.
    DATA lv_destination TYPE rfcdest.
    DATA lv_subrc TYPE syst-subrc.
    DATA lv_exc_msg TYPE /iwbep/mgw_bop_rfc_excep_text.
    DATA lx_root TYPE REF TO cx_root.
    DATA ls_request_input_data TYPE zcl_zrt_006_od_wallet_mpc=>ts_walletdata.
    DATA ls_entity TYPE REF TO data.
    DATA lo_tech_read_request_context TYPE REF TO /iwbep/cl_sb_gen_read_aftr_crt.
    DATA ls_key TYPE /iwbep/s_mgw_tech_pair.
    DATA lt_keys TYPE /iwbep/t_mgw_tech_pairs.
    DATA lv_entityset_name TYPE string.
    DATA lv_entity_name TYPE string.
    FIELD-SYMBOLS: <ls_data> TYPE any.
    DATA ls_converted_keys LIKE er_entity.
    DATA lo_dp_facade TYPE REF TO /iwbep/if_mgw_dp_facade.
    DATA lo_message_container TYPE REF TO /iwbep/if_message_container.
    DATA: lv_transaction_no TYPE zrt_006_t_wlt_i-transaction_no.

*-------------------------------------------------------------
*  Map the runtime request to the RFC - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get request input data
    io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

* Map request input fields to function module parameters
    walletdata-slip_number = ls_request_input_data-slip_number.
    walletdata-transaction_date = ls_request_input_data-transaction_date.
    walletdata-waerk = ls_request_input_data-waerk.
    walletdata-amount = ls_request_input_data-amount.
    walletdata-sign = ls_request_input_data-sign.
    walletdata-statu = ls_request_input_data-statu.
    walletdata-dealer_id = ls_request_input_data-dealer_id.
    walletdata-transaction_type = ls_request_input_data-transaction_type.
    walletdata-transaction_no = ls_request_input_data-transaction_no.

* Get RFC destination
    lo_dp_facade = /iwbep/if_mgw_conv_srv_runtime~get_dp_facade( ).
    lv_destination = /iwbep/cl_sb_gen_dpc_rt_util=>get_rfc_destination( io_dp_facade = lo_dp_facade ).

*-------------------------------------------------------------
*  Call RFC function module
*-------------------------------------------------------------
    lv_rfc_name = 'ZRT_006_CREATE_WALLET'.

    IF lv_destination IS INITIAL OR lv_destination EQ 'NONE'.

      TRY.
          CALL FUNCTION lv_rfc_name
            EXPORTING
              walletdata        = walletdata
            IMPORTING
              ev_transaction_no = lv_transaction_no
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
          walletdata            = walletdata
        IMPORTING
          ev_transaction_no     = lv_transaction_no
        TABLES
          return                = return
        EXCEPTIONS
          system_failure        = 1000 MESSAGE lv_exc_msg
          communication_failure = 1001 MESSAGE lv_exc_msg
          OTHERS                = 1002.

      lv_subrc = sy-subrc.

    ENDIF.

    LOOP AT  return INTO ls_return  WHERE type CA 'AEX'.
      EXIT.
    ENDLOOP.
    IF sy-subrc NE 0.
      CALL METHOD me->mo_context->get_message_container
        RECEIVING
          ro_message_container = lo_message_container.
      CALL METHOD lo_message_container->add_messages_from_bapi
        EXPORTING
          it_bapi_messages          = return
          iv_add_to_response_header = abap_true.
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

* Create key table for the read operation

    ls_key-name = 'TRANSACTION_NO'.
*    ls_key-value = walletdata-transaction_no.
    ls_key-value = lv_transaction_no.
    IF ls_key IS NOT INITIAL.
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

    .
  ENDMETHOD.


  METHOD walletdataset_get_entity.
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
    DATA iv_transaction_no TYPE zif_zrt_006_wallet_read_enti1=>zrt_006_d_trans.
    DATA walletdata TYPE zif_zrt_006_wallet_read_enti1=>zrt_006_t_wlt_i.
    DATA return  TYPE zif_zrt_006_wallet_read_enti1=>__bapiret2.
    DATA ls_return  TYPE LINE OF zif_zrt_006_wallet_read_enti1=>__bapiret2.
    DATA lv_rfc_name TYPE tfdir-funcname.
    DATA lv_destination TYPE rfcdest.
    DATA lv_subrc TYPE syst-subrc.
    DATA lv_exc_msg TYPE /iwbep/mgw_bop_rfc_excep_text.
    DATA lx_root TYPE REF TO cx_root.
    DATA ls_converted_keys LIKE er_entity.
    DATA lv_source_entity_set_name TYPE string.
    DATA htcurcset_get_entity TYPE zcl_zrt_006_od_wallet_mpc=>ts_htcurc.
    DATA zrt006shdealerid_get_entity TYPE zcl_zrt_006_od_wallet_mpc=>ts_zrt006shdealerid.
    DATA zrt006shtransact_get_entity TYPE zcl_zrt_006_od_wallet_mpc=>ts_zrt006shtransactiontype.
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

    IF  lv_source_entity_set_name = 'HTcurcSet'.
      " Convert keys to appropriate entity set structure
      io_tech_request_context->get_converted_source_keys(
        IMPORTING
          es_key_values  = htcurcset_get_entity ).

    ENDIF.

    IF  lv_source_entity_set_name = 'Zrt006ShDealerIdSet'.
      " Convert keys to appropriate entity set structure
      io_tech_request_context->get_converted_source_keys(
        IMPORTING
          es_key_values  = zrt006shdealerid_get_entity ).

    ENDIF.

    IF  lv_source_entity_set_name = 'Zrt006ShTransactionTypeSet'.
      " Convert keys to appropriate entity set structure
      io_tech_request_context->get_converted_source_keys(
        IMPORTING
          es_key_values  = zrt006shtransact_get_entity ).

    ELSEIF lv_source_entity_set_name IS INITIAL
    OR     ls_converted_keys IS NOT INITIAL.

      iv_transaction_no = ls_converted_keys-transaction_no.
    ENDIF.

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

    er_entity-transaction_type = walletdata-transaction_type.
    er_entity-dealer_id = walletdata-dealer_id.
    er_entity-statu = walletdata-statu.
    er_entity-sign = walletdata-sign.
    er_entity-amount = walletdata-amount.
    er_entity-waerk = walletdata-waerk.
    er_entity-transaction_date = walletdata-transaction_date.
    er_entity-slip_number = walletdata-slip_number.
    er_entity-transaction_no = walletdata-transaction_no.
  ENDMETHOD.
ENDCLASS.
