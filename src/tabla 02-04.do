* indicadores  : distribución de ocupados
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : TEM¹ (incluyendo TCCU²)
* según        : sector
* agregaciones : "TEM", "sector", "sector, TEM"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Abreviaciones
  local tem "_tamaño_empresa"
  * Estadísticas
  .table.cmds      = `""proportion `tem'""'
  .table.masks     = `""% ocupados""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "`tem'"
  .table.along     = "_rama1_v1"
  .table.aggregate = `""_rama1_v1" "`tem'" "`tem' _rama1_v1""'
  * Estructura
  .table.rowvar    = "_rama1_v1"
  .table.colvar    = "`tem'"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_ocupado _rama1_v1 `tem'"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 02-04", replace

* Exportación
.table.export_excel bh, file("tabla 02-04")

* Notas al pie
* ¹ Tamaño de empresa (de acuerdo al número de trabajadores)
* ² Trabajadores por Cuenta Propia Unipersonales
