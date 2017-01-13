* indicadores  : número y distribución
* subpoblación : ocupados
* por          : condición de conmutante (conmut)
* según        : año (2010-2015), mes (2 5 8 11), sector
* agregaciones : "conmut", "sector", "conmut, sector"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local conmut "_conmutante_v1"
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion `conmut'""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1)"
  .tabla.over      = "_rama1_v1 `conmut'"
  .tabla.aggregate = `""`conmut'" "_rama1_v1" "`conmut' _rama1_v1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "`conmut' _ocupado _rama1_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-20", replace
