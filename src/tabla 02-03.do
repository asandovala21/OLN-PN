* indicadores  : distribución de ocupados
* subpoblación : ocupados
* años         : 2010-2015
* meses        :
* por          : TEM¹ (incluyendo TCCU²)
* según        :
* agregaciones : TEM
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""proportion _tamaño_empresa""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2010 2011 2012 2013 2014 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if (_ocupado == 1)"
  .table.by        = "_tamaño_empresa"
  .table.along     = ""
  .table.aggregate = "_tamaño_empresa"
  * Estructura
  .table.rowvar    = "_tamaño_empresa"
  .table.colvar    = "año"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_ocupado _tamaño_empresa"

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 02-03", replace

* Exportación
.table.export_excel bh, file("tabla 02-03")
.table.export_excel cv, file("tabla 02-03")

* Notas al pie
* ¹ Tamaño de empresa (de acuerdo al número de trabajadores)
* ² Trabajadores por Cuenta Propia Unipersonales
