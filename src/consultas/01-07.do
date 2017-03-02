* Macros auxiliares y objetos temporales
local id "01-07"

* PIB, según sector y año
use "$datos/PIB/PIB NSED", clear
collapse (sum) pib if inrange(_rama1_v1, 1, 13), by(_rama1_v1 año)
generate bh = pib / 1000

* Ajustes finales
generate asterisk = ""
generate cmd_fmt  = "%15,0fc"
drop pib*

* Guardado
save "$proyecto/data/consultas/`id'.dta", replace
