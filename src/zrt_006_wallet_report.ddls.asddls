@AbapCatalog.sqlViewName: 'ZRT006WALLET01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Plant'

@VDM.viewType: #BASIC
//@Search.searchable: true

@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory : #L
@ObjectModel.usageType.dataClass: #MASTER
@ClientHandling.algorithm: #SESSION_VARIABLE
@OData.publish: true
@Metadata.allowExtensions: true

define view ZRT_006_WALLET_REPORT
  as select from ZRT_006_WALLET_REPORT_00 as item
  association [1..*] to but000         as _Bp              on $projection.DealerId = _Bp.bpext
  association [1..1] to zrt_006_t_prm  as _Prm             on $projection.DealerId = _Prm.dealer_id
  association [1..1] to zrt_006_t_sign as _Sign            on $projection.Sign = _Sign.sign
  association [1..1] to zrt_006_t_type as _TransactionType on $projection.TransactionTypeText = _TransactionType.transaction_type

{
      @EndUserText: { label:  'Transaction No', quickInfo: 'Transaction Number' }
  key transaction_no                          as transactionNo,
      @ObjectModel.foreignKey.association: '_TransactionType'
      @EndUserText: { label:  'Transaction Type',
         quickInfo: '01:WALLET TOP UP - 02:WALLET DISPUTE ' }
      TransactionType                         as TransactionType,
      @EndUserText.label: 'Type Text'
      TransactionTypeText                     as TransactionTypeText,
      @ObjectModel.foreignKey.association: '_Prm'
      //      @Search.defaultSearchElement: true
      //      @Search.fuzzinessThreshold: 0.8

      @EndUserText: { label:  'Wallet Responsible', quickInfo: 'Wallet Responsible' }
      parentId                                as DealerId,

      @EndUserText: { label:  'Sub Name', quickInfo: 'Sub Name' }
      item.nameOfSubOrganization,


      @EndUserText: { label:  'Name', quickInfo: 'Name of Organization' }
      _Bp.name_org1                           as nameOfOrganization,

      @EndUserText: { label:  'Parent', quickInfo: 'Parent Id' }
      parentId                                as parentId,


      @EndUserText: { label:  'T.Responsible', quickInfo: 'Transaction responsible' }
      childId                                 as childId,

      statu,
      @ObjectModel.foreignKey.association: '_Sign'
      @EndUserText: { label:  '+/-', quickInfo: 'Sign of Amount +/-' }
      Sign                                    as Sign,
      SignText                                as SignText,
      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencyCode'
      fltp_to_dec( Amount as abap.dec(13,2) ) as Amount,
      @Semantics.currencyCode: true
      CurrencyCode                            as CurrencyCode,
      transaction_date,
      SlipNumber                              as SlipNumber,
      @EndUserText: { label:  'Date', quickInfo: 'Date' }
      CreationDate                            as CreationDate,
      CreationTime                            as CreationTime,
      created_by,
      last_changed_date,
      last_changed_time,
      last_changed_by,
      case Sign when '+' then 3
                when '-' then 1
                else 0
                end                           as Criticality,
      _Bp,
      _Prm,
      _Sign,
      _TransactionType


      //      @Search.defaultSearchElement: true
      //      @Search.fuzzinessThreshold: 0.8
      //      @ObjectModel.text.association: '_MaterialText'
      //  key marc.matnr as Product,
      //
      //      @Search.defaultSearchElement: true
      //      @Search.fuzzinessThreshold: 0.8
      //      @ObjectModel.text.element: 'PlantName'
      //  key marc.werks as Plant,
      //      _Plant.PlantName,
      //
      //      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      //      marc.eisbe as MaterialSafetyStockQty,
      //
      //      @Semantics.unitOfMeasure: true
      //      mara.meins as MaterialBaseUnit,
      //
      //      @ObjectModel.foreignKey.association: '_MaterialGroup'
      //      mara.matkl as MaterialGroup,
      //
      //      _MaterialText,
      //      _MaterialGroup
}
