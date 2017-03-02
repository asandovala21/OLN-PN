* Macros auxiliares y objetos temporales
local id "03-15"

* Especificación
.table = .ol_table.new
.table.rowvar = "_oficio1"
.table.colvar = "año"
.table.title  = ///
  "3.15. Promedio de edad de ocupados según ocupación, 2010 y 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
