* indicadores  : distribución de ventas, empresas y trabajadores
* subpoblación : ocupados que mantuvieron su empleo
* años         : 2015
* meses        :
* por          : sector
* según        :
* agregaciones : "sector"
* fuente       : SII

* Selección / Filtración
use "$datos/SII/SII - Estadísticas según sector.dta", clear
keep if año == 2015
keep sector ntrab nemp ventas

* Agregación de los sectore
gen_sii_rama1_v1, año("2015")
collapse (sum) ventas nemp ntrab, by(_rama1_v1)

* Mutación
local i = 1
local N = `c(N)' + 1
set obs `N'
foreach var in ventas nemp ntrab {
	egen suma = total(`var')
	replace `var' = 100 * `var' / suma
	replace `var' = 100 in `N'
	rename `var' bh`i'
	local ++i
	drop suma
}
replace _rama1_v1 = 1e6 in `N'
reshape long bh, i(_rama1_v1) j(mask)
generate cmdtype = "proportion"
generate cv = 0

* Etiquetado
label define mask 1 "% de ventas" 2 "% de empresas" 3 "% de trabajadores"
label values mask mask

* Guardado
save "$proyecto/data/tabla 02-09.do", replace

* Exportación
.table = .ol_table.new
.table.colvar = "mask"
.table.rowvar = "_rama1_v1"
.table.export_excel bh, file("tabla 02-09")
.table.export_excel cv, file("tabla 02-09")
