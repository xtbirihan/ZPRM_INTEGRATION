@AbapCatalog.sqlViewName: 'ZRTWALLETSUM01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Wallet Sum'
define view ZRT_006_WALLET_SUM_01
  as select from zrt_006_t_wlt_i as _wallet
    inner join   zrt_006_t_prm   as _prm on _wallet.dealer_id = _prm.dealer_id
{
  @EndUserText.label: 'Dealer Id'
  _wallet.dealer_id,
   @EndUserText.label: 'Plant'
  _prm.werks,

 @EndUserText.label: 'Wallet Balance'
  sum( case when _wallet.transaction_type = '01' then _wallet.amount
       when _wallet.transaction_type = '01'  and _wallet.sign = '+' then 
       cast( _wallet.amount as abap.dec( 15, 2 ))
       when _wallet.transaction_type = '01'  and _wallet.sign = '-' 
       then cast(_wallet.amount as abap.dec( 15, 2 ))
       when _wallet.transaction_type = '02'  and _wallet.sign = '+' then 
       cast(_wallet.amount as abap.dec( 15, 2 ))
       when _wallet.transaction_type = '02'  and _wallet.sign = '-' then 
       cast(_wallet.amount * -1 as abap.dec( 15, 2 ))
       when _wallet.transaction_type = '03'  and _wallet.sign = '+' then 
       cast( _wallet.amount as abap.dec( 15, 2 ))
       when _wallet.transaction_type = '03'  and _wallet.sign = '-' then 
       cast(_wallet.amount * -1 as abap.dec( 15, 2 ))
       else 0.00
       end ) as WALLET_BALANCE

}
group by
  _wallet.dealer_id,
  _prm.werks
