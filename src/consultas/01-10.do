* Macros auxiliares
local id "01-10"

* Preparación de la BBDD
use "$datos/PIB/PIB RSCO.dta", clear
gen_pib_año
gen_pib_mes
gen_pib_rama1_v2
gen_pib_region_tr_v1
replace _mes = mod(_mes + 1, 12)
keep if (_año == 2014) & !inlist(_rama1_v2, ., 1e6)
preserve

* Distribución del PIB por sector, nación y para cada región
drop _all
tempfile df
save `df', emptyok
foreach var in "" "_region_tr_v1" {
  * Estimación
  restore, preserve
  collapse (sum) pib, by(_region_tr_v1 _rama1_v2)
  bysort _region_tr_v1 : egen pib_max = max(pib)
  generate bh = 100 * pib / pib_max
  generate cmd_type = "proportion"
  generate subpop_lb = 1
  generate cmd_lb = 1
  generate año = 2014
  generate o2 = 0
  generate cv = 0
  drop pib*

  * Anexión
  append using `df'
  save `df', replace
}

* Etiquetado
label define cmd_lb 1 "%"
label values cmd_lb cmd_lb

* Guardado
save "$proyecto/data/consultas/`id'.dta", replace
