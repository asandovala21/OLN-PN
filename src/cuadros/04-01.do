/* * Genera los cuadros 0x-01, x = 4-8

* Macros auxiliares
local cuadros   "$proyecto/data/cuadros"
local consultas "$proyecto/data/consultas"
local secciones "_mujer _discapacitado _indigena _joven _inmigrante"
local titulo4   "4.1. Tasas de desocupación, ocupación y participación según sexo, 2009-2015"
local titulo5   "5.1. Tasas de desocupación, ocupación y participación según condición de discapacidad, 2009-2015"
local titulo6   "6.1. Tasas de desocupación, ocupación y participación según pertenencia a pueblo indígena, 2009-2015"
local titulo7   "7.1. Tasas de desocupación, ocupación y participación de jóvenes (15 a 29 años), 2009-2015"
local titulo8   "8.1. Tasas de desocupación, ocupación y participación según condición de inmigrante, 2009-2015"

* Especificación
.table = .ol_table.new
.table.rowvar = "."
.table.colvar = "año"

* Exportación
forvalues j = 1(1)2 {
  foreach var in bh cv {
    local i = 3
    foreach seccion in `secciones' {
      * Filtro
      local ++i
      local sheet "0`i'-01"
      if (`i' == 5) continue

      * Especificación
      .table.rowvar = "`seccion' cmd_lb"

      * Cuerpo
  		use "`consultas'/`sheet'", clear
      local file "`cuadros'/`var' [`j'].xlsx"
      .table.export_excel `var', file("`file'") sheet("`sheet'")

  		* Título
  		putexcel set "`file'", sheet("`sheet'") modify
  		putexcel A1 = "`titulo`i''", font("Times New Roman", 11) bold
    }
  }
} */
