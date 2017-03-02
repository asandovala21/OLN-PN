* Macros auxiliares y objetos temporales
local id "03-03"

* Especificación
.table = .ol_table.new
.table.rowvar = "_educ"
.table.colvar = "año subpop_lb"
.table.title  = ///
  "3.3. Distribución ocupados y desocupados según nivel educacional (%), 2010 y 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
