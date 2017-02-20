* Macros auxiliares
local cuadros   "$proyecto/data/cuadros"
local consultas "$proyecto/data/consultas"
local secciones "_mujer _discapacitado _indigena _joven _inmigrante"
local titulo4   "4.5. Ingresos de la ocupación principal por género para trabajadores dependientes y por cuenta propia según nivel educacional, 2015"
local titulo5   "5.5. Ingresos de la ocupación principal por condición de discapacidad para trabajadores dependientes y por cuenta propia según nivel educacional, 2015"
local titulo6   "6.5. Ingresos según pertenencia a pueblo indígena para trabajadores dependientes y por cuenta propia según nivel educacional, 2015"
local titulo7   "7.5. Ingresos según edad para trabajadores dependientes y por cuenta propia según nivel educacional, 2015"
local titulo8   "8.5. Ingresos según condición de inmigrante para trabajadores dependientes y por cuenta propia según nivel educacional, 2015"

* Exportación
forvalues j = 1(1)2 {
  foreach var in bh cv {
    local i = 3
    foreach seccion in `secciones' {
      * Filtro
      local ++i
      local sheet "0`i'-05"
      if (`i' == 5) continue

      * Especificación
      .table = .ol_table.new
      .table.rowvar = "_educ"
      .table.colvar = "`seccion' _cise_v1"

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
