@AbapCatalog.sqlViewName: 'ZRT006WALLET00'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Plant'

@VDM.viewType: #BASIC

@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory : #L
@ObjectModel.usageType.dataClass: #MASTER
@ClientHandling.algorithm: #SESSION_VARIABLE
@Metadata.allowExtensions: true

define view ZRT_006_WALLET_REPORT_00
  as select from zrt_006_t_wlt_i as item
    inner join   but000          as Bp  on item.dealer_id = Bp.bpext
    inner join   zrt_006_t_prm   as prm on item.dealer_id = prm.dealer_id
{
  key item.transaction_no,
      item.transaction_type      as TransactionType,
      item.transaction_type_text as TransactionTypeText,
      item.dealer_id             as DealerId,

      case prm.dealer_id_type
      when '01' then item.dealer_id
      when '02' then prm.dealer_id_link
      else ''
      end                        as parentId,

      case prm.dealer_id_type
           when '01' then item.dealer_id
           when '02' then item.dealer_id
           else ''
           end                   as childId,


      item.statu,
      item.sign                  as Sign,
      item.sign_text             as SignText,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      case when  item.transaction_type = '01' then amount
                  when item.transaction_type = '01'  and  sign = '+' then
                  cast(amount as abap.dec( 15, 2 ))
                  when item.transaction_type = '01'  and sign = '-' then
                  cast(amount as abap.dec( 15, 2 ))
                  when item.transaction_type = '02'  and sign = '+' then
                  cast(amount as abap.dec( 15, 2 ))
                  when item.transaction_type = '02'  and sign = '-' then
                  cast( amount * -1 as abap.dec( 15, 2 ))
                  when item.transaction_type = '03'  and sign = '+' then
                  cast(amount as abap.dec( 15, 2 ))
                  when item.transaction_type = '03'  and sign = '-' then
                  cast( amount * -1 as abap.dec( 15, 2 ))
                  else 0.00
                  end            as Amount,

      @Semantics.currencyCode: true
      item.waerk                 as CurrencyCode,
      item.transaction_date,
      item.slip_number           as SlipNumber,
      item.creation_date         as CreationDate,
      item.creation_time         as CreationTime,
      item.created_by,
      item.last_changed_date,
      item.last_changed_time,
      item.last_changed_by,
      
      Bp.name_org1               as nameOfSubOrganization
}
