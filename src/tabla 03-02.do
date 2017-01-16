* indicadores  : distribución de personas
* subpoblación : ocupados o desocupados
* años         : 2010 y 2015
* meses        :
* por          : tramo de edad
* según        : situación de actividad (ocupado vs desocupado)
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""proportion _tramo_edad_v1""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if inrange(_activ, 1, 2)"
  .table.by        = "_tramo_edad_v1"
  .table.along     = "_activ"
  .table.aggregate = "_tramo_edad_v1"
  * Estructura
  .table.rowvar    = "_tramo_edad_v1"
  .table.colvar    = "año _activ"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_activ _tramo_edad_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-02", replace

* Exportación
.table.export_excel bh, file("tabla 03-02")
