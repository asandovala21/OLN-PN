* Macros auxiliares
local id "01-08"

*===============================================================================
* Panel N°1 - Ocupados
*===============================================================================

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{N}"
.table.years      = "2015"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "_rama1_v1"
.table.aggregate  = "{_rama1_v1}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_ocupado _rama1_v1"

* Estimación
.table.create
save "$proyecto/data/consultas/`id' [1].dta", replace

*===============================================================================
* Panel N°2 - PIB
*===============================================================================

* Preparación de la BBDD
use "$datos/PIB/PIB NSCO.dta", clear
gen_pib_año
gen_pib_mes
gen_pib_rama1_v1
replace _mes = mod(_mes + 1, 12)
keep if (_año == 2015) & !inlist(_rama1_v1, ., 1e6)

* Distribución del PIB por sector, para cada región
rename pib bh
collapse (sum) bh if (_año == 2015), by(_rama1_v1)
quietly : summarize bh
replace bh = 100 * bh / `r(sum)'
generate cmd_type = "proportion"
generate cmd_lb = 2

* Etiquetado
label define cmd_lb 2 "%"
label values cmd_lb cmd_lb

* Guardado
save "$proyecto/data/consultas/`id' [2].dta", replace
