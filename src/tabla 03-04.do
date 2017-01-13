* indicadores  : Escolaridad promedio
* subpoblación : ocupados
* según        : año (2010-2015), mes (2 5 8 11), región
* agregaciones : "región"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Estadísticas
  .tabla.cmds      = `""mean _esc""'
  .tabla.masks     = `""escolaridad promedio""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_region_re_v1"
  .tabla.aggregate = "_region_re_v1"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_esc _ocupado _region_re_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-04", replace
