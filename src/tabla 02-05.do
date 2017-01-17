* indicadores  : distribución de ocupados
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : TEM¹ (incluyendo TCCU²)
* según        : región de residencia (rr)
* agregaciones : "rr", "TEM", "rr, TEM"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Abreviaciones
  local rr  "_region_re_v1"
  local tem "_tamaño_empresa"
  * Estadísticas
  .table.cmds      = `""proportion `tem'""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "`tem'"
  .table.along     = "`rr'"
  .table.aggregate = `""`tem'" "`rr'" "`tem' `rr'""'
  * Estructura
  .table.rowvar    = "`rr'"
  .table.colvar    = "`tem'"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_ocupado `rr' `tem'"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 02-05", replace

* Exportación
.table.export_excel bh, file("tabla 02-05")
.table.export_excel cv, file("tabla 02-05")

* Notas al pie
* ¹ Tamaño de empresa (de acuerdo al número de trabajadores)
* ² Trabajadores por Cuenta Propia Unipersonales
