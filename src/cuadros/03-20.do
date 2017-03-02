* Macros auxiliares y objetos temporales
local id "03-20"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "cmd_lb"
.table.title  = ///
  "3.20. Conmutación según sector económico, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
