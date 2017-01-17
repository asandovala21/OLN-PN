* indicadores  : ingreso promedio de la ocupación principal
* subpoblación : ocupados que mantuvieron su empleo
* años         : 2015
* meses        :
* por          : CISE
* según        : TEM¹ (incluyendo TCCU²)
* agregaciones : "TEM", "CISE", "TEM, CISE"
* fuente       : ESI

* Especificación
.table = .ol_table.new
  * Abreviaciones
  local tem  "_tamaño_empresa"
  * Estadísticas
  .table.cmds      = `""mean _yprincipal""'
  .table.masks     = `""promedio YOPR (M$)""'
  * Dominios
  .table.years     = "2015"
  .table.months    = ""
  .table.subpop    = "if (_ocupado == 1) & (_mantuvo_empleo == 1)"
  .table.by        = "_cise_v3"
  .table.along     = "`tem'"
  .table.aggregate = `""_cise_v3" "`tem'" "_cise_v3 `tem'""'
  * Estructura
  .table.rowvar    = "_cise_v3"
  .table.colvar    = "`tem'"
  * I-O
  .table.src       = "esi"
  .table.varlist0  = "_cise_v3 _mantuvo_empleo _ocupado `tem' _yprincipal"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 02-08", replace

* Exportación
.table.export_excel bh, file("tabla 02-08")
.table.export_excel cv, file("tabla 02-08")

* Notas al pie
* ¹ Tamaño de empresa (de acuerdo al número de trabajadores)
* ² Trabajadores por Cuenta Propia Unipersonales
