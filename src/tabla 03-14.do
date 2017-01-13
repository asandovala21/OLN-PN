* indicadores  : número y distribución
* subpoblación : ocupados
* por          : gran grupo de ocupación (oficio1)
* según        : año (2010-2015), mes (2 5 8 11), nivel educacional (educ)
* agregaciones : "oficio1", "educ", "oficio1, educ"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _oficio1""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_educ _oficio1"
  .tabla.aggregate = `""_oficio1" "_educ" "_educ _oficio1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_educ _ocupado _oficio1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-14", replace
