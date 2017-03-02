* Macros auxiliares y objetos temporales
local id "01-05"

* Especificación
.table = .ol_table.new
.table.rowvar = "año mes"
.table.colvar = "cmd_lb"
.table.title  = ///
  "1.5. Porcentaje de ocupados en jornada parcial involuntaria, 2010-2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
