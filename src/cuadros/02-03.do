* Macros auxiliares
local id "02-03"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "temp"
.table.colvar = "año"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
	* Ocupados (N)
  use "`origen'/`id'.dta", clear
  rename _tamaño_empresa_v1 temp
	.table.annualize_v`j', over("temp")
  .table.as_proportion, by("temp")
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
    			"2.3. Evolución distribución de ocupados según tamaño de empresa, 2010-2015", ///
    			font("Times New Roman", 11) bold
	}
}
