* Macros auxiliares y objetos temporales
local id "02-04"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "temp"
.table.title  = ///
  "2.4. Distribución de ocupados según tamaño de empresa" + ///
  "por sector económico, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
rename _tamaño_empresa temp
label copy _tamaño_empresa temp
label values temp temp
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
