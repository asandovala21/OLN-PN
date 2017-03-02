* Macros auxiliares y objetos temporales
local id "03-12"

* Especificación
.table = .ol_table.new
.table.cmds       = "{mean _yprincipal}"
.table.cmds_lb    = "{1: $}"
.table.cmds_fmt   = "{%15,0fc}"
.table.years      = "2010 2015"
.table.months     = ""
.table.subpops    = "{if _mantuvo_empleo == 1}"
.table.subpops_lb = "{1: Ocupados que mantuvieron su empleo}"
.table.by         = ""
.table.along      = "_rama1_v1"
.table.margins    = "{_rama1_v1}"
.table.margins_lb = "{Nacional}"
.table.src        = "esi"
.table.from       = "$datos"
.table.varlist0   = "_mantuvo_empleo _rama1_v1 _yprincipal"

* Estimación
.table.create
.table.annualize
.table.add_asterisks
save "$proyecto/data/consultas/`id'.dta", replace
