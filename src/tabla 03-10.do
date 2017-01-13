* indicadores  : promedio de edad
* subpoblación : ocupados
* por          : sector
* según        : año (2010-2015), mes (2 5 8 11)
* agregaciones : "sector"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  * Estadísticas
  .tabla.cmds      = `""mean _edad""'
  .tabla.masks     = `""edad promedio (años)""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_rama1_v1"
  .tabla.aggregate = "_rama1_v1"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_edad _ocupado _rama1_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-10", replace
