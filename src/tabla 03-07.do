* indicadores  : ingreso promedio de la ocupación principal
* subpoblación : ocupados que mantuvieron su empleo
* años         : 2010 y 2015
* meses        :
* por          : región
* según        :
* agregaciones : "región"
* fuente       : ESI

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""mean _yprincipal""'
  .table.masks     = `""ingreso promedio de la ocupación principal (M$)""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = ""
  .table.subpop    = "if (_ocupado == 1) & (_mantuvo_empleo == 1)"
  .table.rowvar    = "_region_re_v1"
  .table.colvar    = ""
  .table.aggregate = "_region_re_v1"
  * I-O
  .table.src       = "esi"
  .table.varlist0  = "_mantuvo_empleo _ocupado _region_re_v1 _yprincipal"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-07", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-07") rowvar("_region_re_v1") colvar("año")
