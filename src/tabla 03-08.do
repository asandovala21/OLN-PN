* indicadores  : años promedio de escolaridad
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        :
* por          : sector
* según        :
* agregaciones : "sector"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""mean _esc""'
  .table.masks     = `""escolaridad promedio (años)""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "_rama1_v1"
  .table.along     = ""
  .table.aggregate = "_rama1_v1"
  * Estructura
  .table.rowvar    = "_rama1_v1"
  .table.colvar    = "año"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_esc _ocupado _rama1_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-08", replace

* Exportación
.table.export_excel bh, file("tabla 03-08")
