* Macros auxiliares
local id "01-06"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "año"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
  * Anualización
  use "`origen'/`id'.dta", clear
  .table.annualize_v`j', over("_rama1_v1")

  * Anexión
  replace cmd_type = "mean"
  replace bh = bh / 1000
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
			"1.6. Evolución ocupados (miles de personas) por sector económico, 2010-2016.", ///
			font("Times New Roman", 11) bold
	}
}
