* Macros auxiliares y objetos temporales
local id "02-05"

* Especificación
.table = .ol_table.new
.table.rowvar = "_region_re_v1"
.table.colvar = "_tamano_empresa"
.table.title  = ///
  "2.5. Distribución de ocupados por región según tamaño de empresa, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
