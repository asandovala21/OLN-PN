* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : nivel educacional (educ)
* según        : región
* agregaciones : "educ", "región", "región x educ"
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
  .table.along     = "_region_re_v1"
  .table.aggregate = `""_educ" "_region_re_v1" "_educ _region_re_v1""'
  * Estructura
  .table.rowvar    = "_region_re_v1"
  .table.colvar    = "_educ"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_educ _ocupado _region_re_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-05", replace

* Exportación
.table.export_excel bh, file("tabla 03-05")
.table.export_excel cv, file("tabla 03-05")
