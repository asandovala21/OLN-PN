* indicadores  : número y distribución
* subpoblación : ocupados
* por          : nivel educacional
* según        : año (2010-2015), mes (2 5 8 11), región
* agregaciones : "región", "nivel educacional", "región y nivel educacional"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _educ""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_region_re_v1 _educ"
  .tabla.aggregate = `""_educ" "_region_re_v1" "_educ _region_re_v1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_educ _ocupado _region_re_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-05", replace
