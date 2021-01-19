CLASS zcl_rt_006_prm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.
    METHODS process_bp_create CHANGING  VALUE(cs_bp)     TYPE zrt_006_s_prm
                              RETURNING VALUE(ct_return) TYPE cvis_bp_return_t
                              RAISING   zcx_rt_006_prm.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA:
      ms_bp                 TYPE          zrt_006_s_prm,
      mt_bp_general         TYPE TABLE OF cvis_bp_general,
      mt_bp_role            TYPE TABLE OF cvis_bp_role,
      mt_bp_ident_numbers   TYPE TABLE OF cvis_bp_ident_numbers,
      mt_bp_ident_numbers_u TYPE TABLE OF cvis_bp_ident_numbers,
      mt_bank_details       TYPE TABLE OF cvis_bp_bank_details,
      mt_tax_number         TYPE TABLE OF cvis_bp_tax_number,
      mt_tax_number_common  TYPE TABLE OF cvis_bp_tax_number_common,
      mt_address            TYPE TABLE OF cvis_bp_address,
      mt_address_usage      TYPE TABLE OF cvis_bp_address_usage,
      mt_address_teleno     TYPE TABLE OF cvis_bp_address_teleno,
      mt_address_faxno      TYPE TABLE OF cvis_bp_address_faxno,
      mt_address_email      TYPE TABLE OF cvis_bp_address_email,
      mt_cust_general       TYPE TABLE OF cvis_customer_general,
      mt_cust_company       TYPE TABLE OF cvis_customer_company,
      mt_sup_general        TYPE TABLE OF cvis_supplier_general,
      mt_sup_company        TYPE TABLE OF cvis_supplier_company,
      mt_return             TYPE cvis_bp_return_t,
      mv_kunnr              TYPE kna1-kunnr.

    TYPES: BEGIN OF mtt_but000,
             partner      TYPE but000-partner,
             partner_guid TYPE but000-partner_guid,
           END OF mtt_but000.
    DATA: ls_partner_guid TYPE mtt_but000.

    METHODS fill_bp_general          .
    METHODS fill_bp_general_update   .
    METHODS fill_bp_role             .
    METHODS fill_bp_ident_numbers    .
    METHODS fill_bank_details        .
    METHODS fill_tax_number          .
    METHODS fill_tax_number_common   .
    METHODS fill_address             .
    METHODS fill_cust_general        .
    METHODS fill_cust_company        .
    METHODS fill_sup_general         .
    METHODS fill_sup_company         .
    METHODS call_bapi
      RETURNING
        VALUE(ct_return) TYPE cvis_bp_return_t .
    METHODS bapi_commit                        .
    METHODS bapi_rollback                      .
    METHODS clear_all                          .
    METHODS add_role
      IMPORTING
        VALUE(iv_partner)  TYPE but000-partner
        VALUE(iv_role)     TYPE bapibus1006_head-partnerrole
      CHANGING
        VALUE(ct_bapiret2) TYPE bapiret2_t .
    METHODS extend_to_sales_data
      IMPORTING
        VALUE(is_partner_guid) TYPE mtt_but000 .
    METHODS extend_to_purchasing_data
      IMPORTING
        VALUE(is_partner_guid) TYPE mtt_but000 .
    METHODS change_identification
      IMPORTING
        VALUE(iv_ident_category) TYPE bapibus1006_identification_key-identificationcategory
        VALUE(iv_ident_number)   TYPE bapibus1006_identification_key-identificationnumber
        VALUE(iv_idinstitute)    TYPE bapibus1006_identification-idinstitute
      CHANGING
        VALUE(ct_bapiret2)       TYPE bapiret2_t.
    METHODS bdc_dynpro IMPORTING VALUE(iv_program) TYPE bdc_prog
                                 VALUE(iv_screen)  TYPE bdc_dynr
                       CHANGING  VALUE(ct_bdcdata) TYPE tab_bdcdata.

    METHODS bdc_field IMPORTING VALUE(iv_field_name)  TYPE fnam_____4
                                VALUE(iv_field_value) TYPE bdc_fval
                      CHANGING  VALUE(ct_bdcdata)     TYPE tab_bdcdata.

    METHODS bdc_transaction IMPORTING VALUE(iv_tcode)   TYPE bdc_prog
                                      VALUE(it_bdcdata) TYPE tab_bdcdata.
    METHODS: batch_to_wb01 ,
      batch_to_ec07 ,
      update_v_tvstz,
      update_v_tvkol.
ENDCLASS.

CLASS zcl_rt_006_prm IMPLEMENTATION.
  METHOD constructor.

  ENDMETHOD.

  METHOD process_bp_create.
    DATA: lt_return TYPE bapiret2_t,
          ls_return TYPE cvis_bp_return.
    CLEAR: ct_return.
    IF cs_bp-werks IS INITIAL.
      RAISE EXCEPTION TYPE zcx_rt_006_prm
        EXPORTING
          id = 'ZRT_006'
          no = '003'.
      RETURN.
    ENDIF.
    me->ms_bp = cs_bp.

    me->fill_bp_general( ).
    me->fill_bp_role( ).
    me->fill_bank_details( ).
    me->fill_bp_ident_numbers( ).
    me->fill_tax_number( ).
    me->fill_tax_number_common( ).
    me->fill_address( ).
    me->fill_cust_general( ).
    me->fill_cust_company( ).
    me->fill_sup_general( ).
    me->fill_sup_company( ).
    me->call_bapi( RECEIVING ct_return = mt_return ).
    LOOP AT mt_return ASSIGNING FIELD-SYMBOL(<fs_return>) WHERE type CA 'EAX'.
      EXIT.
    ENDLOOP.
    IF sy-subrc NE 0.

      LOOP AT mt_return ASSIGNING FIELD-SYMBOL(<fs_bp>) WHERE type EQ 'S'.
        EXIT.
      ENDLOOP.
      IF sy-subrc EQ 0.
        DO.
          SELECT SINGLE partner, partner_guid FROM but000
            INTO @DATA(ls_role)
             WHERE partner = @<fs_bp>-object_key.
          IF sy-subrc EQ 0.
            EXIT.
          ENDIF.
        ENDDO.
        me->add_role( EXPORTING iv_partner = ls_role-partner iv_role = 'FLCU01'
                      CHANGING ct_bapiret2 = lt_return ).
        LOOP AT lt_return ASSIGNING FIELD-SYMBOL(<fs_bapiret2>) WHERE type CA 'EAX'.
          EXIT.
        ENDLOOP.
        IF sy-subrc NE 0.
          me->bapi_commit( ).
          me->extend_to_sales_data( is_partner_guid = ls_role ).
          me->add_role( EXPORTING iv_partner  = ls_role-partner
                                  iv_role     = 'BPSITE'
                         CHANGING ct_bapiret2 = lt_return ).
          LOOP AT lt_return ASSIGNING <fs_bapiret2> WHERE type CA 'EAX'.
            EXIT.
          ENDLOOP.
          IF sy-subrc NE 0.
            me->bapi_commit( ).
*                me->extend_to_purchasing_data( is_partner_guid = ls_role  ).
          ELSE.
            me->bapi_rollback( ).
          ENDIF.
        ELSE.
          me->bapi_rollback( ).
        ENDIF.
      ENDIF.

    ELSE.
      ct_return = mt_return.
      me->bapi_rollback( ).
      me->clear_all( ).
      RETURN.
    ENDIF.
    me->batch_to_wb01( ).
    LOOP AT mt_return ASSIGNING <fs_return> WHERE type CA 'EAX'.
      EXIT.
    ENDLOOP.
    IF sy-subrc EQ 0.
      ct_return = me->mt_return.
      RETURN.
    ENDIF.
    me->batch_to_ec07( ).

    LOOP AT mt_return ASSIGNING <fs_return> WHERE type CA 'EAX'.
      EXIT.
    ENDLOOP.
    IF sy-subrc EQ 0.
      ct_return = me->mt_return.
      RETURN.
    ENDIF.
    me->update_v_tvstz( ).
    me->update_v_tvkol( ).
    ct_return = me->mt_return.
  ENDMETHOD.

  METHOD fill_bp_general.
    DATA: lv_guid TYPE bu_partner_guid_bapi.
    DATA: lv_name1   TYPE cvis_bp_general-name1,
          lv_name2   TYPE cvis_bp_general-name2,
          lv_name3   TYPE cvis_bp_general-name3,
          lv_name4   TYPE cvis_bp_general-name4,
          lv_address TYPE char200.

    IF me->ms_bp-process EQ 'I'.
      DATA(lv_category)    = 2.
      DATA(lv_grouping)    = 'MGZL'.
    ELSEIF me->ms_bp-process EQ 'U'.
      lv_guid = me->ms_bp-partner_guid.
    ENDIF.


    APPEND VALUE cvis_bp_general( run_id        = me->ms_bp-partner
                                  object_task   = me->ms_bp-process
                                  bpartner      = me->ms_bp-partner "me->ms_bp-partner burası şimdilik dealer id ama değişecek
                                  category      = lv_category
                                  bpartnerguid  = lv_guid
                                  grouping      = lv_grouping
                                  searchterm1   =  'Test Term'
*                                  searchterm2   = ''
*                                  partnertype     = lv_partnertype
                                  partnerlanguage = sy-langu
                                  partnerexternal = me->ms_bp-dealer_id
                                  name1           =  me->ms_bp-name_org1 "me->ms_bp-businessname
*                                  name2           = lv_name2 "me->ms_bp-businessname
*                                  name3           = lv_name3 "me->ms_bp-posname
*                                  name4           = lv_name4 "me->ms_bp-posname
                                "  legalorg        = '02'
                                ) TO  mt_bp_general.
  ENDMETHOD.

  METHOD add_role.
    CALL FUNCTION 'BAPI_BUPA_ROLE_ADD'
      EXPORTING
        businesspartner     = iv_partner
        businesspartnerrole = iv_role
      TABLES
        return              = ct_bapiret2.
  ENDMETHOD.

  METHOD bapi_commit.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
        wait = 'X'.
  ENDMETHOD.

  METHOD bapi_rollback.
    CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.
  ENDMETHOD.

  METHOD call_bapi.

    DATA: lv_commit TYPE swo_commit.
    IF me->ms_bp-process EQ 'U'.
      lv_commit = abap_true.
    ENDIF.
    IF me->ms_bp-process EQ 'I'.
      CALL FUNCTION 'RFC_CVI_EI_INBOUND_MAIN'
        TABLES
          it_bp_general           = me->mt_bp_general
          it_bp_role              = me->mt_bp_role
          it_bp_ident_numbers     = me->mt_bp_ident_numbers
          it_bp_bank_details      = me->mt_bank_details
          it_bp_tax_number        = me->mt_tax_number
          it_bp_tax_number_common = me->mt_tax_number_common
          it_bp_address           = me->mt_address
          it_bp_address_usage     = me->mt_address_usage
          it_bp_address_teleno    = me->mt_address_teleno
          it_bp_address_faxno     = me->mt_address_faxno
          it_bp_address_email     = me->mt_address_email
          it_cust_general         = me->mt_cust_general
          it_cust_company         = me->mt_cust_company
          it_sup_general          = me->mt_sup_general
          it_sup_company          = me->mt_sup_company
          ct_return               = ct_return.
    ELSEIF me->ms_bp-process EQ 'U'.
      CALL FUNCTION 'RFC_CVI_EI_INBOUND_MAIN'
        EXPORTING
          iv_docommit             = lv_commit
        TABLES
          it_bp_general           = me->mt_bp_general
          it_bp_role              = me->mt_bp_role
          it_bp_ident_numbers     = me->mt_bp_ident_numbers
          it_bp_bank_details      = me->mt_bank_details
          it_bp_tax_number        = me->mt_tax_number
          it_bp_tax_number_common = me->mt_tax_number_common
          it_bp_address           = me->mt_address
          it_bp_address_usage     = me->mt_address_usage
          it_bp_address_teleno    = me->mt_address_teleno
          it_bp_address_faxno     = me->mt_address_faxno
          it_bp_address_email     = me->mt_address_email
          it_cust_general         = me->mt_cust_general
          it_cust_company         = me->mt_cust_company
          it_sup_general          = me->mt_sup_general
          it_sup_company          = me->mt_sup_company
          ct_return               = ct_return.
    ENDIF.
  ENDMETHOD.

  METHOD change_identification.
*   data:ls_identification   TYPE BAPIBUS1006_IDENTIFICATION,
*        ls_identification_x TYPE baPIBUS1006_IDENTIFICATION_X.
*
*   CLEAR ls_identification.
*   ls_identification-idinstitute = iv_idinstitute.
*
*   CLEAR ls_identification_x.
*   ls_identification_x-idinstitute = 'X'.
*
*    CALL FUNCTION 'BAPI_IDENTIFICATION_CHANGE'
*      EXPORTING
*        businesspartner        = me->ms_bp-partner
*        identificationcategory = iv_ident_category
*        identificationnumber   = iv_ident_number
*        identification         = ls_identification
*        identification_x       = ls_identification_x
*      TABLES
*        return                 = ct_bapiret2.
  ENDMETHOD.

  METHOD clear_all.
    CLEAR: me->ms_bp                    ,
           me->mt_bp_general            ,
           me->mt_bp_role               ,
           me->mt_bank_details          ,
           me->mt_tax_number            ,
           me->mt_tax_number_common     ,
           me->mt_address               ,
           me->mt_address_usage         ,
           me->mt_address_teleno        ,
           me->mt_address_faxno         ,
           me->mt_address_email         ,
           me->mt_cust_general          ,
           me->mt_cust_company          ,
           me->mt_sup_general           ,
           me->mt_sup_company           .
  ENDMETHOD.

  METHOD extend_to_purchasing_data.
*   DATA: lt_bp_general     TYPE TABLE OF cvis_bp_general,
*          lt_bp_role        TYPE TABLE OF cvis_bp_role,
*          lt_sup_general    TYPE TABLE OF cvis_supplier_general,
*          lt_sup_purchasing TYPE TABLE OF cvis_supplier_purchasing,
*          lt_return         TYPE TABLE OF cvis_bp_return.
*
*    APPEND VALUE cvis_bp_general( run_id        = me->ms_bp-werks
*                                  object_task   = 'U'
*                                  bpartner      = is_partner_guid-partner
*                                  bpartnerguid  = is_partner_guid-partner_guid ) TO  lt_bp_general.
*
*    APPEND VALUE cvis_supplier_general( run_id        = me->ms_bp-werks
*                                        lifnr         = is_partner_guid-partner
*                                        kunnr         = is_partner_guid-partner
*                                        object_task   = 'M' ) TO lt_sup_general.
*
*    APPEND VALUE cvis_supplier_purchasing( run_id  = me->ms_bp-werks
*                                           ekorg   = 'SS01'
*                                           waers   = 'TRY'
*                                           zterm   = '0001'
*                                           inco1   = 'EXW'
*                                           inco2_l = 'X'
*                                           webre   = 'X'
*                                           kzaut   = 'X'
*                                           kzret   = 'X' ) TO lt_sup_purchasing.
*
*    CALL FUNCTION 'RFC_CVI_EI_INBOUND_MAIN'
*      TABLES
*        it_bp_general     = lt_bp_general
*        it_bp_role        = lt_bp_role
*        it_sup_general    = lt_sup_general
*        it_sup_purchasing = lt_sup_purchasing
*        ct_return         = lt_return.
*    LOOP AT lt_return ASSIGNING FIELD-SYMBOL(<fs_return>) WHERE type CA 'EAX'.
*      EXIT.
*    ENDLOOP.
*    IF sy-subrc NE 0.
*      me->bapi_commit( ).
*    ELSE.
*      me->bapi_rollback( ).
*    ENDIF.

  ENDMETHOD.

  METHOD extend_to_sales_data.
    DATA: lt_bp_general           TYPE TABLE OF cvis_bp_general,
          lt_cust_general         TYPE TABLE OF cvis_customer_general,
          lt_cust_sales           TYPE TABLE OF cvis_customer_sales,
          lt_cust_sales_functions TYPE TABLE OF cvis_customer_sales_func,
          lt_cust_tax_indicator   TYPE TABLE OF cvis_customer_tax_indicator,
          lt_bp_role              TYPE TABLE OF cvis_bp_role,
          lt_return               TYPE TABLE OF cvis_bp_return.

    APPEND VALUE cvis_bp_general( run_id        = me->ms_bp-partner
                                  object_task   = 'U'
                                  bpartner      = is_partner_guid-partner
                                  bpartnerguid  = is_partner_guid-partner_guid ) TO  lt_bp_general.

    APPEND VALUE cvis_customer_general( run_id      = me->ms_bp-partner
                                        object_task = 'M'
                                        kunnr       = is_partner_guid-partner ) TO lt_cust_general.

    APPEND VALUE cvis_customer_sales( run_id      = me->ms_bp-partner
                                      vkorg       = me->ms_bp-vkorg
                                      vtweg       = me->ms_bp-vtweg
                                      spart       = me->ms_bp-spart
                                      kalks       = '1'
                                      kdgrp       = ''
                                      bzirk       = 'CENTRE'
                                      konda       = '01'
                                      pltyp       = ''
                                      inco1       = ''
                                      waers       = me->ms_bp-waerk
                                      ktgrd       = ''
                                      vkgrp       = ''
                                      vkbur       = ''
                                      kzazu       = abap_true
                                      inco2_l     = ''
*                                      VWERK       = lv_werks
                                       ) TO   lt_cust_sales.

    APPEND VALUE cvis_customer_sales_func( run_id  = me->ms_bp-partner
                                           vkorg   = me->ms_bp-vkorg
                                           vtweg   = me->ms_bp-vtweg
                                           spart   = me->ms_bp-spart
                                           parvw   = 'RG'
                                           partner = is_partner_guid-partner ) TO lt_cust_sales_functions.

    APPEND VALUE cvis_customer_sales_func( run_id  = me->ms_bp-partner
                                           vkorg   = me->ms_bp-vkorg
                                           vtweg   = me->ms_bp-vtweg
                                           spart   = me->ms_bp-spart
                                           parvw   = 'AG'
                                           partner = is_partner_guid-partner ) TO lt_cust_sales_functions.

    APPEND VALUE cvis_customer_sales_func( run_id  = me->ms_bp-partner
                                           vkorg   = me->ms_bp-vkorg
                                           vtweg   = me->ms_bp-vtweg
                                           spart   = me->ms_bp-spart
                                           parvw   = 'RE'
                                           partner = is_partner_guid-partner ) TO lt_cust_sales_functions.

    APPEND VALUE cvis_customer_sales_func( run_id  = me->ms_bp-partner
                                           vkorg   = me->ms_bp-vkorg
                                           vtweg   = me->ms_bp-vtweg
                                           spart   = me->ms_bp-spart
                                           parvw   = 'WE'
                                           partner = is_partner_guid-partner ) TO lt_cust_sales_functions.


    IF me->ms_bp-taxkd EQ '1'.
      DATA(lv_taxkd) = '1'.
      DATA(lv_tatyp) = 'ZV01'.
    ELSEIF  me->ms_bp-taxkd EQ '0'.
      lv_taxkd = '0'.
      lv_tatyp = 'ZV02'.
    ENDIF.
    APPEND VALUE cvis_customer_tax_indicator( run_id = me->ms_bp-partner
                                              aland  = me->ms_bp-country
                                              tatyp  = lv_tatyp
                                              taxkd  = lv_taxkd  ) TO lt_cust_tax_indicator.

    CALL FUNCTION 'RFC_CVI_EI_INBOUND_MAIN'
      TABLES
        it_bp_general           = lt_bp_general
        it_bp_role              = lt_bp_role
        it_cust_general         = lt_cust_general
        it_cust_sales           = lt_cust_sales
        it_cust_sales_functions = lt_cust_sales_functions
        it_cust_tax_indicator   = lt_cust_tax_indicator
        ct_return               = lt_return.
    LOOP AT lt_return ASSIGNING FIELD-SYMBOL(<fs_return>) WHERE type CA 'EAX'.
      EXIT.
    ENDLOOP.
    IF sy-subrc NE 0.
      me->bapi_commit( ).
    ELSE.
      me->bapi_rollback( ).
    ENDIF.

  ENDMETHOD.

  METHOD fill_address.
    DATA(lv_address_id) = 1.
    DATA: lv_ship_to_guid       TYPE but020-guid,
          lv_bill_to_guid       TYPE but020-guid,
          lv_addresstyp_ship_to TYPE bu_adrkind,
          lv_addresstyp_bill_to TYPE bu_adrkind.

    TYPES: BEGIN OF ltt_lines ,
             line(256) TYPE c,
           END OF ltt_lines.
    DATA: lt_line TYPE TABLE OF ltt_lines.

    DATA: lv_street TYPE cvis_bp_address-street,
          lv_sup1   TYPE cvis_bp_address-str_suppl1,
          lv_sup2   TYPE cvis_bp_address-str_suppl1,
          lv_sup3   TYPE cvis_bp_address-str_suppl1.

*    IF me->ms_bp-process EQ 'I'.
*      lv_addresstyp_ship_to = 'SHIP_TO'.
*      lv_addresstyp_bill_to = 'BILL_TO'.
*    ELSEIF me->ms_bp-process EQ 'U'.
*      lv_addresstyp_ship_to = 'XXDEFAULT'.
*      lv_addresstyp_bill_to = 'XXDEFAULT'.
*      SELECT f~partner,f~adr_kind, b~addrnumber,b~address_guid   FROM but021_fs AS f
*                 INNER JOIN  but020 AS b ON b~partner = f~partner
*                                       AND b~addrnumber = f~addrnumber
*                 INTO TABLE @DATA(lt_guid)
*                 WHERE f~partner = @me->ms_bp-partner
*                  AND  f~adr_kind IN ('BILL_TO', 'SHIP_TO' )
*                  ORDER BY f~partner, f~adr_kind.
*      IF sy-subrc EQ 0.
*        READ TABLE lt_guid INTO DATA(ls_guid) WITH KEY partner  = me->ms_bp-partner
*                                                       adr_kind = 'SHIP_TO'.
*        IF sy-subrc EQ 0.
*          lv_ship_to_guid = ls_guid-address_guid.
*        ENDIF.
*        CLEAR: ls_guid.
*
*        READ TABLE lt_guid INTO ls_guid WITH KEY partner  = me->ms_bp-partner
*                                                 adr_kind = 'BILL_TO'.
*        IF sy-subrc EQ 0.
*          lv_bill_to_guid = ls_guid-address_guid.
*        ENDIF.
*
*      ENDIF.
*    ENDIF.
*

    APPEND VALUE cvis_bp_address( run_id     =  me->ms_bp-partner
                                  address_id = 1
                                  city       = me->ms_bp-city
                                  district   = me->ms_bp-district
                                  postl_cod1 = me->ms_bp-postl_cod1
                                  street     = me->ms_bp-street
                                  str_suppl1 = me->ms_bp-str_suppl1
                                  str_suppl2 = me->ms_bp-str_suppl2
                                  str_suppl3 = me->ms_bp-str_suppl3
                                  country    = me->ms_bp-country
                                  region     = '' "me->ms_bp-deliveryprovincecode "me->ms_bp-deliverydistrictcode
                                  langu      = sy-langu
                                  guid       = lv_ship_to_guid ) TO mt_address.


    APPEND VALUE cvis_bp_address_usage( run_id      =  me->ms_bp-partner
                                        address_id  = lv_address_id
                                        addresstype = 'XXDEFAULT' ) TO mt_address_usage.



    APPEND VALUE cvis_bp_address_teleno( run_id     = me->ms_bp-partner
                                         address_id = lv_address_id
                                         telephone  = '00905438154001' ) TO mt_address_teleno.

    APPEND VALUE cvis_bp_address_faxno(  run_id      = me->ms_bp-partner
                                         address_id  = lv_address_id
                                         fax         = '00905438154001' ) TO mt_address_faxno.
  ENDMETHOD.

  METHOD fill_bank_details.

*      APPEND VALUE cvis_bp_bank_details(  run_id      = me->ms_bp-retailerid
*                                          data_key    = <fs_bank>-bankaccounttype
*                                          bank_ctry   = <fs_bank>-bankcountry
*                                          bank_key    = <fs_bank>-banknumber
*                                          bank_acct   = <fs_bank>-bankaccountnumber
*                                          iban        = <fs_bank>-bankiban  ) TO mt_bank_details.

  ENDMETHOD.

  METHOD fill_bp_general_update.
    APPEND VALUE cvis_bp_general( run_id        = me->ms_bp-partner
                                  object_task   = me->ms_bp-process
                                  category      = '2'
                                  grouping      = 'MGZL'
                                  searchterm1   = 'Test Term 1'
                                  searchterm2   = ''
                                  partnertype   = ''
                                  partnerlanguage = sy-langu
                                  name1           = me->ms_bp-name_org1
*                                  name2           = me->ms_bp-name_org1
*                                  name3           = me->ms_bp-posname
*                                  name4           = me->ms_bp-posname
                                  "legalorg        = '02'
                                ) TO  mt_bp_general.
  ENDMETHOD.

  METHOD fill_bp_ident_numbers.
*        APPEND VALUE cvis_bp_ident_numbers( run_id = me->ms_bp-werks
*                                            identificationcategory = 'Z4042R'
*                                            identificationnumber   =  me->ms_bp-retailerid
*                                            idinstitute   = 'ZIR01' )  TO mt_bp_ident_numbers.
  ENDMETHOD.

  METHOD fill_bp_role.
    IF me->ms_bp-process EQ 'I'.
      APPEND VALUE cvis_bp_role( run_id  = me->ms_bp-partner
                                 data_key   = 'FLCU00'   ) TO mt_bp_role.

    ENDIF.
  ENDMETHOD.

  METHOD fill_cust_company.
*    IF me->ms_bp-postaxofficeid+0(3) = 999.
*      DATA(lv_akont) = '1200000002'.
*    ELSE.
*      lv_akont = '1200000001'.
*    ENDIF.
*
*    APPEND VALUE cvis_customer_company( run_id = me->ms_bp-dealer_id
*                                        bukrs  = '4042'
*                                        zuawa  = '001'
*                                        akont  = lv_akont "'1200000001'
*                                        zterm  = '0001'
*                                        altkn  = me->ms_bp-retailerid ) TO mt_cust_company.
  ENDMETHOD.

  METHOD fill_cust_general.
*    APPEND VALUE cvis_customer_general( run_id      = me->ms_bp-werks
*                                        object_task = me->ms_bp-process
*                                        kunnr       = me->ms_bp-partner ) TO mt_cust_general.

  ENDMETHOD.

  METHOD fill_sup_company.

*    DATA(lv_akont) = '3200000002'.
*    APPEND VALUE cvis_supplier_company( run_id = me->ms_bp-werks
*                                        bukrs  = '4042'
*                                        zuawa  = '001'
*                                        akont  = lv_akont "'3200000001'
*                                        zterm  = '0001'
*                                     "   reprf  = 'X' "çift fatura kontrolü
*                                        altkn  =  me->ms_bp-dealer_id  ) TO mt_sup_company.
  ENDMETHOD.

  METHOD fill_sup_general.
*    APPEND VALUE cvis_supplier_general( run_id      = me->ms_bp-werks
*                                        object_task = me->ms_bp-process
*                                        lifnr       = me->ms_bp-partner ) TO mt_sup_general.
  ENDMETHOD.

  METHOD fill_tax_number.
*    SELECT SINGLE * FROM zssi_fi_04_t_02 INTO @DATA(ls_tax)
*                                         WHERE postaxofficeid = @me->ms_bp-postaxofficeid.
*
*    APPEND VALUE cvis_bp_tax_number( run_id    = me->ms_bp-werks
*                                     taxtype   = 'TR1'
*                                     taxnumber = ls_tax-postaxoffice_sapname  ) TO mt_tax_number.
*
*    APPEND VALUE cvis_bp_tax_number( run_id    = me->ms_bp-werks
*                                     taxtype   = 'TR3'
*                                     taxnumber = me->ms_bp-postaxid    ) TO mt_tax_number.
  ENDMETHOD.

  METHOD fill_tax_number_common.
*    IF me->ms_bp-legalform EQ '2'.
*      DATA(lv_nat_person) = abap_true.
*    ENDIF.
*    APPEND VALUE cvis_bp_tax_number_common( run_id      = me->ms_bp-werks
*                                            nat_person  = lv_nat_person ) TO mt_tax_number_common.
  ENDMETHOD.


  METHOD bdc_dynpro.
    APPEND VALUE bdcdata( program = iv_program
                          dynpro  = iv_screen
                          dynbegin = abap_true ) TO ct_bdcdata.
  ENDMETHOD.

  METHOD bdc_field.
    APPEND VALUE bdcdata( fnam  = iv_field_name
                          fval  = iv_field_value ) TO ct_bdcdata.
  ENDMETHOD.

  METHOD bdc_transaction.
    DATA: lv_mode(1) VALUE 'N'.
    DATA: lt_messtab TYPE STANDARD TABLE OF bdcmsgcoll.
    DATA: lt_ext_return     TYPE STANDARD TABLE OF bapiret2.

    CALL TRANSACTION iv_tcode USING it_bdcdata
                     MODE   lv_mode
                     "A: show all dynpros
                     "E: show dynpro on error only
                     "N: do not display dynpro
                     UPDATE 'L'
                     MESSAGES INTO lt_messtab.

    CALL FUNCTION 'CONVERT_BDCMSGCOLL_TO_BAPIRET2'
      TABLES
        imt_bdcmsgcoll = lt_messtab
        ext_return     = lt_ext_return.

    "convert bapiret2 to bp return type

*     ct_return

    mt_return = CORRESPONDING #( BASE ( mt_return ) lt_ext_return ).
  ENDMETHOD.

  METHOD batch_to_wb01.
    DATA: lt_bdcdata  TYPE STANDARD TABLE OF bdcdata.
    DATA: lt_return   TYPE cvis_bp_return_t.
    DATA: lv_werks(4).

    lv_werks =    me->ms_bp-werks.
    me->bdc_dynpro( EXPORTING iv_program = 'SAPMWBE3'
                              iv_screen  = '0101'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_CURSOR'
                             iv_field_value = 'WR02D-BETRP'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=ENTR'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'WR02D-LOCNR'
                             iv_field_value = CONV #( me->ms_bp-werks )
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'WR02D-REF_WKFIL'
                             iv_field_value = '1001'"default reference store.
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPMWBE3'
                              iv_screen  = '0401'
                    CHANGING  ct_bdcdata = lt_bdcdata ).


    me->bdc_field( EXPORTING iv_field_name  = 'BDC_CURSOR'
                             iv_field_value = 'WR02D-SITE_BP'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).


    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=PART'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPMWBE3'
                              iv_screen  = '0201'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=BPRC'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLBUS_LOCATOR'
                              iv_screen  = '3000'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=BUS_MAIN_BACK'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPMWBE3'
                              iv_screen  = '0401'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_CURSOR'
                             iv_field_value = 'WR02D-SITE_BP'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=UPDA'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLSPO1'
                              iv_screen  = '0100'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=YES'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLCLCA'
                              iv_screen  = '0602'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_CURSOR'
                             iv_field_value = 'RMCLF-KLART'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=ABBR'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLPLANT_DISPLAY_CUSTOMIZING'
                              iv_screen  = '1000'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_CURSOR'
                             iv_field_value = 'G_PLANTNR'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=BSTV'
                  CHANGING   ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLSPO1'
                              iv_screen  = '0600'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=OPT2'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_transaction( EXPORTING iv_tcode   = 'WB01'
                                   it_bdcdata = lt_bdcdata ).

  ENDMETHOD.

  METHOD batch_to_ec07.

    DATA: lt_bdcdata  TYPE STANDARD TABLE OF bdcdata.
    DATA: lt_return   TYPE cvis_bp_return_t.
    DATA: lv_t1(1).

*    call FUNCTION 'ZRT_006_SET'
*      EXPORTING
*        iv_dark_update = abap_true.

*     EXPORT lv_t1 FROM abap_true TO MEMORY ID 'ZRT_006_MID_01'.

    DATA: ls_impex TYPE zrt_006_t_exp.
    ls_impex-mandt = sy-mandt.
    ls_impex-impex = abap_true.
    MODIFY zrt_006_t_exp FROM ls_impex.
    COMMIT WORK AND WAIT.

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLECOP'
                              iv_screen  = '0100'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=COPY'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLSPO4'
                              iv_screen  = '0300'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_CURSOR'
                             iv_field_value = 'SVALD-VALUE(02)'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=FURT'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).


    me->bdc_field( EXPORTING iv_field_name  = 'SVALD-VALUE(01)'
                             iv_field_value = '1001'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'SVALD-VALUE(02)'
                             iv_field_value = CONV #( me->ms_bp-werks )
                   CHANGING  ct_bdcdata     = lt_bdcdata ).


    me->bdc_dynpro( EXPORTING iv_program = 'SAPMSSY0'
                              iv_screen  = '0120'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=DBAC'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLSPO1'
                              iv_screen  = '0500'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=OPT1'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_dynpro( EXPORTING iv_program = 'SAPLSTRD'
                              iv_screen  = '0300'
                    CHANGING  ct_bdcdata = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_CURSOR'
                             iv_field_value = 'KO008-TRKORR'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '=LOCK'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).


    me->bdc_field( EXPORTING iv_field_name  = 'BDC_OKCODE'
                             iv_field_value = '/EBACK'
                   CHANGING  ct_bdcdata     = lt_bdcdata ).

    me->bdc_transaction( EXPORTING iv_tcode   = 'EC07'
                                   it_bdcdata = lt_bdcdata ).

    DELETE zrt_006_t_exp FROM ls_impex.
  ENDMETHOD.

  METHOD update_v_tvstz.
    UPDATE tvstz
           SET vstel   = me->ms_bp-werks
           WHERE werks = me->ms_bp-werks.
  ENDMETHOD.

  METHOD update_v_tvkol.
    DATA: lt_tvkol_d TYPE STANDARD TABLE OF tvkol.
    SELECT * FROM tvkol INTO TABLE @DATA(lt_tvkol) WHERE werks = @me->ms_bp-werks.
    IF sy-subrc EQ 0.
      LOOP AT lt_tvkol ASSIGNING FIELD-SYMBOL(<fs_tvkol>).
        IF <fs_tvkol>-werks NE <fs_tvkol>-vstel.
          APPEND <fs_tvkol> TO lt_tvkol_d.
        ENDIF.
      ENDLOOP.

      CLEAR: lt_tvkol.
      SELECT * FROM tvkol INTO TABLE @lt_tvkol WHERE vstel = @me->ms_bp-werks.
      LOOP AT lt_tvkol ASSIGNING <fs_tvkol>.
        IF <fs_tvkol>-werks NE <fs_tvkol>-vstel.
          APPEND <fs_tvkol> TO lt_tvkol_d.
        ENDIF.
      ENDLOOP.
      IF lt_tvkol_d IS NOT INITIAL.
        DELETE tvkol FROM TABLE lt_tvkol_d.
        COMMIT WORK AND WAIT.
      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
