* indicadores  : número y distribución de ocupados
* subpoblación : ocupados
* años         : 2014
* meses        :
* por          : TEM¹ (incluyendo TCCU²)
* según        :
* agregaciones : "TEM"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _tamaño_empresa""'
  .table.masks     = `""n" "%""'
  * Dominios
  .table.years     = "2014"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if (_ocupado == 1)"
  .table.by        = "_tamaño_empresa"
  .table.along     = ""
  .table.aggregate = "_tamaño_empresa"
  * Estructura
  .table.rowvar    = "_tamaño_empresa"
  .table.colvar    = "id año"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_ocupado _tamaño_empresa"

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 02-02", replace

* Notas al pie
* ¹ Tamaño de empresa (de acuerdo al número de trabajadores)
* ² Trabajadores por Cuenta Propia Unipersonales
