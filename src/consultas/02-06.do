* Macros auxiliares y objetos temporales
local id "02-06"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{1: N}"
.table.cmds_fmt   = "{%15,1fc} {%15,1fc} {%15,1fc}"
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{1: Ocupados}"
.table.by         = "_educ"
.table.along      = "_tamaño_empresa"
.table.margins    = "{_tamaño_empresa} {_educ}"
.table.margins_lb = "{Nacional} {Total}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_educ _ocupado _tamaño_empresa"

* Estimación
.table.create
.table.annualize
.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
.table.add_asterisks
save "$proyecto/data/consultas/`id'.dta", replace
