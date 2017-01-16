* indicadores  : distribución de personas
* subpoblación : ocupados o desocupados
* años         : 2010 y 2015
* meses        :
* por          : nivel educacional
* según        : situación de actividad (ocupado vs desocupado)
* agregaciones : "nivel educacional"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""proportion _educ""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if inrange(_activ, 1, 2)"
  .table.by        = "_educ"
  .table.along     = "_activ"
  .table.aggregate = "_educ"
  * Estructura
  .table.rowvar    = "_educ"
  .table.colvar    = "año _activ"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_activ _educ"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-02-03", replace

* Exportación
.table.export_excel bh, file("tabla 03-03")
