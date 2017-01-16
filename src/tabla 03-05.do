* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        : 2 5 8 11
* por          : nivel educacional
* según        : año (2010-2015), mes (2 5 8 11), región
* agregaciones : "región", "nivel educacional", "región y nivel educacional"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _educ""'
  .table.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.rowvar    = "_educ"
  .table.colvar    = "_region_re_v1"
  .table.aggregate = `""_educ" "_region_re_v1" "_educ _region_re_v1""'
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_educ _ocupado _region_re_v1"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-05", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-07") rowvar("_region_re_v1") colvar("año")
