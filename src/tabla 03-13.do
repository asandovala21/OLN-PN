* indicadores  : años promedio de escolaridad
* subpoblación : ocupados
* por          : gran grupo de ocupación (oficio1)
* según        : año (2010-2015), mes (2 5 8 11)
* agregaciones : "oficio1"
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
  .tabla.over      = "_oficio1"
  .tabla.aggregate = `""_oficio1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_esc _ocupado _oficio1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-13", replace
