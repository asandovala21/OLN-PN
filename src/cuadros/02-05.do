* Macros auxiliares
local id "02-05"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_region_re_v1"
.table.colvar = "temp"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
	* Ocupados (N)
  use "`origen'/`id'.dta", clear
  rename _tamaño_empresa_v1 temp
	.table.annualize_v`j', over("_region_re_v1 temp")
  .table.as_proportion, by("temp") along("_region_re_v1")
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
    			"2.5. Distribución de ocupados por región según tamaño de empresa, 2016", ///
    			font("Times New Roman", 11) bold
	}
}
