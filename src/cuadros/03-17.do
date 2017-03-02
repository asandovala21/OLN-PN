* Macros auxiliares y objetos temporales
local id "03-17"

* Especificación
.table = .ol_table.new
.table.rowvar = "_oficio1"
.table.colvar = "año"
.table.title  = ///
  "3.17. Promedio de ingresos de la ocupación principal según ocupación, 2010-2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
rename _tamaño_empresa temp
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
