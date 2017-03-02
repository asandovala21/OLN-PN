* Macros auxiliares y objetos temporales
local id "03-21"

* Especificación
.table = .ol_table.new
.table.rowvar = "_oficio1"
.table.colvar = "cmd_lb"
.table.title  = ///
  "3.21. Conmutación por ocupación, 2016"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
