* Macros auxiliares y objetos temporales
local id "03-05"

* Especificación
.table = .ol_table.new
.table.rowvar = "_region_re_v1"
.table.colvar = "_educ"
.table.title  = ///
  "3.5. Distribución de ocupados según nivel educacional por región, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
