* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : gran grupo de ocupación (oficio1)
* según        : nivel educacional (educ)
* agregaciones : "oficio1", "educ", "oficio1, educ"
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
  .table.rowvar    = "_educ"
  .table.colvar    = "_oficio1"
  .table.aggregate = `""_educ" "_oficio1" "_educ _oficio1""'
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_educ _ocupado _oficio1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-14", replace

* Exportación
.table.export_excel bh, ///
  file("tabla 03-14") rowvar("_oficio1") colvar("_educ mask")
