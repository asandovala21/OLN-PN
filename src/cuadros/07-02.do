* Macros auxiliares y objetos temporales
local id "07-02"

* Especificación
.table = .ol_table.new
.table.rowvar = "_tramo_edad_v3"
.table.colvar = "_mujer cmd_lb"
.table.title  = ///
  "7.2. Distribución de jóvenes que no estudian " +  ///
  "ni trabajan o buscan trabajo por género según edad, 2015"

* Exportación
use "$proyecto/data/consultas/`id'.dta", clear
.table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
