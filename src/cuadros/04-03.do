* Macros auxiliares
local cuadros   "$proyecto/data/cuadros"
local consultas "$proyecto/data/consultas"
local secciones "_mujer _discapacitado _indigena _joven _inmigrante"
local titulo4   "4.3. Distribución de inactivos por género según razones de inactividad, 2015"
local titulo5   "5.3. Distribución de inactivos por condición de discapacidad según razones de inactividad, personas entre 15 y 60 años, 2015"
local titulo6   "6.3. Distribución de inactivos por pertenencia a pueblo indígena según razones de inactividad, personas entre 15 y 60 años, 2015"
local titulo7   "7.3. Distribución de jóvenes que no estudian ni trabajan según razones de inactividad, 2015"
local titulo8   "8.3. Razones de inactividad según condición de inmigrante, 2015"

* Exportación
forvalues j = 1(1)2 {
  foreach var in bh cv {
    local i = 3
    foreach seccion in `secciones' {
      * Filtro
      local ++i
      local sheet "0`i'-03"
      if (`i' == 5) continue

      * Especificación
      .table = .ol_table.new
      .table.rowvar = "_razon_inactividad"
      .table.colvar = "`seccion' cmd_lb"

      * Cuerpo
  		use "`consultas'/`sheet'", clear
      local file "`cuadros'/`var' [`j'].xlsx"
      .table.export_excel `var', file("`file'") sheet("`sheet'")

  		* Título
  		putexcel set "`file'", sheet("`sheet'") modify
  		putexcel A1 = "`titulo`i''", font("Times New Roman", 11) bold
    }
  }
}
