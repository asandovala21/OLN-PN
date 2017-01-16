* indicadores  : distribución de ocupados
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : nivel educacional (educ)
* según        : gran grupo de ocupación (oficio1)
* agregaciones : "educ", "oficio1", "oficio1, educ"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""proportion _educ""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "_educ"
  .table.along     = "_oficio1"
  .table.aggregate = `""_educ" "_oficio1" "_educ _oficio1""'
  * Estructura
  .table.rowvar    = "_oficio1"
  .table.colvar    = "_educ"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_educ _ocupado _oficio1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-14", replace

* Exportación
.table.export_excel bh, file("tabla 03-14")
