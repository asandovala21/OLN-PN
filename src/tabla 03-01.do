* indicadores  : fracción de mujeres, edad promedio y escolaridad promedio
* subpoblación : ocupados
* años         : 2010-2015
* meses        :
* por          :
* según        :
* agregaciones :
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""mean _edad" "mean _esc" "mean _mujer""'
  .table.masks     = `""edad promedio" "escolaridad promedio" "% de mujeres""'
  * Dominios
  .table.years     = "2010 2011 2012 2013 2014 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = ""
  .table.along     = ""
  .table.aggregate = ""
  * Estructura
  .table.rowvar    = "mask"
  .table.colvar    = "año"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_edad _esc _mujer _ocupado"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-01", replace

* Exportación
replace bh = 100 * bh if (mask == 3)
.table.export_excel bh, file("tabla 03-01")
