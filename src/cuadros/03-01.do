* Macros auxiliares
local id "03-01"
local origen  "$proyecto/data/consultas"
local destino "$proyecto/data/cuadros"

* Especificación
.table = .ol_table.new
.table.rowvar = "cmd_lb"
.table.colvar = "año"

* Preparación de la BBDD
tempfile df1 df2
forvalues j = 1(1)2 {
  drop _all
  local i = 1
  save `df`j'', emptyok
  foreach var in "" "" "_superior_completa" "_mujer" {
    use "`origen'/`id' [`i'].dta", clear
  	.table.annualize_v`j', over("`var'")
    if (`i' >= 3) {
      .table.as_proportion, by("`var'")
      keep if (`var' == 1)
      drop `var'
    }
    replace cmd_lb = `i'
    append using `df`j''
    save `df`j'', replace
    local ++i
  }
  label define cmd_lb                      ///
    1 "Edad promedio"                      ///
    2 "Escolaridad promedio"               ///
    3 "% con educación superior completa"  ///
    4 "% de mujeres",                      ///
    modify
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
			"3.1. Características generales de los ocupados, 2010-2016", ///
			font("Times New Roman", 11) bold
	}
}
