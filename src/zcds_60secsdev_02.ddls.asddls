@AbapCatalog.sqlViewName: 'ZCDS60SECDEV02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Join SPFLI y SCARR'
define view ZCDS_60SECSDEV_02 as select from spfli
left outer join scarr
    on spfli.carrid = scarr.carrid {
    spfli.mandt as Mandt,
    spfli.carrid as Carrid,
    scarr.carrname as carrname,
    scarr.url as url,
    scarr.currcode as currcode,
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
