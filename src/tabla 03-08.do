* indicadores  : años promedio de escolaridad
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        : 2 5 8 11
* por          : sector
* según        : año (2010-2015), mes (2 5 8 11)
* agregaciones : "sector"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  * Estadísticas
  .tabla.cmds      = `""mean _esc""'
  .tabla.masks     = `""escolaridad promedio (años)""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_rama1_v1"
  .tabla.aggregate = `""_rama1_v1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_esc _ocupado _rama1_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-08", replace
