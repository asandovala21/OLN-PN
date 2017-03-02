* Macros auxiliares y objetos temporales
local id "01-09"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "_region_tr_v1"
.table.title  = ///
  "1.9. Ocupados por región de trabajo según sector económico (%), 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
