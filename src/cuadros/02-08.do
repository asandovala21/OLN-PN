* Macros auxiliares y objetos temporales
local id "02-08"

* Especificación
.table = .ol_table.new
.table.rowvar = "_cise_v3"
.table.colvar = "_tamano_empresa"
.table.title  = ///
  "2.8. Ingresos de la ocupación principal " + ///
  "por categoría ocupacional y tamaño de empresa, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
