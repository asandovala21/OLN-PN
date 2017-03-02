* Macros auxiliares y objetos temporales
local id "03-09"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "_educ"
.table.title  = ///
  "3.9. Distribución de ocupados por sector económico según nivel educacional, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
