* Macros auxiliares y objetos temporales
local id "07-03"

* Especificación
.table = .ol_table.new
.table.rowvar = "_razon_inactividad"
.table.colvar = "_mujer cmd_lb"
.table.title  =  ///
  "7.3. Distribución de jóvenes que no estudian " +  ///
  "ni trabajan según razones de inactividad, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
