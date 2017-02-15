* Macros auxiliares
local id   "02-08"
local temp "_tamaño_empresa_v1"

* Panel N°1 - Especificación
.table = .ol_table.new
.table.cmds       = "{mean _yprincipal}"
.table.cmds_lb    = "{N}"
.table.years      = "2015"
.table.months     = ""
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "`temp' _cise_v3"
.table.aggregate  = "{`temp'} {_cise_v3} {`temp' _cise_v3}"
.table.src        = "esi"
.table.from       = "$datos"
.table.varlist0   = "_cise_v3 _ocupado `temp' _yprincipal"

* Panel N°1 - Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
