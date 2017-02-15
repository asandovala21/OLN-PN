* Macros auxiliares
local id "03-17"

* Especificación
.table = .ol_table.new
.table.cmds       = "{mean _yprincipal}"
.table.cmds_lb    = "{Ingreso promedio ocupación principal (M$)}"
.table.years      = "2010 2015"
.table.months     = ""
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "_oficio1"
.table.aggregate  = "{_oficio1}"
.table.src        = "esi"
.table.from       = "$datos"
.table.varlist0   = "_yprincipal _ocupado _oficio1"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
