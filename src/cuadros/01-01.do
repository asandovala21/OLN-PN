* Macros auxiliares y objetos temporales
local id "01-01"

* Especificación
.table = .ol_table.new
.table.rowvar = "año mes"
.table.colvar = "cmd_lb"
.table.title  = ///
  "1.1. Evolución tasas de desempleo, ocupación y participación, 2010-2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
