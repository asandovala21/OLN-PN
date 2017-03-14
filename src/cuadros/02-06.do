* Macros auxiliares y objetos temporales
local id "02-06"

* Especificación
.table = .ol_table.new
.table.rowvar = "_educ"
.table.colvar = "_tamano_empresa cmd_lb"
.table.title  = ///
  "2.6. Distribución de ocupados por tamaño de empresa" + ///
  "según nivel educacional, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
