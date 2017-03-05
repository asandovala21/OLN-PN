* Macros auxiliares y objetos temporales
local id "07-02"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter} {proportion _tramo_edad_v3}"
.table.cmds_lb    = "{1: N} {2: %}"
.table.cmds_fmt   = "{%15,0fc} {%15,1fc}"
.table.years      = "2015"
.table.months     = ""
.table.subpops    = "{if _nini == 1}"
.table.subpops_lb = "{1: NINI's}"
.table.by         = "_tramo_edad_v3"
.table.along      = "_mujer"
.table.margins    = "{_tramo_edad_v3} {_mujer}"
.table.margins_lb = "{Total} {Total}"
.table.src        = "casen"
.table.from       = "$datos"
.table.varlist0   = "_mujer _nini _tramo_edad_v3"

* Estimación
.table.create
.table.add_asterisks
keep if inrange(_tramo_edad_v3, 1, 3)
save "$proyecto/data/consultas/`id'.dta", replace
