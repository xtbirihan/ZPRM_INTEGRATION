@AbapCatalog.sqlViewName: 'ZITRANSTYPEVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transaction Type Value Help'
define view ZI_TRANSACTION_TYPE_VH
  as select from zrt_006_t_type
{
  key transaction_type as TransactionType,
  transaction_type_text
}
