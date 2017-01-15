* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        : 2 5 8 11
* por          : condición de conmutante (conmutante)
* según        : año (2010-2015), mes (2 5 8 11), oficio1
* agregaciones : "conmutante", "oficio1", "conmutante, oficio1"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local comnutante "_conmutante_v1"
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion `comnutante'""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1)"
  .tabla.over      = "_oficio1 `comnutante'"
  .tabla.aggregate = `""`comnutante'" "_oficio1" "`comnutante' _oficio1""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "`comnutante' _ocupado _oficio1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-21", replace
