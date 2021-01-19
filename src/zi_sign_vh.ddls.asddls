@AbapCatalog.sqlViewName: 'ZISIGNVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sign Value Help'
define view ZI_SIGN_VH
  as select from zrt_006_t_sign
{
  key sign,
  sign_text
}
