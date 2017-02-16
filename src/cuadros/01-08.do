* Macros auxiliares
local id "01-08"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "subpop_lb"

* Preparación de la BBDD - Panel N°1
tempfile df1 df2
forvalues j = 1(1)2 {
  use "`origen'/`id' [1].dta", clear
  .table.annualize_v`j', over("_rama1_v1")
  .table.as_proportion, by("_rama1_v1") along("")
  append using "`origen'/`id' [2].dta"
  label define subpop_lb 1 "Ocupados" 2 "PIB", modify
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
			"1.8. Distribución (%) PIB nominal y ocupados según rama de actividad económica, 2015", ///
			font("Times New Roman", 11) bold
	}
}
