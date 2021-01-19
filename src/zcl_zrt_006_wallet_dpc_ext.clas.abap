class ZCL_ZRT_006_WALLET_DPC_EXT definition
  public
  inheriting from ZCL_ZRT_006_WALLET_DPC
  create public .

public section.
protected section.

  methods WALLETDATASET_CREATE_ENTITY
    redefinition .
  methods VH_TRANSACTIONTY_GET_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZRT_006_WALLET_DPC_EXT IMPLEMENTATION.


  METHOD vh_transactionty_get_entity.
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

  ENDMETHOD.


  METHOD walletdataset_create_entity.
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
  ENDMETHOD.
ENDCLASS.
