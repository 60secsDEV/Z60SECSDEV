@AbapCatalog.sqlViewName: 'ZCDS60SECDEV01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '1era vista CDS'
define view ZCDS_60SECSDEV_01 as select from spfli {
    mandt as Mandt,
    carrid as Carrid,
    connid as Connid,
    countryfr as Countryfr,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    countryto as Countryto,
    cityto as Cityto,
    airpto as Airpto,
    fltime as Fltime,
    deptime as Deptime,
    arrtime as Arrtime,
    distance as Distance,
    distid as Distid,
    fltype as Fltype,
    period as Period
}
