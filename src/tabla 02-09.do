* indicadores  : distribución de ventas, empresas y trabajadores
* subpoblación : ocupados que mantuvieron su empleo
* años         : 2015
* meses        :
* por          : sector
* según        :
* agregaciones : "sector"
* fuente       : SII

* Selección
use "$datos/SII/SII - Estadísticas sectoriales.dta", clear
keep if año == 2015

* Ordenación
drop año rem
sort sector ntrab nemp ventas

* Mutación
local N = `c(N)' + 1
set obs `N'
foreach var in ntrab nemp ventas {
	egen suma = total(`var')
	replace `var' = 100 * `var' / suma
	replace `var' = 100 in `N'
	drop suma
}
replace sector = 1e6 in `N'

* Etiquetado
label define sector 1e6 "Nacional", modify

* Guardado
*save "$proyecto/data/tabla 02-09.do", replace

