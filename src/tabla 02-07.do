* indicadores  : número y distribución de ocupados
* subpoblación : ocupados
* años         : 2010-2015
* meses        : 2 5 8 11
* por          : TEM [2] (excluyendo TCCU [3])
* según        : CISE
* agregaciones : "TEM", "CISE", "TEM, CISE"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local cise "_cise_v1"
  local tem  "_tamaño_empresa"
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion `tem'""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1) & (`tem' != 0)"
  .tabla.over      = " `cise' `tem'"
  .tabla.aggregate = `""`tem'" "`cise'" "`tem' `cise'""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "`cise' _ocupado `tem'"
* Estimación
.tabla.create
save "$proyecto/data/tabla 02-07", replace

* Notas al pie
* 1. Nivel educacional
* 2. Tamaño de empresa (de acuerdo al número de trabajadores)
* 3. Trabajadores por Cuenta Propia Unipersonales
