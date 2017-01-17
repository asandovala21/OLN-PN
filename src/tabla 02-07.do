* indicadores  : distribución de ocupados
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : CISE
* según        : TEM¹ (incluyendo TCCU²)
* agregaciones : "TEM", "CISE", "TEM, CISE"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Abreviaciones
  local tem  "_tamaño_empresa"
  * Estadísticas
  .table.cmds      = `""proportion _cise_v1""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "_cise_v1"
  .table.along     = "`tem'"
  .table.aggregate = `""_cise_v1" "`tem'" "_cise_v1 `tem'""'
  * Estructura
  .table.rowvar    = "_cise_v1"
  .table.colvar    = "`tem'"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_cise_v1 _ocupado `tem'"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 02-07", replace

* Exportación
.table.export_excel bh, file("tabla 02-07")

* Notas al pie
* ¹ Tamaño de empresa (de acuerdo al número de trabajadores)
* ² Trabajadores por Cuenta Propia Unipersonales
