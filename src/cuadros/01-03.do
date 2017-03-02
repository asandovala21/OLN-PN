* Macros auxiliares y objetos temporales
local id "01-03"

* Especificación
.table = .ol_table.new
.table.rowvar = "año mes"
.table.colvar = "subpop_lb"
.table.title  = ///
  "1.3. Variación (%) 12 meses ocupados y fuerza de trabajo, 2010-2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
