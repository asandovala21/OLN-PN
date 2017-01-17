* indicadores  : ingreso promedio de la ocupación principal
* subpoblación : ocupados que mantuvieron su empleo
* años         : 2010 y 2015
* meses        :
* por          : gran grupo de ocupación (oficio1)
* según        :
* agregaciones : "oficio1"
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
  .table.by        = "_oficio1"
  .table.along     = ""
  .table.aggregate = "_oficio1"
  * Estructura
  .table.rowvar    = "_oficio1"
  .table.colvar    = "año"
  * I-O
  .table.src       = "esi"
  .table.varlist0  = "_ocupado _mantuvo_empleo _oficio1 _yprincipal"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-17", replace

* Exportación
.table.export_excel bh, file("tabla 03-17")
.table.export_excel cv, file("tabla 03-17")
