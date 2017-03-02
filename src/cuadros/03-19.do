* Macros auxiliares y objetos temporales
local id "03-19"

* Especificación
.table = .ol_table.new
.table.rowvar = "region"
.table.colvar = "subpop_lb"
.table.title  = ///
  "3.19. Promedio años de escolaridad conmutantes por región, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
