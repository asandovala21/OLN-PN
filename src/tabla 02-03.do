* indicadores  : número y distribución de ocupados
* subpoblación : ocupados
* años         : 2010-2015
* meses        : 2 5 8 11
* por          : TEM¹ (excluyendo TCCU²)
* según        :
* agregaciones : TEM
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local tem "_tamaño_empresa"
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion `tem'""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1) & (`tem' != 0)"
  .tabla.over      = "`tem'"
  .tabla.aggregate = "`tem'"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_ocupado `tem'"
* Estimación
.tabla.create
save "$proyecto/data/tabla 02-03", replace

* Notas al pie
* ¹. Tamaño de empresa (de acuerdo al número de trabajadores)
* ². Trabajadores por Cuenta Propia Unipersonales
