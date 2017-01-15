* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        : 2 5 8 11
* por          : sector
* según        : año (2010-2015), mes (2 5 8 11), nivel educacional (educ)
* agregaciones : "sector", "educ", "sector, educ"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _rama1_v1""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_educ _rama1_v1"
  .tabla.aggregate = `""_rama1_v1" "_educ" "_educ _rama1_v1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_educ _ocupado _rama1_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-09", replace
