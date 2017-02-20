* Macros auxiliares
local id "03-15"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_oficio1"
.table.colvar = "año"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
	use "`origen'/`id'.dta", clear
	.table.annualize_v`j', over("_oficio1")
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
			"3.15. Promedio de edad de ocupados según ocupación, 2010 y 2016", ///
			font("Times New Roman", 11) bold
	}
}
