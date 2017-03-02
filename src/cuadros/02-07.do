* Macros auxiliares y objetos temporales
local id "02-07"

* Especificación
.table = .ol_table.new
.table.rowvar = "temp"
.table.colvar = "_cise_v3"
.table.title  = ///
  "2.7. Distribución de ocupados por tamaño de empresa" + ///
  "según categoría ocupacional, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
rename _tamaño_empresa temp
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
