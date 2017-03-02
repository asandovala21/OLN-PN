* Macros auxiliares y objetos temporales
local id "03-04"

* Especificación
.table = .ol_table.new
.table.rowvar = "_region_re_v1"
.table.colvar = "año"
.table.title  = ///
  "3.4. Promedio de años de escolaridad de ocupados según región, 2010 y 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
