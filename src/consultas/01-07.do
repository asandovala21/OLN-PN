* Macros auxiliares
local id "01-07"

* Selección y mutación
use "$datos/PIB/PIB NSED", clear
gen_pib_rama1_v1
gen_pib_año
gen_pib_mes
rename pib bh
replace _mes = mod(_mes + 1, 12)

* Agregación
collapse (sum) bh if (_rama1_v1 != .), by(_rama1_v1 _año _mes)
generate cmd_type = "total"

* Guardado
label variable bh "PIB encadenado (desestacionalizado)"
save "$proyecto/data/consultas/`id'.dta", replace
