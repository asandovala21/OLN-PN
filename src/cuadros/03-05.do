* Macros auxiliares
local id "03-05"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_region_re_v1"
.table.colvar = "_educ"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
	use "`origen'/`id'.dta", clear
	.table.annualize_v`j', over("_educ _region_re_v1")
	.table.as_proportion, by("_educ") along("_region_re_v1")
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
			"3.5. Distribución de ocupados según nivel educacional por región, 2016", ///
			font("Times New Roman", 11) bold
	}
}
