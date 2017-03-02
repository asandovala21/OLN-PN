* Macros auxiliares y objetos temporales
local id "03-21"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{1: N}"
.table.cmds_fmt   = "{%15,0fc}"
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{1: Ocupados}"
.table.by         = "_conmutante_v1"
.table.along      = "_oficio1"
.table.margins    = "{_oficio1}"
.table.margins_lb = "{Nacional}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_conmutante_v1 _ocupado _oficio1"

* Estimación
.table.create
.table.annualize
.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
.table.add_asterisks
keep if (_conmutante_v1 == 1)
save "$proyecto/data/consultas/`id'.dta", replace
