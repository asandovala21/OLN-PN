* Macros auxiliares y objetos temporales
local id "03-02"

* Especificación
.table = .ol_table.new
.table.rowvar = "_tramo_edad_v1"
.table.colvar = "año subpop_lb"
.table.title  = ///
  "3.2. Distribución de ocupados y desocupados según tramo de edad, 2010 y 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
