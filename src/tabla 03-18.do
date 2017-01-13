* indicadores  : número y distribución
* subpoblación : ocupados
* por          : condición de conmutante (conmutante)
* según        : año (2010-2015), mes (2 5 8 11), región de residencia (region)
* agregaciones : "conmutante", "region", "conmutante, region"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local conmut "_conmutante_v1"
  local region "_region_re_v1"
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion `conmut'""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1)"
  .tabla.over      = "`region' `conmut'"
  .tabla.aggregate = `""`conmut'" "`region'" "`conmut' `region'""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "`conmut' _ocupado `region'"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-18", replace
