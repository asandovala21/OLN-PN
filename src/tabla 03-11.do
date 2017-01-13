* indicadores  : número y distribución
* subpoblación : ocupados
* por          : sector
* según        : año (2010-2015), mes (2 5 8 11), cise
* agregaciones : "sector", "cise", "sector, cise"
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
  .tabla.over      = "_cise_v1 _rama1_v1"
  .tabla.aggregate = `""_rama1_v1" "_cise_v1" "_cise_v1 _rama1_v1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_cise_v1 _ocupado _rama1_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-11", replace
