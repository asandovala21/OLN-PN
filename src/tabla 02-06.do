* indicadores  : número y distribución de ocupados
* subpoblación : ocupados
* años         : 2010-2015
* meses        : 2 5 8 11
* por          : TEM [1] (excluyendo TCCU [2])
* según        : NE [3]
* agregaciones : "NE", "TEM", "NE, TEM"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local ne  "_educ"
  local tem "_tamaño_empresa"
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion `tem'""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1) & (`tem' != 0)"
  .tabla.over      = "`ne' `tem'"
  .tabla.aggregate = `""`tem'" "`ne'" "`tem' `ne'""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "`ne' _ocupado `tem'"
* Estimación
.tabla.create
save "$proyecto/data/tabla 02-06", replace

* Notas al pie
* 1. Tamaño de empresa (de acuerdo al número de trabajadores)
* 2. Trabajadores por Cuenta Propia Unipersonales
* 3. Nivel educacional
