* Macros auxiliares y objetos temporales
local id "01-04"

* Especificación
.table = .ol_table.new
.table.rowvar = "año mes"
.table.colvar = "_cise_v2"
.table.title  = ///
  "1.4. Distribución (%) ocupados según categoría ocupacional, 2010-2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
