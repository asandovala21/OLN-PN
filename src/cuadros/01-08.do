* Macros auxiliares y objetos temporales
local id "01-08"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "cmd_lb"
.table.title  = ///
  "1.8. Distribución (%) PIB nominal y ocupados " + ///
   "según rama de actividad económica, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
