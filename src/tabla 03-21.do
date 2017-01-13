* indicadores  : número y distribución
* subpoblación : ocupados
* por          : condición de conmutante (conmut)
* según        : año (2010-2015), mes (2 5 8 11), oficio1
* agregaciones : "conmut", "oficio1", "conmut, oficio1"
* fuente       : ENE
* nota: oficio1 es una abreviación para "gran grupo de ocupación (CIUO-88)"

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
  .tabla.over      = "_oficio1 `conmut'"
  .tabla.aggregate = `""`conmut'" "_oficio1" "`conmut' _oficio1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "`conmut' _ocupado _oficio1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-21", replace
