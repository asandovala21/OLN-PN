* Macros auxiliares y objetos temporales
local id "03-14"

* Especificación
.table = .ol_table.new
.table.rowvar = "_oficio1"
.table.colvar = "_educ"
.table.title  = ///
  "3.14. Distribución de ocupados por ocupación según nivel educacional, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
