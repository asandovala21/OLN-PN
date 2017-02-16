* Macros auxiliares
local id "02-02"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "_tamaño_empresa_v1"
.table.colvar = "subpop_lb cmd_lb"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
	* Ocupados (N)
  use "`origen'/`id' [1].dta", clear
	.table.annualize_v`j', over(" _tamaño_empresa_v1")
  replace cmd_lb = 1
  save `df`j'', replace
  * Ocupados (%)
  .table.as_proportion, by("_tamaño_empresa_v1")
	replace cmd_lb = 2
  append using `df`j''
	save `df`j'', replace
  * Empresas (N y %)
  use "`origen'/`id' [2].dta", clear
  replace subpop_lb = 2
  append using `df`j''
	label define subpop_lb 1 "Ocupados" 2 "Empresas", modify
  label define cmd_lb 1 "N" 2 "%", modify
  label values subpop_lb subpop_lb
  label values cmd_lb cmd_lb
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
			"2.1. Número de empresas y ocupados según tamaño de empresa, 2014", ///
			font("Times New Roman", 11) bold
	}
}
