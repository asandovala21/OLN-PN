* indicadores  : distribución de ocupados
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : nivel educacional (educ)
* según        : sector
* agregaciones : "sector", "educ", "sector, educ"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `"""proportion _educ""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.rowvar    = "_educ"
  .table.colvar    = "_rama1_v1"
  .table.aggregate = `""_educ" "_rama1_v1" "_educ _rama1_v1""'
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_educ _ocupado _rama1_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-09", replace

* Exportación
.table.export_excel bh, ///
  file("tabla 03-09") rowvar("_rama1_v1") colvar("_educ")
