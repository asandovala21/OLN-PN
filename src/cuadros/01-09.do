* Macros auxiliares
local id "01-09"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "_region_tr_v1"

* Preparación de la BBDD - Panel N°1
tempfile df1 df2
forvalues j = 1(1)2 {
  use "`origen'/`id'.dta", clear
  .table.annualize_v`j', over("_region_tr_v1 _rama1_v1")
  .table.as_proportion, by("_rama1_v1") along("_region_tr_v1")
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
			"1.9. Ocupados por región de trabajo según sector económico (%), 2016", ///
			font("Times New Roman", 11) bold
	}
}
