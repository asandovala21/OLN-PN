* Macros auxiliares y objetos temporales
local id "03-06"

* Especificación
.table = .ol_table.new
.table.rowvar = "_region_re_v1"
.table.colvar = "_cise_v3"
.table.title  = ///
  "3.6. Distribución de ocupados por región según categoría ocupacional, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
