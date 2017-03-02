* Macros auxiliares y objetos temporales
local id "03-16"

* Especificación
.table = .ol_table.new
.table.rowvar = "_oficio1"
.table.colvar = "_cise_v3"
.table.title  = ///
  "3.16. Distribución de ocupados por ocupación según categoría ocupacional, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
