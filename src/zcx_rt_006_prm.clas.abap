CLASS zcx_rt_006_prm DEFINITION INHERITING FROM cx_dynamic_check
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_t100_message.
    METHODS constructor IMPORTING id    TYPE symsgid
                                  no    TYPE symsgno
                                  text1 TYPE csequence OPTIONAL
                                  text2 TYPE csequence OPTIONAL
                                  text3 TYPE csequence OPTIONAL
                                  text4 TYPE csequence OPTIONAL.
    DATA text1 TYPE c LENGTH 50.
    DATA text2 TYPE c LENGTH 50.
    DATA text3 TYPE c LENGTH 50.
    DATA text4 TYPE c LENGTH 50.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_rt_006_prm IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( ).
    me->text1 = text1.
    me->text2 = text2.
    me->text3 = text3.
    me->text4 = text4.
    if_t100_message~t100key-msgid = id.
    if_t100_message~t100key-msgno = no.
    if_t100_message~t100key-attr1 = 'TEXT1'.
    if_t100_message~t100key-attr2 = 'TEXT2'.
    if_t100_message~t100key-attr3 = 'TEXT3'.
    if_t100_message~t100key-attr4 = 'TEXT4'.
  ENDMETHOD.
ENDCLASS.




