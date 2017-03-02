* Macros auxiliares y objetos temporales
local id "03-07"

* Especificación
.table = .ol_table.new
.table.rowvar = "_region_re_v1"
.table.colvar = "año"
.table.title  = ///
  "3.7. Promedio de ingresos ocupación principal según región, 2010 y 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
