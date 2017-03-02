* Macros auxiliares y objetos temporales
local id "03-01"

* Especificación
.table = .ol_table.new
.table.rowvar = "cmd_lb"
.table.colvar = "año"
.table.title  = ///
  "3.1. Características generales de los ocupados, 2010-2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
