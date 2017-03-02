* Macros auxiliares y objetos temporales
local id "03-11"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "_cise_v3"
.table.title  = ///
  "3.11. Categoría ocupacional según sector económico (%), 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
