* Macros auxiliares
local id "02-07"
local temp    "_tamaño_empresa_v1"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "`temp'"
.table.colvar = "_cise_v3"

* Preparación de la BBDD
forvalues j = 1(1)2 {
	use "`origen'/`id'.dta", clear
	.table.annualize_v`j', over("_cise_v3 `temp'")
	.table.as_proportion, by("`temp'") along("_cise_v3")
}

* Exportación
forvalues j = 1(1)2 {
	foreach var in bh cv {
		* Cuerpo
		local file "`destino'/`name'/`var' [`j'].xlsx"
		.table.export_excel `var', file("`file'") sheet("`id'")

		* Título
		putexcel set "`file'", sheet("`id'") modify
		putexcel A1 = ///
			"2.7. Distribución de ocupados por tamaño de empresa según categoría ocupacional, 2016", ///
			font("Times New Roman", 11) bold
	}
}
