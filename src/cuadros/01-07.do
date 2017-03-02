* Macros auxiliares y objetos temporales
local id "01-07"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "año"
.table.title  = ///
  "1.7. Evolución PIB encadenado (en miles de millones), 2010-2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
