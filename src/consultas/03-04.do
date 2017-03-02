* Macros auxiliares y objetos temporales
local id "03-04"

* Especificación
.table = .ol_table.new
.table.cmds       = "{mean _esc}"
.table.cmds_lb    = "{1: Escolaridad promedio}"
.table.cmds_fmt   = "{%15,1fc}"
.table.years      = "2010 2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{1: Ocupados}"
.table.by         = ""
.table.along      = "_region_re_v1"
.table.margins    = "{_region_re_v1}"
.table.margins_lb = "{Nacional}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_esc _ocupado _region_re_v1"

* Estimación
.table.create
.table.annualize
.table.add_asterisks
save "$proyecto/data/consultas/`id'.dta", replace
