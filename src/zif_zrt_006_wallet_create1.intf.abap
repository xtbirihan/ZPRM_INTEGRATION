interface ZIF_ZRT_006_WALLET_CREATE1
  public .


  types:
    BAPI_MTYPE type C length 000001 .
  types:
    SYMSGID type C length 000020 .
  types:
    SYMSGNO type N length 000003 .
  types:
    BAPI_MSG type C length 000220 .
  types:
    BALOGNR type C length 000020 .
  types:
    BALMNR type N length 000006 .
  types:
    SYMSGV type C length 000050 .
  types:
    BAPI_PARAM type C length 000032 .
  types:
    BAPI_FLD type C length 000030 .
  types:
    BAPILOGSYS type C length 000010 .
  types:
    begin of BAPIRET2,
      TYPE type BAPI_MTYPE,
      ID type SYMSGID,
      NUMBER type SYMSGNO,
      MESSAGE type BAPI_MSG,
      LOG_NO type BALOGNR,
      LOG_MSG_NO type BALMNR,
      MESSAGE_V1 type SYMSGV,
      MESSAGE_V2 type SYMSGV,
      MESSAGE_V3 type SYMSGV,
      MESSAGE_V4 type SYMSGV,
      PARAMETER type BAPI_PARAM,
      ROW type INT4,
      FIELD type BAPI_FLD,
      SYSTEM type BAPILOGSYS,
    end of BAPIRET2 .
  types:
    __BAPIRET2                     type standard table of BAPIRET2                       with non-unique default key .
  types:
    MANDT type C length 000003 .
  types:
    ZRT_006_D_TRANS type C length 000032 .
  types:
    ZRT_006_D_TR_TYPE type N length 000002 .
  types:
    ZRT_006_D_DEALER_ID type C length 000020 .
  types:
    ZRT_006_D_STATU type N length 000002 .
  types:
    ZRT_006_D_SIGN type C length 000001 .
  types:
    ZRT_006_D_AMOUNT type P length 8  decimals 000002 .
  types:
    WAERK type C length 000005 .
  types:
    ZRT_006_D_SLIP_NO type C length 000040 .
  types ZRT_006_D_CREATION_TIME type T .
  types:
    ZRT_006_D_CREATED_BY type C length 000012 .
  types ZRT_006_D_LAST_CHANGED_TIME type T .
  types:
    ZRT_006_D_LAST_CHANGED_BY type C length 000012 .
  types:
    begin of ZRT_006_T_WLT_I,
      MANDT type MANDT,
      TRANSACTION_NO type ZRT_006_D_TRANS,
      TRANSACTION_TYPE type ZRT_006_D_TR_TYPE,
      DEALER_ID type ZRT_006_D_DEALER_ID,
      STATU type ZRT_006_D_STATU,
      SIGN type ZRT_006_D_SIGN,
      AMOUNT type ZRT_006_D_AMOUNT,
      WAERK type WAERK,
      TRANSACTION_DATE type DATS,
      SLIP_NUMBER type ZRT_006_D_SLIP_NO,
      CREATION_DATE type DATS,
      CREATION_TIME type ZRT_006_D_CREATION_TIME,
      CREATED_BY type ZRT_006_D_CREATED_BY,
      LAST_CHANGED_DATE type DATS,
      LAST_CHANGED_TIME type ZRT_006_D_LAST_CHANGED_TIME,
      LAST_CHANGED_BY type ZRT_006_D_LAST_CHANGED_BY,
    end of ZRT_006_T_WLT_I .
  types:
    __ZRT_006_T_WLT_I              type standard table of ZRT_006_T_WLT_I                with non-unique default key .
endinterface.
