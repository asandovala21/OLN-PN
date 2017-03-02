* Macros auxiliares y objetos temporales
local id "03-05"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{1: N}"
.table.cmds_fmt   = "{%15,0fc}"
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{1: Ocupados}"
.table.by         = "_educ"
.table.along      = "_region_re_v1"
.table.margins    = "{_region_re_v1} {_educ}"
.table.margins_lb = "{Nacional} {Total}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_educ _ocupado _region_re_v1"

* Estimación
.table.create
.table.annualize
.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
.table.add_asterisks
keep if (cmd_lb == 2)
save "$proyecto/data/consultas/`id'.dta", replace
