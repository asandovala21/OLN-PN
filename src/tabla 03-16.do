* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        : 2 5 8 11
* por          : gran grupo de ocupación (oficio1)
* según        : año (2010-2015), mes (2 5 8 11), cise
* agregaciones : "oficio1", "cise", "oficio1, cise"
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
  .tabla.over      = "_cise_v1 _oficio1"
  .tabla.aggregate = `""_oficio1" "_cise_v1" "_cise_v1 _oficio1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_cise_v1 _ocupado _oficio1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-16", replace
