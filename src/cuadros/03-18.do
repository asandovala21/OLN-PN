* Macros auxiliares y objetos temporales
local id "03-18"

* Especificación
.table = .ol_table.new
.table.rowvar = "region"
.table.colvar = "año subpop_lb"
.table.title  = ///
  "3.18. Conmutación por región, 2010 y 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
