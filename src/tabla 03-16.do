* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : cise (distinguiendo tipo de contrato)
* según        : gran grupo de ocupación (oficio1)
* agregaciones : "cise", "oficio1", "oficio1, cise"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""proportion _oficio1""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.rowvar    = "_cise_v2"
  .table.colvar    = "_oficio1"
  .table.aggregate = `""_cise_v2" "_oficio1" "_cise_v2 _oficio1""'
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_cise_v2 _ocupado _oficio1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-16", replace

* Exportación
.table.export_excel bh, ///
  file("tabla 03-16") rowvar("_oficio1") colvar("_cise_v2")
