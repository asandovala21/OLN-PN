* indicadores  : escolaridad promedio
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        : 2 5 8 11
* por          : región
* según        : año (2010-2015), mes (2 5 8 11)
* agregaciones : "región"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""mean _esc""'
  .table.masks     = `""escolaridad promedio""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "_region_re_v1"
  .table.along     = ""
  .table.aggregate = "_region_re_v1"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_esc _ocupado _region_re_v1"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-04", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-07") rowvar("_region_re_v1") colvar("año")
