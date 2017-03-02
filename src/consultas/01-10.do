* Macros auxiliares y objetos temporales
local id "01-10"

* BBDD
use "$datos/PIB/PIB RSCO.dta", clear
keep if (año == 2014)

* Distribución del PIB por sector, nación y para cada región
collapse (sum) pib, by(_region_tr_v1 _rama1_v2)
by _region_tr_v1 : egen pib_max = total(pib)
generate bh = 200 * pib / pib_max

* Ajustes finales
generate cmd_fmt  = "%15,1fc"
generate asterisk = ""
drop pib*

* Guardado
save "$proyecto/data/consultas/`id'.dta", replace
