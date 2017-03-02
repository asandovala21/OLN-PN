* Macros auxiliares y objetos temporales
local id "03-12"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "año"
.table.title  = ///
  "3.12. Promedio de ingresos ocupación principal según sector económico, 2010 y 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
