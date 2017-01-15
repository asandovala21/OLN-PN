* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        : 2 5 8 11
* por          : categoría ocupacional (cise)
* según        : año (2010-2015), mes (2 5 8 11), región
* agregaciones : "región", "cise", "región y cise"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _cise_v1""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_region_re_v1 _cise_v1"
  .tabla.aggregate = `""_cise_v1" "_region_re_v1" "_cise_v1 _region_re_v1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_cise_v1 _ocupado _region_re_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-06", replace
