* Macros auxiliares
local cuadros   "$proyecto/data/cuadros"
local consultas "$proyecto/data/consultas"
local secciones "_mujer _discapacitado _indigena _joven _inmigrante"
local titulo4   "4.4. Distribución de ocupados por género según categoría ocupacional, 2015"
local titulo5   "5.4. Distribución de ocupados por condición de discapacidad según categoría ocupacional, 2015"
local titulo6   "6.4. Distribución de ocupados por pertenencia a pueblo indígena según categoría ocupacional, 2015"
local titulo7   "7.4. Distribución de ocupados por edad según categoría ocupacional, 2015"
local titulo8   "8.4. Distribución de ocupados por condición de inmigrante según categoría ocupacional, 2015"

* Exportación
forvalues j = 1(1)2 {
  foreach var in bh cv {
    local i = 3
    foreach seccion in `secciones' {
      * Filtro
      local ++i
      local sheet "0`i'-04"
      if (`i' == 5) continue

      * Especificación
      .table = .ol_table.new
      .table.rowvar = "`seccion'"
      .table.colvar = "_cise_v3"

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
