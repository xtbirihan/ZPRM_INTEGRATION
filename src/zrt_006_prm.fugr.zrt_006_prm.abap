FUNCTION zrt_006_prm.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_INPUT) TYPE  ZRT_006_TT_PRM_SRV
*"  EXPORTING
*"     VALUE(ET_RETURN) TYPE  BAPIRET2_T
*"----------------------------------------------------------------------
  PERFORM prm_service TABLES it_input
                             et_return.


ENDFUNCTION.

FORM prm_service TABLES it_input  STRUCTURE zrt_006_s_prm_srv
                        et_return STRUCTURE bapiret2.
  DATA: lt_prm       TYPE STANDARD TABLE OF zrt_006_t_prm,
        lt_message   TYPE STANDARD TABLE OF zrt_006_t_msg,
        lv_dealer_id TYPE zrt_006_d_dealer_id.

  SELECT * FROM zrt_006_t_werks
           WHERE dealer_id IS INITIAL
           ORDER BY werks
           INTO TABLE @DATA(lt_werks) .
  IF sy-subrc NE 0.
    MESSAGE e004(zrt_006) INTO gv_dummy.
    PERFORM sys_add_bapiret2 TABLES et_return lt_message USING lv_dealer_id 'DUMMY1'.
    RETURN.
  ENDIF.

  PERFORM check_data TABLES it_input
                            et_return
                            lt_prm
                            lt_werks
                            lt_message.

  TYPES: BEGIN OF ltt_dealer_id,
           sign   TYPE char1,
           option TYPE char2,
           low    TYPE zrt_006_t_msg-dealer_id,
           high   TYPE zrt_006_t_msg-dealer_id,
         END OF ltt_dealer_id.
  DATA: lr_dealer_id  TYPE STANDARD TABLE OF ltt_dealer_id.

  LOOP AT lt_message ASSIGNING FIELD-SYMBOL(<fs_message>).
    COLLECT VALUE ltt_dealer_id( sign   = 'I'
                                 option = 'EQ'
                                 low    = <fs_message>-dealer_id ) INTO lr_dealer_id.
  ENDLOOP.
  IF sy-subrc EQ 0.
    DELETE FROM zrt_006_t_msg WHERE dealer_id IN lr_dealer_id.
    COMMIT WORK AND WAIT.
    MODIFY zrt_006_t_msg FROM TABLE lt_message.
    COMMIT WORK AND WAIT.
  ENDIF.

  LOOP AT et_return ASSIGNING FIELD-SYMBOL(<fs_return>) WHERE type CA 'EAX'.
    EXIT.
  ENDLOOP.
  IF sy-subrc EQ 0.
    RETURN.
  ENDIF.

  DELETE lt_werks WHERE dealer_id IS INITIAL.
  IF lt_werks IS NOT INITIAL AND lt_prm IS NOT INITIAL.
    MODIFY zrt_006_t_werks FROM TABLE lt_werks.
    COMMIT WORK AND WAIT.
    MODIFY zrt_006_t_prm FROM TABLE lt_prm.
    COMMIT WORK AND WAIT.
    MESSAGE s010(zrt_006)  INTO gv_dummy. "All records successfully saved.'
    PERFORM sys_add_bapiret2 TABLES et_return lt_message USING lv_dealer_id 'DUMMY2'.
  ELSEIF lt_prm IS NOT INITIAL AND lt_werks IS INITIAL.
    MODIFY zrt_006_t_prm FROM TABLE lt_prm.
    COMMIT WORK AND WAIT.
    MESSAGE s010(zrt_006)  INTO gv_dummy. "All records successfully saved.'
    PERFORM sys_add_bapiret2 TABLES et_return lt_message USING lv_dealer_id 'DUMMY3'.
  ENDIF.

ENDFORM.
FORM check_data TABLES it_input   STRUCTURE zrt_006_s_prm_srv
                       et_return  STRUCTURE bapiret2
                       ct_prm     STRUCTURE zrt_006_t_prm
                       ct_werks   STRUCTURE zrt_006_t_werks
                       ct_message STRUCTURE zrt_006_t_msg.

  DATA: lt_input TYPE STANDARD TABLE OF zrt_006_s_prm_srv.
  DATA: lt_not_exist TYPE STANDARD TABLE OF zrt_006_s_prm_srv.
  DATA: lv_update(1) VALUE 'U',
        lv_insert(1) VALUE 'I',
        ls_prm       TYPE zrt_006_t_prm.


  lt_input = it_input[].
  SELECT t~bukrs, t~butxt FROM t001 AS t
           INNER JOIN @lt_input AS i ON i~bukrs = t~bukrs
           ORDER BY t~bukrs
           INTO TABLE @DATA(lt_t001).

  SELECT t~vkorg, t~bukrs FROM tvko AS t
                          INNER JOIN @lt_input AS i ON i~vkorg = t~vkorg
                          ORDER BY t~vkorg
                          INTO TABLE @DATA(lt_tvko).

  SELECT t~* FROM tcurc AS t
             INNER JOIN @lt_input AS i ON i~waerk = t~waers
             ORDER BY t~waers
             INTO TABLE @DATA(lt_tcurc).


  SELECT t~* FROM zrt_006_t_prm AS t
             INNER JOIN @lt_input AS i ON i~dealer_id = t~dealer_id
             ORDER BY t~dealer_id
             INTO TABLE @DATA(lt_prm).


  LOOP AT it_input ASSIGNING FIELD-SYMBOL(<fs_input>).
    IF <fs_input>-dealer_id IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e005(zrt_006) WITH TEXT-001 INTO gv_dummy. "'Dealer Id'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id 'DUMMY4'.
      DATA(lv_err) = abap_true.
    ENDIF.

    IF <fs_input>-dealer_id_type IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e023(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'Dealer Id Type'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.
    IF <fs_input>-dealer_id_type EQ '02' AND <fs_input>-dealer_id_link IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e024(zrt_006) WITH  <fs_input>-dealer_id    INTO gv_dummy. "'Dealer Id Link'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-bukrs IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e025(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'Company Code'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
      DATA(lv_bukrs_err) = abap_true.
    ENDIF.

    IF <fs_input>-vkorg IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e026(zrt_006) WITH <fs_input>-dealer_id    INTO gv_dummy. "'Sales Organization'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
      DATA(lv_vkorg_err) = abap_true.
    ENDIF.

    IF <fs_input>-taxkd IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e027(zrt_006) WITH <fs_input>-dealer_id    INTO gv_dummy. "'Tax Classification'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-is_blocked IS NOT INITIAL AND <fs_input>-addr_valid_to IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e028(zrt_006) WITH <fs_input>-dealer_id   INTO gv_dummy. "'Plant Blocked Date can't be empty'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-name_org1 IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e029(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'Store Name'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-city IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e030(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'City'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-district IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e031(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'District'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-postl_cod1+5(1) NE '-'.
      CLEAR: gv_dummy.
      MESSAGE e036(zrt_006) WITH <fs_input>-dealer_id  INTO gv_dummy. "'Postal Code'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-postl_cod1 IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e032(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'Post Code'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.


    IF <fs_input>-street IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e033(zrt_006) WITH <fs_input>-dealer_id   INTO gv_dummy. "'Street'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.


    IF <fs_input>-country IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e034(zrt_006) WITH <fs_input>-dealer_id  INTO gv_dummy. "'Country'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-waerk IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e035(zrt_006) WITH <fs_input>-dealer_id  INTO gv_dummy. "'Currency Code'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF <fs_input>-taxkd NE 'ZV01' AND <fs_input>-taxkd NE 'ZV02'.
      CLEAR: gv_dummy.
      MESSAGE e037(zrt_006) WITH <fs_input>-dealer_id INTO  gv_dummy. "'Tax Classification'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.
    IF NOT line_exists( lt_t001[ bukrs = <fs_input>-bukrs ] ) AND lv_bukrs_err IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e038(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'Company Code'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF NOT line_exists( lt_tvko[ vkorg = <fs_input>-vkorg ] ) AND lv_vkorg_err IS INITIAL.
      CLEAR: gv_dummy.
      MESSAGE e039(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'Sales Organization'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.

    IF NOT line_exists( lt_tcurc[ waers = <fs_input>-waerk ] ).
      CLEAR: gv_dummy.
      MESSAGE e040(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy. "'Currency Code'
      PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
      lv_err = abap_true.
    ENDIF.
        IF lv_err EQ abap_false.

          READ TABLE lt_prm ASSIGNING FIELD-SYMBOL(<fs_prm>) WITH KEY dealer_id = <fs_input>-dealer_id BINARY SEARCH.
          IF sy-subrc NE 0.
            APPEND <fs_input> TO lt_not_exist.
            "new record.
            CLEAR: gv_dummy.
            PERFORM fill_table TABLES ct_prm ct_werks USING lv_insert ls_prm <fs_input>.
            MESSAGE s020(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy.
            PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
          ELSE.
            "existing record.
            PERFORM fill_table TABLES ct_prm ct_werks USING lv_update <fs_prm> <fs_input>.
            CLEAR: gv_dummy.
            MESSAGE s021(zrt_006) WITH <fs_input>-dealer_id INTO gv_dummy.
            PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id ''.
          ENDIF.
        ENDIF.
    CLEAR: lv_err, lv_bukrs_err, lv_vkorg_err.
  ENDLOOP.
  IF et_return[] IS NOT INITIAL.
    RETURN.
  ENDIF.

  "lt_werks tablosu ve  it_input tablosunu karşılaştırmak gerekecek, yeterli werks olup olmadığını anlamak için.
  DATA(lv_not_exist_line) = lines( lt_not_exist ).
  DATA(lv_werk_line)      = lines( ct_werks[] ).
  IF lv_not_exist_line >  lv_werk_line.
    MESSAGE e009(zrt_006) INTO gv_dummy. "'Tax Classification'
    PERFORM sys_add_bapiret2 TABLES et_return ct_message USING <fs_input>-dealer_id 'DUMMY5'.
    DELETE ct_message WHERE msgty = 'S'.
  ENDIF.
ENDFORM.
FORM fill_table TABLES ct_prm    STRUCTURE zrt_006_t_prm
                       ct_werks  STRUCTURE zrt_006_t_werks
                USING  iv_value  TYPE char1
                       is_prm    STRUCTURE zrt_006_t_prm
                       is_input  STRUCTURE zrt_006_s_prm_srv.
  DATA: lv_partner TYPE but000-partner.
  CASE iv_value.
    WHEN 'I'.
      IF is_input-taxkd EQ 'ZV01'.
        DATA(lv_taxkd) = 1.
      ELSEIF is_input-taxkd EQ 'ZV02'.
        lv_taxkd = 0.
      ENDIF.
      READ TABLE ct_werks ASSIGNING FIELD-SYMBOL(<fs_werks>) WITH KEY dealer_id = ''.
      lv_partner =  |{ <fs_werks>-werks  ALPHA = IN }|.
      APPEND VALUE zrt_006_t_prm(
      mandt                   = sy-mandt
      dealer_id               = is_input-dealer_id
      dealer_id_type          = is_input-dealer_id_type
      kam                     = is_input-kam
      dealer_id_link          = is_input-dealer_id_link
      is_blocked              = is_input-is_blocked
      werks                   = <fs_werks>-werks
      partner                 = lv_partner
      bukrs                   = is_input-bukrs
      ekorg                   = is_input-ekorg
      vkorg                   = is_input-vkorg
      vtweg                   = is_input-vtweg
      spart                   = is_input-spart
      taxkd                   = lv_taxkd
      fabkl                   = is_input-fabkl
      addr_valid_from         = is_input-addr_valid_from
      addr_valid_to           = is_input-addr_valid_to
      name_org1               = is_input-name_org1
      city                    = is_input-city
      district                = is_input-district
      postl_cod1              = is_input-postl_cod1
      street                  = is_input-street
      str_suppl1              = is_input-str_suppl1
      str_suppl2              = is_input-str_suppl2
      str_suppl3              = is_input-str_suppl3
      location                = is_input-location
      building                = is_input-building
      floor                   = is_input-floor
      room_no                 = is_input-room_no
      country                 = is_input-country
      countryiso              = is_input-countryiso
      region                  = is_input-region
      time_zone               = is_input-time_zone
      waerk                   = is_input-waerk
      arrival_date            = sy-datum
      arrival_time            = sy-uzeit
      username                = sy-uname ) TO  ct_prm.
      <fs_werks>-dealer_id = is_input-dealer_id.
    WHEN 'U'.

      IF is_input-taxkd EQ 'ZV01'.
        lv_taxkd = 1.
      ELSEIF is_input-taxkd EQ 'ZV02'.
        lv_taxkd = 0.
      ENDIF.

      APPEND VALUE zrt_006_t_prm(
      mandt                   = sy-mandt
      dealer_id               = is_prm-dealer_id
      dealer_id_type          = is_input-dealer_id_type
      kam                     = is_input-kam
      dealer_id_link          = is_input-dealer_id_link
      is_blocked              = is_input-is_blocked
      werks                   = is_prm-werks
      partner                 = is_prm-partner
      partner_guid            = is_prm-partner_guid
      bukrs                   = is_input-bukrs
      ekorg                   = is_input-ekorg
      vkorg                   = is_input-vkorg
      vtweg                   = is_input-vtweg
      spart                   = is_input-spart
      taxkd                   = lv_taxkd
      fabkl                   = is_input-fabkl
      addr_valid_from         = is_input-addr_valid_from
      addr_valid_to           = is_input-addr_valid_to
      name_org1               = is_input-name_org1
      city                    = is_input-city
      district                = is_input-district
      postl_cod1              = is_input-postl_cod1
      street                  = is_input-street
      str_suppl1              = is_input-str_suppl1
      str_suppl2              = is_input-str_suppl2
      str_suppl3              = is_input-str_suppl3
      location                = is_input-location
      building                = is_input-building
      floor                   = is_input-floor
      room_no                 = is_input-room_no
      country                 = is_input-country
      countryiso              = is_input-countryiso
      region                  = is_input-region
      time_zone               = is_input-time_zone
      waerk                   = is_input-waerk
      arrival_date            = is_prm-arrival_date
      arrival_time            = is_prm-arrival_time
      username                = is_prm-username
      updatedate              = sy-datum
      updatetime              = sy-uzeit
      updated_by              = sy-uname
       ) TO  ct_prm.

  ENDCASE.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form sys_add_bapiret2
*&---------------------------------------------------------------------*
FORM sys_add_bapiret2  TABLES pt_message   STRUCTURE bapiret2
                              ct_message   STRUCTURE zrt_006_t_msg
                       USING  iv_dealer_id TYPE zrt_006_d_dealer_id
                              iv_dummy.

  DATA :ls_return    TYPE bapiret2,
        lv_dealer_id TYPE zrt_006_d_dealer_id.

  CALL FUNCTION 'FS_BAPI_BAPIRET2_FILL'
    EXPORTING
      type   = sy-msgty
      cl     = sy-msgid
      number = sy-msgno
      par1   = sy-msgv1
      par2   = sy-msgv2
      par3   = sy-msgv3
      par4   = sy-msgv4
    IMPORTING
      return = ls_return.

  APPEND ls_return TO pt_message.

  IF lv_dealer_id IS NOT INITIAL.
    iv_dealer_id = lv_dealer_id.
  ENDIF.

  APPEND VALUE zrt_006_t_msg( mandt     = sy-mandt
                              datum     = sy-datum
                              dealer_id = iv_dealer_id
                              message   = ls_return-message
                              msgty     = sy-msgty
                              msgid     = sy-msgid
                              msgno     = sy-msgno
                              msgv1     = sy-msgv1
                              msgv2     = sy-msgv2
                              msgv3     = sy-msgv3
                              msgv4     = sy-msgv4
                              updatetime = sy-uzeit
                              updated_by = sy-uname
                              ) TO ct_message.
ENDFORM.
