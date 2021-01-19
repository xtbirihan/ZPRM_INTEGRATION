@AbapCatalog.sqlViewName: 'ZIDEALERIDVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Dealer ID Value Help'
define view ZI_DEALER_ID_VH
  as select from zrt_006_t_prm
{
  key dealer_id as DealerId,
      werks,
      name_org1,
      city
}
