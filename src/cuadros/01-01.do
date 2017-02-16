* Macros auxiliares
local id "01-01"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "año mes"
.table.colvar = "cmd_lb"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
  use "`origen'/`id'.dta", clear
  save `df`j'', replace
}

* Exportación
forvalues j = 1(1)2 {
	* Preparación de la BBDD
	use `df`j'', clear

  * Exportación
	foreach var in bh cv {
		* Cuerpo
		local file "`destino'/`var' [`j'].xlsx"
		.table.export_excel `var', file("`file'") sheet("`id'")

		* Título
		putexcel set "`file'", sheet("`id'") modify
		putexcel A1 = ///
			"1.1. Evolución tasas de desempleo, ocupación y participación, 2010-2016", ///
			font("Times New Roman", 11) bold
	}
}
