* Macros auxiliares
local id   "02-06"
local temp "_tamaño_empresa_v1"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{N}"
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "`temp' _educ"
.table.aggregate  = "{`temp'} {_educ} {`temp' _educ}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_educ _ocupado `temp'"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
