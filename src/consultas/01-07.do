* Macros auxiliares
local id "01-07"

* Selección y mutación
use "$datos/PIB/PIB NSED", clear
gen_pib_rama1_v1
gen_pib_año
gen_pib_mes
replace _mes = mod(_mes + 1, 12)
generate bh = pib / 1000

* Agregación
collapse (sum) bh if (_rama1_v1 != .), by(_rama1_v1 _año)
generate cmd_type = "mean"
generate cv = 0

* Etiquetado
label variable bh "PIB encadenado (miles de MM$), desestacionalizado"
label variable cv "Coeficiente de variación (%)"

* Guardado
save "$proyecto/data/consultas/`id'.dta", replace
