* Macros auxiliares
local id "03-09"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_rama1_v1"
.table.colvar = "_educ"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
	use "`origen'/`id'.dta", clear
	.table.annualize_v`j', over("_educ _rama1_v1")
	.table.as_proportion, by("_educ") along("_rama1_v1")
	save `df`j'', replace
}

* Exportación
forvalues j = 1(1)2 {
	foreach var in bh cv {
		* Cuerpo
		use `df`j'', clear
		local file "`destino'/`name'/`var' [`j'].xlsx"
		.table.export_excel `var', file("`file'") sheet("`id'")

		* Título
		putexcel set "`file'", sheet("`id'") modify
		putexcel A1 = ///
			"3.9. Distribución de ocupados por sector económico según nivel educacional, 2015", ///
			font("Times New Roman", 11) bold
	}
}
