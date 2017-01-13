* indicadores  : número y distribución de ocupados
* subpoblación : ocupados
* años         : 2010-2015
* meses        : 2 5 8 11
* por          : RR
* según        : TEM¹ (excluyendo TCCU²)
* agregaciones : "RR", "TEM", "RR, TEM"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local rr  "_region_re_v1"
  local tem "_tamaño_empresa"
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion `rr'""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1) & (`tem' != 0)"
  .tabla.over      = "`tem' `rr'"
  .tabla.aggregate = `""`rr'" "`tem'" "`rr' `tem'""'
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_ocupado `rr' `tem'"
* Estimación
.tabla.create
save "$proyecto/data/tabla 02-05", replace

* Notas al pie
* ¹. Tamaño de empresa (de acuerdo al número de trabajadores)
* ². Trabajadores por Cuenta Propia Unipersonales
